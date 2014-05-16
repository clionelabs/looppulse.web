parseQueryString = ( queryString = "" ) ->
    params = {}

    # Split into key/value pairs
    queries = queryString.split("&");

    for q in queries
        temp = q.split('=');
        params[temp[0]] = temp[1];

    return params;

notify = (msg, klass) ->
  $('#top-note').remove()
  note = $("<div id=\"top-note\" class=\"alert alert-#{klass}\"><span class=\"msg\">#{msg}</span></div>")
  note.prependTo($("body"))

if $(".contact.page").size() > 0
  $(".contact.page .contact-form").on("submit", (e) ->
    e.preventDefault();
    entities = $(e.target).serializeArray()
    obj = {}
    for entry in entities
      obj[entry["name"]] = entry["value"]

    obj["name"] = obj["firstName"] + " " + obj["lastName"]

    payload = JSON.stringify(obj)

    $.ajax({
       url: 'https://looppulse-contact.firebaseio.com/.json',
       type: 'POST',
       data: payload,
       dataType: "json",
       success: (data) ->
         if(data.name)
          window.location = "index.html?contact_form_submit=SUCCESS"
         else
          notify("Failed to send the contact form. Please retry later", "error");
       error: (data) ->
        notify("Failed to send the contact form. Please retry later", "error");

    })
    return false
  )
  $(".contact.page select").each(() ->
    select = $(this);
    txt = select.attr("title");
    select.selectBoxIt({
      theme: "bootstrap"
      defaultText: txt

    })
  )

  $(".contact.page .required label").each(() ->
    $(this).attr("title", "This field is required.")
  ).tooltip({'placement':'auto right'}) # - optional

if $("main.index").size() > 0
  queryString = window.location.search
  queryString = queryString.substring(1)

  params = parseQueryString(queryString)
  if (params?.contact_form_submit == "SUCCESS")
    notify("Thanks for the message. Our team will get back to you shortly.", "success");
  
  #notify("Welcome", "info");

$('.navbar-collapse').on('show.bs.collapse', () ->
  $(this).addClass('collapse-visible')
)
