$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  // alert("hello")
  $(".retweet").click(function(event) {
  	event.preventDefault();
  	alert("hy")
	   var tweet_id = $(this).attr('data-tweet-id');
	    $.ajax({
	    type: "POST",
	    url: "/retweet",

	    // accepts: "application/json",
	    dataType: "json",

	    data: { 'id' : tweet_id},
	    success: function(data){
	        window.location.href = '/tweet/new'
	        // this is the bit where you render stuff
	    }
	  });
	});
});
