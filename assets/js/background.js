console.log("successfully loaded!");
chrome.commands.onCommand.addListener(function(command) {
  window.open("./bm.html");
  console.log("opened ./bm.html new tab");
  });
  