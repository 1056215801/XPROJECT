<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html>
<%@ include file="../common/commonPage.jsp"%>
<script type="text/javascript" src="${ctx}/static/js/h5uploader.js"></script>
<script type="text/javascript" src="${ctx}/static/js/plugins/diyUpload/js/webuploader.html5only.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/plugins/diyUpload/js/diyUpload.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/static/js/plugins/webuploader/webuploader.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/static/js/plugins/webuploader/webuploader.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/js/plugins/diyUpload/css/diyUpload.css" /> 
<link rel="stylesheet" type="text/css" href="${ctx}/static/js/plugins/diyUpload/css/webuploader.css">
<title>手机端附件上传</title>
<head>
    <title>Upload Files using XMLHttpRequest - Minimal</title>

    <script type="text/javascript">
// 第一种  
      function fileSelected() {
        var file = document.getElementById('fileToUpload').files[0];
        if (file) {
          var fileSize = 0;
          if (file.size > 1024 * 1024)
            fileSize = (Math.round(file.size * 100 / (1024 * 1024)) / 100).toString() + 'MB';
          else
            fileSize = (Math.round(file.size * 100 / 1024) / 100).toString() + 'KB';

          document.getElementById('fileName').innerHTML = 'Name: ' + file.name;
          document.getElementById('fileSize').innerHTML = 'Size: ' + fileSize;
          document.getElementById('fileType').innerHTML = 'Type: ' + file.type;
        }
      }

      function uploadFile() {
        var fd = new FormData();
        fd.append("fileToUpload", document.getElementById('fileToUpload').files[0]);
        var xhr = new XMLHttpRequest();
        xhr.upload.addEventListener("progress", uploadProgress, false);
        xhr.addEventListener("load", uploadComplete, false);
        xhr.addEventListener("error", uploadFailed, false);
        xhr.addEventListener("abort", uploadCanceled, false);
        xhr.open("POST", "${ctx}/saveAtt");
        xhr.send(fd);
      }

      function uploadProgress(evt) {
        if (evt.lengthComputable) {
          var percentComplete = Math.round(evt.loaded * 100 / evt.total);
          document.getElementById('progressNumber').innerHTML = percentComplete.toString() + '%';
        }
        else {
          document.getElementById('progressNumber').innerHTML = 'unable to compute';
        }
      }

      function uploadComplete(evt) {
        /* This event is raised when the server send back a response */
        alert(evt.target.responseText);
      }

      function uploadFailed(evt) {
        alert("There was an error attempting to upload the file.");
      }

      function uploadCanceled(evt) {
        alert("The upload has been canceled by the user or the browser dropped the connection.");
      }
    </script>
</head>
<body><h3> 页面：test0.jsp <br></h3>
<form id="form1" enctype="multipart/form-data" method="post" action="${ctx}/saveAtt">
<div class="row">
      <label for="fileToUpload">Select a File to Upload</label>
<input type="file" name="file" id="fileToUpload" onchange="fileSelected();"/>
    </div>
<div id="fileName"></div>
<div id="fileSize"></div>
<div id="fileType"></div>
<div class="row">
1:H5上传<input type="button" onclick="uploadFile()" value="上传" />
    </div>
<div id="progressNumber"></div>
</form>
 2：diyUpload <div id="test" ></div>
 3：H5Uploader <input type="file" id="myfile" value="" name="file" multiple="multiple"/><button id="uploader">Upload</button> <br>
 4：百度WebUploader
  <div id="uploader" class="">
 
 
    <!--用来存放文件信息-->
    <div id="thelist" class="uploader-list"></div>
    <div class="btns" id="lists">
        <div id="picker"><img  src= "" /></div>
        <div>aaaaaaaaaaaaaaaaaaaaaa</div>
    </div>
 </div>
 
</body>
<script type="text/javascript">
$(function() {
//第二 ： diyUpload	
	$('#test').diyUpload({
		url:'${ctx}/saveAtt',
		success:function( data ) {
			alert(data.attachmentUrl );
		},
		error:function( err ) {
			alert(err );	
		},
		buttonText : '选择图片',
		    chunked:true,
		    // 分片大小
		    chunkSize:512 * 1024,
		    //最大上传的文件数量, 总文件大小,单个文件大小(单位字节);
		    fileNumLimit:50,
		    fileSizeLimit:500000 * 1024,
		    fileSingleSizeLimit:50000 * 1024,
		    accept: {}
	});
//第四 ： WebUploader  
	var uploader = WebUploader.create({
	    // 选完文件后，是否自动上传。
	    auto: true,
	    // swf文件路径
	    swf: '${ctx}/static/js/plugins/webuploader/Uploader.swf',
	    // 文件接收服务端。
	    //server: '${ctx}/saveAtt',
	    server: '${ctx}/session/attachment/publish'  , 
	    fileVal :'attachment' ,
	    // 选择文件的按钮。可选。
	    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
	    pick: '#picker',
	    // 只允许选择图片文件。
	    accept: {
	        title: 'Images',
	        extensions: 'gif,jpg,jpeg,bmp,png',
	        mimeTypes: 'image/*'
	    },
	    formData:{
			'moduleId':'-1', 
			'remark':'测试附件test0'
		}
	});
	// 当有文件被添加进队列的时候
    var  thumbnailWidth  =100 ;
	var  thumbnailHeight =100 ;
	uploader.on( 'fileQueued', function( file ) {
	    var $li = $('<div id="' + file.id + '" class="file-item thumbnail"><img></div>');
	    var $img = $li.find('img');
	    // $list为容器jQuery实例
	    $('#lists').append( $li );
	    // 创建缩略图
	    // 如果为非图片文件，可以不用调用此方法。
	    // thumbnailWidth x thumbnailHeight 为 100 x 100
	    uploader.makeThumb( file, function( error, src ) {
	        if ( error ) {
	            $img.replaceWith('<span>不能预览</span>');
	            return;
	        }
	        $img.attr( 'src', src );
	    }, thumbnailWidth, thumbnailHeight );
	});
	// 文件上传过程中创建进度条实时显示。
	uploader.on( 'uploadProgress', function( file, percentage ) {
	    var $li = $( '#'+file.id ),
	        $percent = $li.find('.progress span');

	    // 避免重复创建
	    if ( !$percent.length ) {
	        $percent = $('<p class="progress"><span></span></p>')
	                .appendTo( $li )
	                .find('span');
	    }
	    $percent.css( 'width', percentage * 100 + '%' );
	});
	// 文件上传成功，给item添加成功class, 用样式标记上传成功。
	uploader.on( 'uploadSuccess', function( file ,response ) {
	    $( '#'+file.id ).addClass('upload-state-done');
	    alert(response.attachment.attachmentUrl);
	});
	// 文件上传失败，显示上传出错。
	uploader.on( 'uploadError', function( file ) {
	    var $li = $( '#'+file.id ),
	        $error = $li.find('div.error');
	    // 避免重复创建
	    if ( !$error.length ) {
	        $error = $('<div class="error"></div>').appendTo( $li );
	    }
	    $error.text('上传失败');
	});
	 
});

//第三： H5Uploader
var uploader = document.getElementById('uploader');
uploader.addEventListener("click", function(e) {
    H5Uploader.upload({
        action: '${ctx}/saveAtt',
        id: 'myfile',
        size: {
            max: 5000, // 5000kb 
            valide: function(e) {
                if (e) {
                    alert("The size of " + e.name + " is exceed max value!");
                }
            }
        }, // MB
        type: {
            name: 'csv;png;jpg',
            valide: function(e) {
                if (e) {
                    alert("The type of " + e.name + " is not supported!");
                }
            }
        },
        progress: function() {
                var p = document.createElement('p');
                p.innerHTML = "uploading";
                p.id = "loading";
                document.body.appendChild(p);
        },
        success: function(data) {
            alert(data);
            if (data && data == 200) {
                document.getElementById('loading').innerHTML = "The file upload successfully!";
                alert("The file upload successfully.");
            }
        },
        fail: function(data) {

        }
    });

}, false);





</script>
</html>