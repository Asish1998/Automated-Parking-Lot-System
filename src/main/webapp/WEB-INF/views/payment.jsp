<!doctype html>

<%@page import="com.myproject.myapp.models.User"%>
<html lang="en">
<head>
<meta charset="utf-8" />
<link rel="icon" type="image/png" href="resources/img/favicon.ico">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Automated Parking</title>

<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
<meta name="viewport" content="width=device-width" />
<link href="resources/css/bootstrap.min.css" rel="stylesheet" />
<link href="resources/css/animate.min.css" rel="stylesheet" />
<link href="resources/css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet" />
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
<link href="resources/css/pe-icon-7-stroke.css" rel="stylesheet" />
 <script src="https://khalti.com/static/khalti-checkout.js"></script>
</head>
<body>
	<%
	User u=(User)session.getAttribute("user");
%>




	<div class="wrapper">
		<div class="sidebar" data-color="gray"
			data-image="resources/img/sidebar-5.jpg">

			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="userhome" class="simple-text"> PLAS
					</a>
				</div>

				<ul class="nav">
					<li><a href="userhome"> <i class="pe-7s-graph"></i>
							<p>Dashboard</p>
					</a></li>
					<li><a href="userhome"> <i class="pe-7s-user"></i>
							<p>User Profile</p>
					</a></li>
					<li class="active"><a href="#"
						onclick="getLocation();return false;"> <i
							class="pe-7s-map-marker"></i>
							<p>Maps</p>
					</a></li>
					<li><a href="#"> <i class="pe-7s-bell"></i>
							<p>Notifications</p>
					</a></li>
				</ul>
			</div>
		</div>

		<div class="main-panel">
			<nav class="navbar navbar-default navbar-fixed">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#navigation-example-2">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="userhome">Dashboard</a>
					</div>
					<div class="collapse navbar-collapse">
						<ul class="nav navbar-nav navbar-left">

							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown"> <i class="fa fa-globe"></i> <b
									class="caret hidden-lg hidden-md"></b>
									<p class="hidden-lg hidden-md">
										5 Notifications <b class="caret"></b>
									</p>
							</a>
								<ul class="dropdown-menu">
									<li><a href="#">Notification 1</a></li>
									<li><a href="#">Notification 2</a></li>
									<li><a href="#">Notification 3</a></li>
									<li><a href="#">Notification 4</a></li>
									<li><a href="#">Another notification</a></li>
								</ul></li>
							<li><a href=""> <i class="fa fa-search"></i>
									<p class="hidden-lg hidden-md">Search</p>
							</a></li>
						</ul>

						<ul class="nav navbar-nav navbar-right">
							<li><a href="#">
									<p><%=u.getFname()%></p>
							</a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">
									<p>
										Dropdown <b class="caret"></b>
									</p>
									

							</a>
								<ul class="dropdown-menu">
									<li><a href="#">Action</a></li>
									<li><a href="#">Another action</a></li>
									<li><a href="#">Something</a></li>
									<li><a href="#">Another action</a></li>
									<li><a href="#">Something</a></li>
									<li class="divider"></li>
									<li><a href="#">Separated link</a></li>
								</ul></li>
							<li><a href="userlogout">
									<p>Log out</p>
							</a></li>
							<li class="separator hidden-lg"></li>
						</ul>
					</div>
				</div>
			</nav>


			<div class="content">
				<div class="container-fluid">
					<div class="row">

						<div class="form-bottom">
							
							<form role="form" action="payment" method="post"
								class="login-form">
								<div class="form-group">
									<label class="sr-only" for="form-username">Name</label> <input
										readonly type="text" name="fname"
										placeholder="<%=u.getFname()%>"
										value="<%=u.getFname()%> <%=u.getLname() %>"
										class="form-username form-control" id="form-username">
								</div>
								<div class="form-group">
									<label class="sr-only" for="form-username">Cost</label> <input
										readonly type="text" name="fname" placeholder="${fee}"
										value="Rs. ${fee}" class="form-username form-control"
										id="form-username">
								</div>


								<div class="form-group">
									<label class="sr-only" for="form-username">Address</label> <input
										readonly type="text" name="address"
										placeholder="<%=u.getAddress() %>" value="<%=u.getAddress()%>"
										class="form-username form-control" id="form-username">
								</div>

								<div class="form-group">
									<label class="sr-only" for="form-password">Phone_number</label>
									<input type="text" name="phone"
										placeholder="valid Phone number"
										class="form-password form-control" id="form-password">
								</div>					
								

								<button type="submit" class="btn">Pay</button><p style="color: red">${error}</p>
							
							</form>
							<button id="payment-button">Pay with Khalti</button>
						</div>

					</div>
				</div>
			</div>

			<footer class="footer">
				<div class="container-fluid">
					<nav class="pull-left">
						<ul>
							<li><a href="userhome"> Home </a></li>
							<li><a href="#"> Company </a></li>
							<li><a href="#"> Portfolio </a></li>
							<li><a href="#"> Blog </a></li>
						</ul>
					</nav>
				</div>
			</footer>

		</div>
	</div>
	
	
	<script>
        var config = {
           
            "publicKey": "test_public_key_d7e8bf5aaa724c948117f3ffe0213278",
            "productIdentity": "1234567890",
            "productName": "Dragon",
            "productUrl": "http://gameofthrones.wikia.com/wiki/Dragons",
            "eventHandler": {
                onSuccess (payload) {
                    // hit merchant api for initiating verfication
                    console.log(payload);
                },
                onError (error) {
                    console.log(error);
                },
                onClose () {
                    console.log('widget is closing');
                }
            }
        };

        var checkout = new KhaltiCheckout(config);
        var btn = document.getElementById("payment-button");
        btn.onclick = function () {
            checkout.show({amount: 1000});
        }
    </script>
	


</body>
<script src="resources/js/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
<script src="resources/js/chartist.min.js"></script>
<script src="resources/js/bootstrap-notify.js"></script>
<script src="resources/js/light-bootstrap-dashboard.js?v=1.4.0"></script>
<script>
var x = document.getElementById("loc");

function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
       
    } else { 
        x.innerHTML = "Geolocation is not supported by this browser.";
    }
}

function showPosition(position) {
	  var a= position.coords.latitude,
	    b=position.coords.longitude;
    window.location.replace('${pageContext.request.contextPath}/addlocation?lat='+a+"&long="+b);
    
}
function showError(error) {
    switch(error.code) {
        case error.PERMISSION_DENIED:
            x.innerHTML = "User denied the request for Geolocation."
            break;
        case error.POSITION_UNAVAILABLE:
            x.innerHTML = "Location information is unavailable."
            break;
        case error.TIMEOUT:
            x.innerHTML = "The request to get user location timed out."
            break;
        case error.UNKNOWN_ERROR:
            x.innerHTML = "An unknown error occurred."
            break;
    }
}
</script>

<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDBA1mj6boWQUr7-IooZdPprPkK1yi82JI&callback=initMap&libraries=places">
    </script>

</html>
