<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="JQueryFormValidation._default" %>

<!DOCTYPE html>
<html>
<head>
	<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<title>JQUERY REGSITRATION FORM</title>
</head>
<body>
	<div class="container">
		<BR/>
		<BR/>

		<h1 class="text-center text-warning">JQUERY RESGISTRATION FORM</h1>
		<DIV class="col-lg-8 m-auto d-block">
			<form class="form-signin" runat="server" action="test2.aspx">
				
			
			<div class="form-group">
				<label for="user">Username:</label>
				
                <asp:TextBox name="username" id="usernames" class="form-control" runat="server"></asp:TextBox>
				<h5 id="usercheck"></h5>

				<label for="passwords">Password:</label>
                <asp:TextBox name="password" id="passwords" class="form-control" runat="server"></asp:TextBox>
			
			    <h5 id="passcheck"></h5>

				<label for="cpasss">Conform Password:</label>
                <asp:TextBox  name="cpass" id="cpasss" class="form-control" runat="server"></asp:TextBox>
			
				<h5 id="cpasscheck"></h5>

				<label for="emailid">Email ID:</label>
                <asp:TextBox name="email" id="emailid" class="form-control" runat="server"></asp:TextBox>

				<h5 id="emailcheck"></h5>

				<label for="mobileno">Mobile No:</label>
                <asp:TextBox name="mobile" id="mobileno" class="form-control" runat="server"></asp:TextBox>
			
				<h5 id="mobilecheck"></h5>

			
                <asp:CheckBox value="remember-me" id="remember_me"  type="checkbox" runat="server" />


		<br />
                <asp:Button type="button" class="btn btn-large btn-primary" name="" value="Submit" id="submitbtn" runat="server" Text="Sign UP" OnClick="submitbtn_Click" />
			</div>
			</form>
			
		</DIV>
	</div>
	<script type="text/javascript">
		    $(document).ready(function() {
			$('#usercheck').hide();
			$('#passcheck').hide();
			$('#cpasscheck').hide();
			$('#emailcheck').hide();
			$('#mobilecheck').hide();

			var user_error =true;
			var pass_error=true;
			var cpass_error=true;
		    var email_error=true;
		    var mobile_error=true;


			$('#usernames').keyup(function() {
				username_check();

			});




			function username_check()
			{
				var user_val = $('#usernames').val();
				
				if(user_val.length == '')
				{
					$('#usercheck').show();
					$('#usercheck').html("Please Fill The User Name");
					$('#usercheck').focus();
					$('#usercheck').css("color","red")
					user_error=false;
					return false;

				}
				else
				{
					$('#usercheck').hide();
				}
					if((user_val.length <3) ||(user_val.lemgth>10))
				{
					$('#usercheck').show();
					$('#usercheck').html("Please User Name Lentgh Between 3 to 10");
					$('#usercheck').focus();
					$('#usercheck').css("color","red")
					user_error=false;
					return false;

				}
				else
				{
					$('#usercheck').hide();
				}

			}

			$('#passwords').keyup(function() 
			{
				password_check();
	
			});


			function password_check()
			{   
				var patern= /(?=^.{6,10}$)(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&amp;*()_+}{&quot;:;'?/&gt;.&lt;,])(?!.*\s).*$/;
				var pass_str=$('#passwords').val();

				if(patern.test(pass_str) && pass_str !='')
				{

					$('#passcheck').hide();
				}
				
				else
				{
					$('#passcheck').show();
					$('#passcheck').html("It expects atleast 1 small-case letter, 1 Capital letter, 1 digit, 1 special character and the length should be between 6-10 characters ");
					$('#passcheck').focus();
					$('#passcheck').css("color","red")
					pass_error=false;
					return false;
				}


			}

			$('#cpasss').keyup(function() 
			{
				cpassword_check();
	
			});

			function cpassword_check()
			{
				var cpass_str = $('#cpasss').val();
				var passs_str=$('#passwords').val();
				if(passs_str != cpass_str)
				{
					$('#cpasscheck').show();
					$('#cpasscheck').html("Password Mismatch");
					$('#cpasscheck').focus();
					$('#cpasscheck').css("color","red")
					cpass_error=false;
					return false;

				}
				else
				{
					$('#cpasscheck').hide();
				}



			
				}


				$('#emailid').keyup(function()
				 {

				 	email_check();
				   

				});


				function email_check()
				{

					var email_patern=/^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
					var email_str=$('#emailid').val();

					if(email_patern.test(email_str) && email_str !='')
					{
						$('#emailcheck').hide();
					}
					else
					{

					$('#emailcheck').show();
					$('#emailcheck').html("Please Enter Vallid Email ID");
					$('#emailcheck').focus();
					$('#emailcheck').css("color","red")
					email_error=false;
					return false;

					}
				}

					$('#mobileno').keyup(function()
				 {

				 	mobile_check();
				   

				});

					function mobile_check()
				{

					var mobile_patern=/([+]?\d{1,2}[.-\s]?)?(\d{3}[.-]?){2}\d{4}/;
					var mobile_str=$('#mobileno').val();

					if(mobile_patern.test(mobile_str) && mobile_str !='')
					{
						$('#mobilecheck').hide();
					}
					else
					{

					$('#mobilecheck').show();
					$('#mobilecheck').html("Phone Number With Country Code ");
					$('#mobilecheck').focus();
					$('#mobilecheck').css("color","red")
					mobile_error=false;
					return false;

					}
				}


				$('#submitbtn').click(function() {
					
					 user_error =true;
			         pass_error=true;
			         cpass_error=true;
			         email_error=true;
			         mobile_error=true;

			        username_check();
			        password_check();
			        cpassword_check();
			        email_check();
			        mobile_check();


			        if((user_error==true && pass_error==true && cpass_error==true && email_error==true && mobile_error==true))
				{
					alert("REGSITRATION SUCCESFULL");
					
					Response.Redirect("test2.aspx");
				}
				else
				{
					
					alert("Please Fill The Corectlly");
				}

				});




		});

		     $(function() {
 
                if (localStorage.chkbx && localStorage.chkbx != '') {
                    $('#remember_me').attr('checked', 'checked');
                    $('#usernames').val(localStorage.usrname);
                    $('#passwords').val(localStorage.pass);
                } else {
                    $('#remember_me').removeAttr('checked');
                    $('#usernames').val('');
                    $('#passwords').val('');
                }
 
                $('#remember_me').click(function() {
 
                    if ($('#remember_me').is(':checked')) {
                        // save username and password
                        localStorage.usrname = $('#usernames').val();
                        localStorage.pass = $('#passwords').val();
                        localStorage.chkbx = $('#remember_me').val();
                    } else {
                        localStorage.usrname = '';
                        localStorage.pass = '';
                        localStorage.chkbx = '';
                    }
                });
            });
		    
	</script>
</body>
</html>