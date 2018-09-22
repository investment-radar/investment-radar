// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

document.addEventListener("ajax:error", function(event) {
  let detail = event.detail;
  let data = detail[0];
  console.log("Errors: " + data);
  console.log(detail[1]);
});
