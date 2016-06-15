$ ->
  console.log("hihello")
  readURL = (input) ->
    if input.files and input.files[0]
      reader = new FileReader

      reader.onload = (e) ->
        $('#img_prev').attr 'src', e.target.result
        return

      reader.readAsDataURL input.files[0]
    return

  $('#avatar-upload').change ->
    $('#img_prev').removeClass 'hidden'
    readURL this
    return
  return