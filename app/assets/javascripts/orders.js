$(document).ready(function() {



  
  var pattern, wizard, x;
  $.fn.wizard.logging = true;
  wizard = $("#satellite-wizard").wizard({
    keyboard: true,
    contentHeight: 500,
    contentWidth: 700,
    backdrop: "static"

  });


  wizard.cards["organization-information"].on("validate", function(card) {
      var input = card.el.find("input");
      var name = input.val();
      if (name === "") {
          card.wizard.errorPopover(input, "Required.");
          return false;
      }
      return true;
  });

  wizard.cards["event-information"].on("validate", function(card) {
    var input = card.el.find("input.form-control");
    var name = input.val();
    if (name === "") {
        card.wizard.errorPopover(input, "Required.");
        return false;
    }
    return true;
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
