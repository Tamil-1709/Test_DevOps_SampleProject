<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SampleProject._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
		<head>
			<title>Login V1</title>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1">
		<!--===============================================================================================-->
			<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
		<!--===============================================================================================-->
			<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
		<!--===============================================================================================-->
			<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
		<!--===============================================================================================-->
			<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
		<!--===============================================================================================-->
			<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
		<!--===============================================================================================-->
			<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
		<!--===============================================================================================-->
			<link rel="stylesheet" type="text/css" href="css/util.css">
			<link rel="stylesheet" type="text/css" href="css/main.css">
		<!--===============================================================================================-->
		</head>
		<body>
	<asp:Panel DefaultButton="butLogin" runat="server">
			<div class="limiter">
				<div class="container-login100">
					<div class="wrap-login100">
						<div class="login100-pic js-tilt" data-tilt>
							<img src="images/img-01.png" alt="IMG">
						</div>
						<div>
						<form class="login100-form validate-form">
							<span class="login100-form-title">
								Member Login
							</span>

							<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
								<input class="input100" id="txtusername" type="text" name="txtusername" placeholder="Email">
								<span class="focus-input100"></span>
								<span class="symbol-input100">
									<i class="fa fa-envelope" aria-hidden="true"></i>
								</span>
							</div>

							<div class="wrap-input100 validate-input" data-validate = "Password is required">
								<input class="input100" id="txtpassword" type="password" name="txtpassword" placeholder="Password">
								<span class="focus-input100"></span>
								<span class="symbol-input100">
									<i class="fa fa-lock" aria-hidden="true"></i>
								</span>
							</div>
					
							<div class="container-login100-form-btn">
								<input type="button" class="btn btn-success btn-md btn-block waves-effect waves-light capitalbutton"
									id="cmdlogin" name="Command" value="Login" accesskey="e" tabindex="4" />
							</div>

							<div class="text-center p-t-12">
								<span class="txt1">
									Forgot
								</span>
								<a class="txt2" href="#">
									Username / Password?
								</a>
							</div>

							<div class="text-center p-t-136">
								<a class="txt2" href="#">
									Create your Account
									<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
								</a>
							</div>
							 <asp:Button ID="butLogin" runat="server" OnClick="cmdlogin_ServerClick" Style="display: none" />
						</form>
							</div>
					</div>
				</div>
			</div>
	</asp:Panel>

		<script>
            $("#cmdlogin").click(function () {
                if ($('#txtpassword').val().length != 0)
                    $('#txtpassword').attr('type', 'password');
				if (($('#txtusername').val().length == 0) && ($('#txtpassword').val().length == 0)) {
					alert("Please enter your valid email and password!");
                }
                else if (($('#txtusername').val().length != 0) && ($('#txtpassword').val().length == 0)) {
					alert("Please enter your password");
                }
                else if (($('#txtusername').val().length == 0) && ($('#txtpassword').val().length != 0)) {
					alert("Please enter your email id");
                }
                else {
                   // RememberMe();
                    document.getElementById('<%= butLogin.ClientID %>').click();
            }
        });
        </script>

		<!--===============================================================================================-->	
			<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
		<!--===============================================================================================-->
			<script src="vendor/bootstrap/js/popper.js"></script>
			<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
		<!--===============================================================================================-->
			<script src="vendor/select2/select2.min.js"></script>
		<!--===============================================================================================-->
			<script src="vendor/tilt/tilt.jquery.min.js"></script>
			<script >
				$('.js-tilt').tilt({
					scale: 1.1
				})
			</script>
		<!--===============================================================================================-->
			<script src="js/main.js"></script>

		</body>

       
    </main>

</asp:Content>
