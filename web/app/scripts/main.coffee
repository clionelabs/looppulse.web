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
        alert("Success")
     
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
        