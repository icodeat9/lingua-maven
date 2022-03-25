import jstime from "jstimezonedetect";
import $ from "jquery";

document.addEventListener("turbo:load", function(e) {
  var select = $('select#user_preferred_timezone')
  var option = $(`option[value="${jstime.determine().name()}"`);


  if (select.has('option').length > 0) {
    if (option) {
      option.attr("selected", true);
      option.html(option.text() + " (Recommended)");
    }
  }
})

document.addEventListener("turbo:click", function() { console.log("Hi")})
