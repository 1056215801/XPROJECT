package com.chinatelecom.jx.zone.management.websocket;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSON;
import com.jfinal.kit.StrKit;

/**
 * 路径：${ctx}/websocket/****
 * 
 * @ServerEndpoint 注解是一个类层次的注解，它的功能主要是将目前的类定义成一个websocket服务器端,
 *                 注解的值将被用于监听用户连接的终端访问URL地址,客户端可以通过这个URL来连接到WebSocket服务器端
 * @ServerEndpoint 可以把当前类变成websocket服务类
 */
@ServerEndpoint(value = "/websocket", configurator = GetHttpSessionConfigurator.class)
public class WSServer {

	private static int onlineCount = 0;
	// concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。 连接集合 userId => server 键值对
	// 线程安全
	private static ConcurrentHashMap<String, WSServer> map = new ConcurrentHashMap<String, WSServer>();
	// 与某个客户端的连接会话，需要通过它来给客户端发送数据
	private Session session;

	private static Logger logger = Logger.getLogger(WSServer.class);

	// 当前会话的httpsession
	private HttpSession httpSession;

	public WSServer() {
		// System.out.println(" ===WebSocket init===");
	}

	@OnOpen
	public void onOpen(Session session, EndpointConfig config) {
		// 得到httpSession
		this.httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
		// 获取session对象 SObject(这个就是java web登入后的保存的session对象，此处为用户信息，包含了userId)
		String user = null;// (String)
							// this.httpSession.getAttribute("currentUserId");
		this.session = session;
		if (StrKit.notBlank(user)) {
			// 针对一个用户只能有一个链接
			if (map.get(user) != null) {
				map.remove(user);
				subOnlineCount();
			}
			map.put(user, this);
			addOnlineCount();
		} else {
			map.put(this.httpSession.getId(), this);
			addOnlineCount();
		}
		logger.info("有新的连接，当前连接数为：" + getOnlineCount());
	}

	@OnClose
	public void onClose(Session session) {
		String user = (String) this.httpSession.getAttribute("currentUserId");
		if (StrKit.notBlank(user)) {
			map.remove(user);
			subOnlineCount();
		}
		logger.info("有一连接断开，当前连接数为：" + getOnlineCount());
	}

	/**
	 * 消息监听处理方法
	 * 
	 * @param message
	 * @param session
	 */

	@OnMessage
	public void onMessage(String message, Session session) {
		try {
			// 将消息转Msg对象
			Msg msg = JSON.parseObject(message, Msg.class);
			// 根据Msg消息对象获取定点发送人的userId
			WSServer _client = map.get(msg.getToUid());
			// 定点发送
			if (StrKit.notBlank(msg.getToUid())) {
				if (null != _client) {
					// 是否连接判断
					if (_client.session.isOpen())
						// 消息发送
						_client.session.getBasicRemote().sendText(JSON.toJSONString(msg.getData()));
				}
			}
			// 群发
			if (StrKit.isBlank(msg.getToUid())) {
				// 群发已连接用户
				for (WSServer client : map.values()) {
					if (client.session.isOpen())
						client.session.getBasicRemote().sendText(JSON.toJSONString(msg));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 获取当前时间
	 *
	 * @return
	 */
	private String getNowTime() {
		Date date = new Date();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format.format(date);
		return time;
	}

	/**
	 * 发生错误时调用
	 *
	 * @param session
	 * @param error
	 */
	@OnError
	public void onError(Session session, Throwable error) {
		System.out.println("发生错误");
		error.printStackTrace();
	}

	/**
	 * 这个方法与上面几个方法不一样。没有用注解，是根据自己需要添加的方法。
	 *
	 * @param message
	 * @throws IOException
	 */
	public static void sendMessage(Session session, String message) throws IOException {
		session.getBasicRemote().sendText(message);
		// this.session.getAsyncRemote().sendText(message);
	}

	public static synchronized int getOnlineCount() {
		return onlineCount;
	}

	public static synchronized void addOnlineCount() {
		onlineCount++;
	}

	public static synchronized void subOnlineCount() {
		onlineCount--;
	}

	/*
	 * private void sendToUser(Session session, String message) { String
	 * sendUserno = message.split("[|]")[1]; String sendMessage =
	 * message.split("[|]")[0]; String now = getNowTime(); try {
	 * System.out.println("=sendUserno=:" + sendUserno);
	 * System.out.println("=sendMessage=:" + sendMessage);
	 * 
	 * if (webSocketSet.get(sendUserno) != null) { String userno = (String)
	 * webSocketSet.get(session); this.sendMessage(session, now + "用户" + userno
	 * + "发来消息：" + " <br/> " + sendMessage); } else {
	 * System.out.println("当前用户不在线"); } } catch (IOException e) {
	 * e.printStackTrace(); } }
	 * 
	 * 
	 * private void sendAll(Session session, String message) { String now =
	 * getNowTime(); String sendMessage = message.split("[|]")[0]; // 遍历HashMap
	 * for (Session key : webSocketSet.keySet()) { try { // 判断接收用户是否是当前发消息的用户 if
	 * (!session.getId().equals(key.getId())) { String userno = (String)
	 * webSocketSet.get(key); this.sendMessage(key, now + "用户" + userno +
	 * "发来消息：" + " <br/> " + sendMessage); System.out.println("key = " + key); }
	 * } catch (IOException e) { e.printStackTrace(); } } }
	 * 
	 */

	/**
	 * 实现定点推送，sendMsg调用
	 */
	public static void pushBySys(Msg msg) {
		// msg传输的时候会带上需要发送消息给谁msg.getToUid()
		// 通过map去获取那个用户所在的session
		if (msg.getToUid() != null) {
			WSServer ws = map.get(msg.getToUid());
			try {
				if (ws != null) {
					ws.session.getBasicRemote().sendText(JSON.toJSONString(msg));
				}
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		} else {
			// 群发
			for (WSServer client : map.values()) {
				try {
					if (client.session.isOpen())
						client.session.getBasicRemote().sendText(JSON.toJSONString(msg));
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	public void close() {
		this.onClose(session);
	}
}
