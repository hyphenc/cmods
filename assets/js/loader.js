var d = new Date();
//var currentHours = d.getHours();
/*if (d.getHours().toString().length > 1) {
  var currentHours = d.getHours();
} else {
  var currentHours = "0"+d.getHours();
}*/
var currentHours = d.getHours();
var currentMinutes = d.getMinutes();
var currentSeconds = d.getSeconds();
currentHours = (currentHours < 10 ? "0" : "") + currentHours;
currentMinutes = (currentMinutes < 10 ? "0" : "") + currentMinutes;
currentSeconds = (currentSeconds < 10 ? "0" : "") + currentSeconds;
var dString = currentHours + ":" + currentMinutes + ":" + currentSeconds;
document.getElementById("clock").innerHTML = dString;

if (d.getMonth()==11) {
  particlesJS.load("particles-js", "assets/profiles/snow.json");
} else {
  particlesJS.load("particles-js", "assets/profiles/default.json");
}
