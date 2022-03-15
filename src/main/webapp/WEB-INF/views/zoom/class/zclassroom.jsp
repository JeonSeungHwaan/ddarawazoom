<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <title>Zoom WebSDK</title>
    <meta charset="utf-8" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link type="text/css" rel="stylesheet" href="https://source.zoom.us/2.2.0/css/bootstrap.css" />
    <link type="text/css" rel="stylesheet" href="https://source.zoom.us/2.2.0/css/react-select.css" />
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
</head> 

<body>
    <style>
        .sdk-select {
            height: 34px;
            border-radius: 4px;
        }

        .websdktest button {
            float: right;
            margin-left: 5px;
        }

        #nav-tool {
            margin-bottom: 0px;
        }

        #show-test-tool {
            position: absolute;
            top: 100px;
            left: 0;
            display: block;
            z-index: 99999;
        }

        #display_name {
            width: 250px;
        }


        #websdk-iframe {
            width: 700px;
            height: 500px;
            border: 1px;
            border-color: red;
            border-style: dashed;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            left: 50%;
            margin: 0;
        }
    </style>

    <nav id="nav-tool" class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">Zoom Classroom</a>
            </div><br />
            <div id="navbar" class="websdktest">
                <form class="navbar-form navbar-right" id="meeting_form">
                    <div class="form-group">
                        <input type="text" name="display_name" value="${userInfo.nick}" id="display_name" maxLength="100"
                            placeholder="display name" class="form-control" required>  
                    </div>
                    <div class="form-group">
                        <input type="text" name="meeting_number" id="meeting_number" value="" maxLength="200"
                            style="width:150px" placeholder="Meeting Number" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <input type="text" name="meeting_pwd" id="meeting_pwd" value="" style="width:150px"
                            maxLength="32" placeholder="Meeting Password" class="form-control">
                    </div>
                    <div class="form-group">
                        <input type="text" name="meeting_email" id="meeting_email" value="" style="width:150px"
                            maxLength="32" placeholder="Email option" class="form-control">
                    </div>

                    <div class="form-group">
                        <select id="meeting_role" class="sdk-select">
                            <option value=0>수강생</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <select id="meeting_china" class="sdk-select">
                            <option value=0>Global</option>
                            <option value=1>China</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <select id="meeting_lang" class="sdk-select">
                       		<option value="ko-KO">Korean 한국어</option>
                            <option value="en-US">English</option>                     
                            <option value="jp-JP">Japanese 日本語</option>                                                 
                            <option value="zh-CN">Chinese 简体中文</option>
                            <option value="zh-TW">Chinese 繁体中文</option>                                                      
                        </select>
                    </div><br />

                    <input type="hidden" value="" id="copy_link_value" /><br />
                    <button type="submit" class="btn btn-primary" id="join_meeting">입장</button>                 
                    <button type="submit" class="btn btn-primary" id="clear_all">다시입력</button>
            		<input type="button" class="btn btn-primary" value="뒤로가기" onclick="window.location='/ddarawazoom/myclassroom'">
                </form> 
            </div>
            <!--/.navbar-collapse -->
        </div>
    </nav>
    
    <script>
        document.getElementById('show-test-tool-btn').addEventListener("click", function (e) {
            var textContent = e.target.textContent;
            if (textContent === 'Show') {
                document.getElementById('nav-tool').style.display = 'block';
                document.getElementById('show-test-tool-btn').textContent = 'Hide';
            } else {
                document.getElementById('nav-tool').style.display = 'none';
                document.getElementById('show-test-tool-btn').textContent = 'Show';
            }
        })
    </script>

    <script src="https://source.zoom.us/2.2.0/lib/vendor/react.min.js"></script>
    <script src="https://source.zoom.us/2.2.0/lib/vendor/react-dom.min.js"></script>
    <script src="https://source.zoom.us/2.2.0/lib/vendor/redux.min.js"></script>
    <script src="https://source.zoom.us/2.2.0/lib/vendor/redux-thunk.min.js"></script>
    <script src="https://source.zoom.us/2.2.0/lib/vendor/lodash.min.js"></script>
    <script src="https://source.zoom.us/zoom-meeting-2.2.0.min.js"></script>
    <script src="/resources/js/zoom/tool.js"></script>
    <script src="/resources/js/zoom/vconsole.min.js"></script>
    <script src="/resources/js/zoom/index.js?ver=12"></script> 
</body>

</html>