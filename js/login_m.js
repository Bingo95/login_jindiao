$(function() {
	var click_type = 0;

	$(function() {
		code_click();
		$("#login_code").focus();
	})

	//json
	function get_login_param() {
		var _param;
		var login_code = $("#login_code").val();
		var login_pwd = $("#login_pwd").val();
		var login_rand = $("#login_rand").val();
		_param = "login_code=" + login_code + "&login_pwd=" + login_pwd + "&login_rand=" + login_rand;
		/*_param = JSON.stringify(_param);*/
		//console.log("输出", _param) 
		return _param;
	}
	//ajax
	function get_login_ajax() {
		$.ajax({
			type: "post",
			dataType: "json",
			data: get_login_param(),
			beforeSend: function() {
				$.showLoading();
			},
			url: "getlogin",
			success: function(data) {
				$.hideLoading();
				//console.log("商品类型", data)
				if(data.back_type == 0) {
					window.location.href = "index.jsp";
				} else {
					click_type = 0;
					$("#error_title").html(data.back_value);
				}
			},
			error: function() {
				$.hideLoading();
				click_type = 0;
				$.alert("服务器繁忙，请稍候再试。")
			},
			complete: function() {}
		});
	}

	//获取系统时间
	$("#now_year").ready(function() {
		//为单数加个0
		function day_zero(s) {
			return s < 10 ? '' + s : s;
		}
		var myDate = new Date();
		//获取当前年
		var year = myDate.getFullYear();
		//获取当前月
		var month = myDate.getMonth() + 1;
		//获取当前日
		var date = myDate.getDate();
		/*当前时间*/
		var now = year + '-' + day_zero(month) + "-" + day_zero(date);

		$("#now_year").html(now.substring(0, 4));
	})

	//二维码切换
	function code_click() {
		$(".code_change").unbind("click").bind("click", function() {
			$(".code_logo").addClass("user_logo");
			$(".user_logo").removeClass("code_logo");
			$(".change_text").html("密码登录");
			$(".login-type").html("扫码绑定");
			$(".user_login").hide();
			$(".code_login").show();
			user_click();
		})
	}

	//登录切换
	function user_click() {
		$(".code_change").unbind("click").bind("click", function() {
			$(".user_logo").addClass("code_logo");
			$(".code_logo").removeClass("user_logo");
			$(".change_text").html("扫码绑定");
			$(".login-type").html("密码登录");
			$(".user_login").show();
			$(".code_login").hide();
			code_click();
		})
	}

	//登录
	$("#get_login").click(function() {
		var username = $("#login_code").val();
		var pwd = $("#login_pwd").val();
		var ident = $("#login_rand").val();
		if(username == "" || isNaN(username)) {
			$("#login_code").focus();
			$("#login_code").addClass("cancel_bag");
			$("#error_title").text("请输入正确用户号");
		} else if(pwd == "") {
			$("#login_pwd").focus();
			$("#login_pwd").addClass("cancel_bag");
			$("#error_title").html("请输入密码!");
		} else if(ident == "") {
			$("#login_rand").focus();
			$("#login_rand").addClass("cancel_bag");
			$("#error_title").html("请输入验证码!");
		} else {
			get_login_ajax();
		}
	})

	$(".login_input").focus(function() {
		$("#error_title").html("");
		$(".login_input").removeClass("input_bag");
		$(".login_input").removeClass("cancel_bag");
		$(this).addClass("input_bag");
		var a = $(this).val();
		$(this).val(a);
		this.select();
	})

	/*回车下一个*/
	$(".login_input").keydown(function() {
		var login_code = $("#login_code").val();
		var login_pwd = $("#login_pwd").val();
		var login_rand = $("#login_rand").val();

		if(event.keyCode == 13 || event.keyCode == 40) { //回车键的键值为13 上38 下40
			if($(this).val() == "") {
				if($(this).hasClass("userID")) {
					$("#error_title").html("请输入用户号!");
				} else if($(this).hasClass("userPWD")) {
					$("#error_title").html("请输入密码!");
				} else if($(this).hasClass("rand")) {
					$("#error_title").html("请输入验证码!");
				}
				$(this).addClass("cancel_bag");
			} else {
				if($(this).hasClass("userID")) {
					if(isNaN($(this).val())) {
						$("#login_code").focus();
						$("#error_title").html("请输入正确用户号！");
						$(this).addClass("cancel_bag");
					} else {
						$(this).parent().parent().next().children().find(".login_input").focus();
					}
				} else if($(this).hasClass("rand")) {
					if(click_type == 0) {
						$("#get_login").trigger("click");
						click_type = 1;
					}
				} else {
					$(this).parent().parent().next().children().find(".login_input").focus();
				}
			}
		} else if(event.keyCode == 38) {
			$(this).parent().parent().prev().children().find(".login_input");
			var t = $(this).parent().parent().prev().children().find(".login_input").attr("id");
			var a = $("#" + t).val();
			$("#" + t).val("").focus().val(a);
		}
	});

	//验证码
	$(document).ready(function() {
		jQuery('#VerificationCode').click(function() {
			$("#login_rand").focus();
			jQuery(this).attr('src', "VerificationCode.jsp?" + Math.random());
		})
	})
});