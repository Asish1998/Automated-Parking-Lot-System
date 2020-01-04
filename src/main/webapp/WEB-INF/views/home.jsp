<!doctype html>
<%@page import="com.myproject.myapp.models.UserInfo"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.myproject.myapp.models.User"%>
<html lang="en">
<head>
<meta charset="utf-8" />
<link rel="icon" type="image/png" href="resources/img/favicon.ico">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Automated parking</title>

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />
<link href="resources/css/bootstrap.min.css" rel="stylesheet" />
<link href="resources/css/animate.min.css" rel="stylesheet" />
<link href="resources/css/light-bootstrap-dashboard.css?v=1.4.0"
	rel="stylesheet" />
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300'
	rel='stylesheet' type='text/css'>
<link href="resources/css/pe-icon-7-stroke.css" rel="stylesheet" />

</head>
<body>
	<%
		User u = (User) session.getAttribute("user");
	%>
	<%
		UserInfo us = (UserInfo) session.getAttribute("userdetail");
	%>

	<div class="wrapper">
		<div class="sidebar" data-color="gray"
			data-image="resources/img/sidebar-5.jpg">

			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="userhome" class="simple-text"> PLAS </a>
				</div>

				<ul class="nav">
					<li class="active"><a href="userhome"> <i
							class="pe-7s-graph"></i>
							<p>Dashboard</p>
					</a></li>
					<li><a href="#l"> <i class="pe-7s-user"></i>
							<p>User Profile</p>
					</a></li>

					<li><a href="#" onclick="getLocation();return false;"> <i
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
							<li><a href="">
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
						<div>
							<table id="myTable" class="table table-striped">
								<thead>
									<tr class="danger">
										<th scope="col">S no.</th>
										<th scope="col">Parking Lot Name</th>
										<th scope="col">Token</th>
										<th scope="col">Entry time</th>
										<th scope="col">Depature time</th>
										<th scope="col">Remaining in Hours</th>
										<th scope="col">Cost</th>
										<th scope="col">Action</th>
										
									</tr>
								</thead>
								<tbody>
									<c:forEach var="userinfo" items="${ulist}">
										<tr class="success">
											<th scope="row">${userinfo.id}</th>
											<td>${userinfo.pname}</td>
											<td><%=u.getUid() %></td>
											<td>${userinfo.e_time}</td>
											<td>${userinfo.d_time}</td>
												<td id="hours">
												</td>
					<!-- <td id="minutes"></td>
					<td id="seconds"></td> -->
											<td>Rs. ${userinfo.totalFee}</td>
											<td>
						<input type="submit" class="btn" onclick="userlocation" value="View Location">
						<input type="submit" class="btn" onclick="deletestudent(${userinfo.id})" value="Delete">
					</td>
			
										</tr>
									</c:forEach> 
								</tbody>
							</table>
						</div>
						
		<script type="text/javascript">

			function countdown(){
				var now = new Date();
				var eventDate = new Date();
				

				var currentTiime = now.getTime();
				var eventTime = eventDate.setHours(16);

				var remTime = eventTime - currentTiime;

				var s = Math.floor(remTime / 1000);
				var m = Math.floor(s / 60);
				var h = Math.floor(m / 60);
			

				h %= 24;
				m %= 60;
				s %= 60;

				h = (h < 10) ? "0" + h : h;
				m = (m < 10) ? "0" + m : m;
				s = (s < 10) ? "0" + s : s;

				document.getElementById("hours").textContent = h+":00";
				document.getElementById("minutes").textContent = m;
				document.getElementById("seconds").textContent = s;

				setTimeout(countdown, 1000);
			}

			countdown();
		</script>
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


</body>
<script src="resources/js/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
<script src="resources/js/chartist.min.js"></script>
<script src="resources/js/bootstrap-notify.js"></script>
<script src="resources/js/light-bootstrap-dashboard.js?v=1.4.0"></script>

<script type="text/javascript">
	 $(window).load(function () {
         $(function () {
             if (!sessionStorage.getItem("runOnce")) {

            	 $(document).ready(function(){

                 	demo.initChartist();

                 	$.notify({
                     	icon: 'pe-7s-gift',
                     	message: "Welcome <%=u.getFname()%>"

                     },{
                         type: 'info',
                         timer: 5
                     });

             	});

                 sessionStorage.setItem("runOnce", true);
             }
         });
     });
	</script>

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

<script type="text/javascript">
		
		function editstudent(id) {
			window.location="${pageContext.request.contextPath}/"+id+"/edit";
		}
		
		function deletestudent(id) {
			var msg= confirm("do you want to delete?")
			if(msg==true){
			window.location="${pageContext.request.contextPath}/"+id+"/delete";
		}
		}
		
		$(document).ready(function(){
		    $('#myTable').DataTable();
		});
	
	
	</script>
	
	
<script src="https://www.gstatic.com/firebasejs/5.3.0/firebase.js"></script>
<script>
  // Initialize Firebase
  var config = {
    apiKey: "AIzaSyCLYl8U--mHKzRd9QCrfZQZO8QhCR20kig",
    authDomain: "single-odyssey-207213.firebaseapp.com",
    databaseURL: "https://single-odyssey-207213.firebaseio.com",
    projectId: "single-odyssey-207213",
    storageBucket: "",
    messagingSenderId: "204983392069"
  };
  firebase.initializeApp(config);
</script>
<script src="resources/js/home.js"></script>


</html>
