<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>精雕建材系统</title>
		<link rel="stylesheet" type="text/css" href="css/weui.min.css" />
		<link rel="stylesheet" type="text/css" href="css/jquery-weui.min.css" />
		<link rel="stylesheet" type="text/css" href="css/pub.css" />
		<link rel="stylesheet" type="text/css" href="css/login_m.css" />
	</head>
	<!--[if !IE]><!-->

	<body>
		<!--<![endif]-->
		<!--[if IE]> <body class="cont_dispy_none"> <![endif]-->
		<div class="height-1-1 ">
			<div class="center">
				<div class="login-width">
					<div class="mag_btm_6p">
						<label class="login-title">精雕建材系统</label>
					</div>
					<div class="login-box">
						<div class="title_box">
							<label class="login-type">密码登录</label>
							<a class="code_logo code_change"></a>
							<div class="code_bag code_change">
								<label class="change_text">扫码绑定</label>
							</div>
						</div>
						<div class="user_login">
							<div class="form-box">
								<div class="form-box_title">
									<label>用户号</label>
								</div>
								<div class="from-box_input">
									<input id="login_code" type="text" class="login_input userID" maxlength="4"  onfocus="this.select()"/>
								</div>
							</div>
							<div class="form-box">
								<div class="form-box_title">
									<label>密码</label>
								</div>
								<div class="from-box_input">
									<input id="login_pwd" type="password" class="login_input userPWD" maxlength="8"  onfocus="this.select()"/>
								</div>
							</div>
							<div class="form-box">
								<div class="form-box_title">
									<label>验证码</label>
								</div>
								<div class="from-box_input">
									<input id="login_rand" type="text" pattern="[0-9]*" class="login_input rand" maxlength="4"  onfocus="this.select()"/>
								</div>
								<div class="ident_num">
									<img id="VerificationCode" src="VerificationCode.jsp" title="刷新" />
								</div>
							</div>
							<div class="form-box get_button_mag">
								<button id="get_login" class="get_button">登录</button>
							</div>
							<div class="mag_bom_30 text_align_center mag_top_dow10">
								<label id="error_title" class="error_title dispy_block"></label>
							</div>
						</div>
						<div class="code_login cont_dispy_none">
							<div class="code_login_box">
								<img src="sso_image/sso.png" />
								<label class="dispy_block mag_top_dow10">微信扫码绑定您的登录帐号</label>
							</div>
						</div>
					</div>
					<div class="weui-footer">
						<label class="weui-footer__text">Copyright © 2008-<label id="now_year"></label> 精雕软件</label>
					</div>
				</div>
			</div>
		</div>
	</body>
	<script src="js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/jquery-weui.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/weui/weui.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/login_m.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		//判断浏览器类型
		function myBrowser() {
			var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
			var isOpera = userAgent.indexOf("Opera") > -1;
			if(isOpera) {
				return "Opera";
			}; //判断是否Opera浏览器
			if(userAgent.indexOf("Firefox") > -1) {
				return "FF";
			} //判断是否Firefox浏览器
			if(userAgent.indexOf("Chrome") > -1) {
				return "Chrome";
			}
			if(userAgent.indexOf("Safari") > -1) {
				return "Safari";
			} //判断是否Safari浏览器
			if(userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1 && !isOpera) {
				return "IE";
			}; //判断是否IE浏览器
		}

		var Browser_type = myBrowser();
		if("IE" == Browser_type) {
			window.onload = function(window) {
				var theUA = window.navigator.userAgent.toLowerCase();
				if((theUA.match(/msie\s\d+/) && theUA.match(/msie\s\d+/)[0]) || (theUA.match(/trident\s?\d+/) && theUA.match(/trident\s?\d+/)[0])) {
					var ieVersion = theUA.match(/msie\s\d+/)[0].match(/\d+/)[0] || theUA.match(/trident\s?\d+/)[0];
					if(ieVersion < 10) {
						window.location.href = "login_pc.jsp";
					} else {
						$("body").show();
					};
				}
			}(window);
		}
		
		if("Opera" == Browser_type) {
			window.location.href = "login_pc.jsp";
		} 
	</script>

</html>