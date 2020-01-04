<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="resources/assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="resources/assets/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="resources/assets/css/form-elements.css">
        <link rel="stylesheet" href="resources/assets/css/style.css">
        <link rel="shortcut icon" href="assets/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="resources/assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="resources/assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="resources/assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="resources/assets/ico/apple-touch-icon-57-precomposed.png">

    </head>

    <body>
        <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                  
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                            		<B>Register your account:</B>
                        		</div>
                            </div>
                            <div class="form-bottom">
                           <p style="color:red">${error}</p>
			                    <form role="form" action="usersignup" method="post" class="login-form">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-username">firstname</label>
			                        	<input type="text" name="fname" placeholder="Firstname..." class="form-username form-control" id="form-username">
			                        </div>
			                        <div class="form-group">
			                    		<label class="sr-only" for="form-username">lastname</label>
			                        	<input type="text" name="lname" placeholder="Lastname..." class="form-username form-control" id="form-username">
			                        </div>
			                        <div class="form-group">
			                    		<label class="sr-only" for="form-username">address</label>
			                        	<input type="text" name="address" placeholder="Address..." class="form-username form-control" id="form-username">
			                        </div>
			                          <div class="form-group">
			                    		<label class="sr-only" for="form-username">E-mail</label>
			                        	<input type="text" name="email" placeholder="Email address" class="form-username form-control" id="form-username">
			                        </div>
			                         <div class="form-group">
			                        	<label class="sr-only" for="form-password">Phone_number</label>
			                        	<input type="text" 	name="phone" placeholder="Phonenumber..." class="form-password form-control" id="form-password">
			                        </div>
			                        <div class="form-group">
			                        
			                    		<label class="sr-only" for="form-username">UID</label>
			                        	<input type="text" name="uid" placeholder="Username..." class="form-username form-control" id="form-username">
			                  <span id="username" class="eroor"></span>			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-password">Password</label>
			                        	<input type="password" name="password" placeholder="Password..." class="form-password form-control" id="form-password">
			                        </div>
			                        <button type="submit" class="btn">Sign up</button>
			                   
			                    </form>
		                    </div>
		                    <br>
		                   <a href='userlogin'><button type="submit" class="btn">Already have an account?</button></a>
                        	   
                        </div>
                    </div>
                                      </div>
                    </div>
                </div>
        
        <script src="resources/assets/js/jquery-1.11.1.min.js"></script>
        <script src="resources/assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="resources/assets/js/jquery.backstretch.min.js"></script>
        <script src="resources/assets/js/scripts.js"></script>
    </body>
</html>