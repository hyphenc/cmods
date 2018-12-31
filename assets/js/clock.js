function updateClock() {
    var currentTime = new Date();
    //var currentHours = currentTime.getHours();
    /*if (currentTime.getHours().toString().length > 1) {
      var currentHours = currentTime.getHours();
    } else {
      var currentHours = "0"+currentTime.getHours();
    }*/
    var currentHours = currentTime.getHours();
    var currentMinutes = currentTime.getMinutes();
    var currentSeconds = currentTime.getSeconds();
    currentHours = (currentHours < 10 ? "0" : "") + currentHours;
    currentMinutes = (currentMinutes < 10 ? "0" : "") + currentMinutes;
    currentSeconds = (currentSeconds < 10 ? "0" : "") + currentSeconds;
    var currentTimeString = currentHours + ":" + currentMinutes + ":" + currentSeconds;
    document.getElementById("clock").innerHTML = currentTimeString;
  }
setInterval(updateClock, 1000);