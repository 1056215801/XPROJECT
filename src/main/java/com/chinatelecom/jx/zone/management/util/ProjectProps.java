package com.chinatelecom.jx.zone.management.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;


public class ProjectProps {
	private static Properties props = new Properties();

	static {
		InputStream in = Thread.currentThread().getContextClassLoader()
				.getResourceAsStream("project.properties");
		// InputStream in =
		// ProjectProps.class.getClassLoader().getResourceAsStream("project.properties");
		try {
			props.load(in);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static Properties getProps() {
		return props;
	}
	public static String getProp(String key) {
		if(getProps().get(key)==null)
			return "";
		else
			return (String) getProps().get(key);
	}
	public static String getAttBaseLocation() {

		String osName = System.getProperties().getProperty("os.name");
		if (osName.indexOf("Windows") >= 0)
			return (String) getProps().get("win.att.upload.path");
		else
			return (String) getProps().get("lin.att.upload.path");
	}
}