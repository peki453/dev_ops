// Return current time (h:m:s)
function getCurrentTime(){
    
    // Get current time
    var currentTime = new Date();
    var seconds = currentTime.getSeconds();
    var minutes = currentTime.getMinutes();
    var hours = currentTime.getHours();
    var currentTimeString = hours + ":" + minutes + "." + seconds;
    
    // Write current time to HTML file
    document.getElementById('siteBody').innerHTML = "<p style=\"font-size: 40px;\">" + currentTimeString + "</p>";
}