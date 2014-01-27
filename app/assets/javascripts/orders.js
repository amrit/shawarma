$(document).ready(function() {
  var pattern, wizard, x;
  $.fn.wizard.logging = true;
  wizard = $("#satellite-wizard").wizard({
    keyboard: true,
    contentHeight: 500,
    contentWidth: 700,
    backdrop: "static"
  });

  $("#open-wizard").click(function(e) {
    e.preventDefault();
    return wizard.show();
  });

  $("#close-wizard").click(function(e) {
    e.preventDefault();
    return wizard.close();
  });
});
