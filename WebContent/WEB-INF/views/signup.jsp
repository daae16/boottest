<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
<style type="text/css">
h1 {
	color: #000000;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<div class="limiter">
		<div class="container-login100"
			style="background-image: url('/res/images/Stkyof.gif');">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				<form class="login100-form validate-form">
					<span class="login100-form-title p-b-49">
						<h1>🆂🅸🅶🅽 🆄🅿◀</h1>

					</span>

					<div class="wrap-input100 validate-input m-b-10"
						data-validate="ID is reauired">
						<span class="label-input100">User ID</span> <input
							class="input100" type="text" name="ui_id" id="ui_id"
							placeholder="Type your ID"> <span class="focus-input100"
							data-symbol="&#x260C;"></span>
						<button type="button" onclick="checkId()">check ID</button>
					</div>

					<div class="wrap-input100 validate-input m-b-10"
						data-validate="Password is required">
						<span class="label-input100">Password</span> <input
							class="input100" type="password" name="ui_password"
							id="ui_password" placeholder="Type your password"> <span
							class="focus-input100" data-symbol="&#x260C;"></span>
					</div>


					<div class="wrap-input100 validate-input m-b-10"
						data-validate="ID is reauired">
						<span class="label-input100">User Name</span> <input
							class="input100" type="text" name="ui_name" id="ui_name"
							placeholder="Type your Name"> <span
							class="focus-input100" data-symbol="&#x260C;"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-10"
						data-validate="ID is reauired">
						<span class="label-input100">User Age</span> <input
							class="input100" type="text" name="ui_age" id="ui_age"
							placeholder="Type your Age"> <span class="focus-input100"
							data-symbol="&#x260C;"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-10"
						data-validate="BIRTH is reauired">
						<span class="label-input100">User Birth</span> <input
							class="input100" type="date" name="ui_birth" id="ui_birth"
							placeholder="Type your BirthDay"> <span
							class="focus-input100" data-symbol="&#x260C;"></span>
					</div>


					<div class="wrap-input100 validate-input m-b-10"
						data-validate="ID is reauired">
						<span class="label-input100">User Phone</span> <input
							class="input100" type="text" name="ui_phone" id="ui_phone"
							placeholder="Type your Phone"> <span
							class="focus-input100" data-symbol="&#x260C;"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-10"
						data-validate="ID is reauired">
						<span class="label-input100">User E-mail</span> <input
							class="input100" type="text" name="ui_email" id="ui_email"
							placeholder="Type your E-mail"> <span
							class="focus-input100" data-symbol="&#x260C;"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-10"
						data-validate="ID is reauired">
						<span class="label-input100">User Nickname</span> <input
							class="input100" type="text" name="ui_nickname" id="ui_nickname"
							placeholder="Type your Nickname"> <span
							class="focus-input100" data-symbol="&#x260C;"></span>
					</div>


					<div class="text-right p-t-8 p-b-20">
						<a href="#"> Forgot password? </a>
					</div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button type="button" class="login100-form-btn"
								onclick="doSignUp()">Sign Up</button>
						</div>
					</div>

					<div class="txt1 text-center p-t-54 p-b-10">
						<span> Or Sign Up Using </span>
					</div>

					<div class="flex-c-m">
						<a href="#" class="login100-social-item bg1"> <i
							class="fa fa-facebook"></i>
						</a> <a href="#" class="login100-social-item bg2"> <i
							class="fa fa-twitter"></i>
						</a> <a href="#" class="login100-social-item bg3"> <i
							class="fa fa-google"></i>
						</a>
					</div>

					<div class="flex-col-c p-t-80">
						<span class="txt1 p-b-17"> Or Sign Up Using </span> <a href="#"
							class="txt2"> Sign Up </a>
					</div>
				</form>
			</div>
		</div>
	</div>


	<div id="dropDownSelect1"></div>

	<script>
		function doSignUp() {
			var els = document.querySelectorAll('input');
			var params = {};
			for (var i = 0; i < els.length; i++) {
				var el = els[i];
				var keys = el.name.split('_');
				for (var j = 1; j < keys.length; j++) {
					keys[j] = keys[j].substring(0, 1).toUpperCase()
							+ keys[j].substring(1);
				}
				console.log(el.name);
				params[keys.join('')] = el.value;
			}
			console.log(params);

			params.cmd = 'signup';
			$.ajax({
				url : '/ajax/user',
				method : 'POST',
				data : JSON.stringify(params),
				contentType : 'application/json',
				success : function(res) {
					if (res.result === 1) {
						alert('회원가입이 완료되었습니다.');
						location.href = '/views/login';
					} else if (res.result === -1) {
						alert('이미 존재하는 아이디입니다.')
					}

				}

			})
		}

		function checkId() {
			var uiId = document.querySelector('#ui_id').value;

			$.ajax({
				method : 'GET',
				data : {
					uiId : id,
					cod : 'checkID'
				},

				success : function(res) {
					if (res.result) {
						alert('가입 가능한 아이디 입니다.');

					} else {
						alert('가입이 불가한 아이디 입니다.')

					}
				}

			});
		}
	</script>
</body>
</html>