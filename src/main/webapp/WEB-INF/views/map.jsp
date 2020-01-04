<!doctype html>
<%@page import="com.myproject.myapp.models.UserInfo"%>

<html lang="en">
<head>
<meta charset="utf-8" />
<link rel="icon" type="image/png" href="resources/img/favicon.ico">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Automated parking</title>

<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
<meta name="viewport" content="width=device-width" />
<link href="resources/css/bootstrap.min.css" rel="stylesheet" />
<link href="resources/css/animate.min.css" rel="stylesheet" />
<link href="resources/css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet" />
<style>
#map {
	height: 500px;
	width: 100%;
}

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
}

/* The Close Button */
.close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}
</style>
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
<link href="resources/css/pe-icon-7-stroke.css" rel="stylesheet" />

</head>
<body>

	<%
		UserInfo u = (UserInfo) session.getAttribute("userinfo");
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
					<li ><a href="userhome"> <i
							class="pe-7s-user"></i>
							<p>User Profile</p>
					</a></li>
					<li class="active"><a href="#" onclick="getLocation();return false;"> <i
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
									<li><a href="#"><%=u.getLatitude()%></a></li>
									<li><a href="#">${u.latitude}</a></li>
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
						<input type="text" id="mapsearch">
						<div id="map">Loading...</div>
					</div>
				</div>
			</div>
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <p>Some text in the Modal..</p>
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
<script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>




<script>
	function initMap() {
		var options = {
			zoom : 16,
			center : {
				lat :<%=u.getLatitude()%>,
				lng :<%=u.getLongitude()%>}
		}
		var map = new google.maps.Map(document.getElementById('map'), options);
		 var contentString = '<div><h3>Rameshwor parking lot</h3></div>'+
		 '<div><br> <p id="pa">Available= </p> </div> <button id="myBtn">Open Modal</button> '+
		 '<a href="#" onclick="nextpage1();return false;"> View </a>';

		var markers = [
				{
					coords : {
						lat : 27.657303,
						lng : 85.317228
					},
					iconImage : 'https://maps.google.com/mapfiles/kml/shapes/parking_lot_maps.png',
					content : contentString
						
						

				},

				{
					coords : {
						lat : 27.657569,
						lng : 85.327334
					},
					iconImage : 'https://maps.google.com/mapfiles/kml/shapes/parking_lot_maps.png',
					content : '<h3>Ohm parking lot</h3><br><p>5/8</p><br><a href="#" onclick="nextpage2();return false;">View</a>'
				},
				{
					coords : {
						lat : 27.656106,
						lng : 85.327656
					},
					iconImage : 'https://maps.google.com/mapfiles/kml/shapes/parking_lot_maps.png',
					content : '<h3>New plaza parking lot</h3><br><p>5/8</p><br><ahref="#" onclick="nextpage3();return false;">View</a>'
				},

				{
					coords : {
						lat :<%=u.getLatitude()%>,
						lng :<%=u.getLongitude()%>},
					content : '<h1>you are here</h1>'
				},

		];
		for (var i = 0; i < markers.length; i++) {
			addMarker(markers[i]);
		}
		function addMarker(props) {
			var marker = new google.maps.Marker({
				position : props.coords,
				map : map,
	
			});


			if (props.iconImage) {
				
				marker.setIcon(props.iconImage);
			}

			if (props.content) {
				var infoWindow = new google.maps.InfoWindow({
					content : props.content
				});

				marker.addListener('click', function() {
					infoWindow.open(map, marker);
				});
			}
		}


		var searchBox = new google.maps.places.SearchBox(document
				.getElementById('mapsearch'));
		google.map.event.addListener(searchBox, 'places_changed', function() {
			var places = searchBox.getPlaces();
			var bounds = new google.maps.LatLngBounds();
			var i, place;
			for (i = 0; place = places[i]; i++) {
				bounds.extend(place.geometry.location);
				marker.setPosition(place.geomatry.location);
			}
			map.fitBounds(bounds);
			map.setZoom(16);
		});

	}
</script>

<script type="text/javascript">
	function nextpage1() {
		var a = "Rameshwor";

		window.location
				.replace('${pageContext.request.contextPath}/userbook?parkingname='
						+ a);

	}

	function nextpage2() {
		var a = "ohm";

		window.location
				.replace('${pageContext.request.contextPath}/userbook?parkingname='
						+ a);

	}
	function nextpage3() {
		var a = "New Plaza";

		window.location
				.replace('${pageContext.request.contextPath}/userbook?parkingname='+ a);

	}
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
		var a = position.coords.latitude, b = position.coords.longitude;
		window.location
				.replace('${pageContext.request.contextPath}/addlocation?lat='
						+ a + "&long=" + b);

	}
	function showError(error) {
		switch (error.code) {
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
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAUC42lcWr8BbgLDvK1A60K9PmrptS6E48&callback=initMap&libraries=places">
	

 
</script>
<script src="resources/js/home.js"></script>





</html>
