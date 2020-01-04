	var rootref = firebase.database().ref().child("parkinginfo");
	rootref.on("child_added", snap => {
		
		var Space=snap.child("space").val();
		
		$("#pa").append(Space);
		setTimeout(1000);
		
	});
