$('#datepicker').datepicker()
#$('#validate_ip').text('Not Valid IP');

#$('#validate_ip').text('Valid IP');
validateServerLabel = (el) ->
  name = el.val()
  retValue = {}
  if name is ""
    retValue.status = false
    retValue.msg = "Please enter a label"
  else
    retValue.status = true
  retValue
validateFQDN = (el) ->
  $this = $(el)
  retValue = {}
  if $this.is(":disabled")
    
    # FQDN Disabled
    retValue.status = true
  else
    if $this.data("lookup") is 0
      retValue.status = false
      retValue.msg = "Preform lookup first"
    else
      if $this.data("is-valid") is 0
        retValue.status = false
        retValue.msg = "Lookup Failed"
      else
        retValue.status = true
  retValue
lookup = ->
  
  # Normally a ajax call to the server to preform a lookup
  $("#fqdn").data "lookup", 1
  $("#fqdn").data "is-valid", 1
  $("#ip").val "127.0.0.1"
$(document).ready ->
  $("#datepicker").datepicker()
  $.fn.wizard.logging = true
  wizard = $("#satellite-wizard").wizard(
    keyboard: false
    contentHeight: 400
    contentWidth: 700
    backdrop: "static"
  )
  $(".chzn-select").chosen()
  $("#fqdn").on "input", ->
    unless $(this).val().length is 0
      $("#ip").val("").attr "disabled", "disabled"
      $("#fqdn, #ip").parents(".form-group").removeClass "has-error has-success"
    else
      $("#ip").val("").removeAttr "disabled"

  pattern = /\b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b/
  x = 46
  $("#ip").on("input", ->
    unless $(this).val().length is 0
      $("#fqdn").val("").attr "disabled", "disabled"
    else
      $("#fqdn").val("").removeAttr "disabled"
  ).keypress((e) ->
    if e.which isnt 8 and e.which isnt 0 and e.which isnt x and (e.which < 48 or e.which > 57)
      console.log e.which
      false
  ).keyup ->
    $this = $(this)
    unless pattern.test($this.val())
      console.log "Not Valid IP"
      $this.parents(".form-group").removeClass("has-error has-success").addClass "has-error"
      $this.val $this.val().replace("..", ".")  while $this.val().indexOf("..") isnt -1
      x = 46
    else
      x = 0
      lastChar = $this.val().substr($this.val().length - 1)
      $this.val $this.val().slice(0, -1)  if lastChar is "."
      ip = $this.val().split(".")
      if ip.length is 4
        console.log "Valid IP"
        $this.parents(".form-group").removeClass("has-error").addClass "has-success"

  wizard.on "closed", ->
    wizard.reset()

  wizard.on "reset", ->
    wizard.modal.find(":input").val("").removeAttr "disabled"
    wizard.modal.find(".form-group").removeClass("has-error").removeClass "has-succes"
    wizard.modal.find("#fqdn").data("is-valid", 0).data "lookup", 0

  wizard.on "submit", (wizard) ->
    submit = hostname: $("#new-server-fqdn").val()
    @log "seralize()"
    @log @serialize()
    @log "serializeArray()"
    @log @serializeArray()
    setTimeout (->
      wizard.trigger "success"
      wizard.hideButtons()
      wizard._submitting = false
      wizard.showSubmitCard "success"
      wizard.updateProgressBar 0
    ), 2000

  wizard.el.find(".wizard-success .im-done").click ->
    wizard.hide()
    setTimeout (->
      wizard.reset()
    ), 250

  wizard.el.find(".wizard-success .create-another-server").click ->
    wizard.reset()

  $(".wizard-group-list").click ->
    alert "Disabled for demo."

  $("#open-wizard").click (e) ->
    e.preventDefault()
    wizard.show()

