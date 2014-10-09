# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

deleteImage = ->
  p = $(this).parent()
  id = $(this).attr('data-id')
  $.ajax
    url: '/roams/image/' + id
    type: 'DELETE'
    success: ->
      ids = $('input#roam_image_ids').val()
      ids = ids.replace(id, '').replace(/^,/, '').replace(/,$/, '')
      $('input#roam_image_ids').val(ids)
      p.remove()

setupFileUpload = (el) ->
  el.fileupload
    dataType: 'json'
    autoUpload: false
    replaceFileInput: false
    formData: (form) ->
      data = [{ name: 'caption', value: $(el).siblings('input.caption:first').val() }]
      id = $(el).parent().attr('data-id')
      if id
        data.push { name: 'id', value: id }
      data
    done: (e, data) ->
      ids = $('input#roam_image_ids').val().split(',')
      ids.shift() if ids[0] == ''
      ids.push data.result.id
      $('input#roam_image_ids').val(ids.join(','))
      $(el).parent().find('img.loading').hide()
      $(el).parent().attr('data-id', data.result.id)
      console.log data.result
    add: (e, data) ->
      $(el).siblings('#save_image_button').show().click ->
        $(el).parent().find('img.loading').show()
        data.submit()

  $(el).find('button#delete_image_button').click ->

$ ->
  $('#roams').imagesLoaded ->
    $('#roams').masonry
      itemSelector: '.box'
      isFitWidth: true

  setupFileUpload $('form.roam input.custom-file-input:first')

  $('form.roam #add_image_fields').click ->
    p = $('form.roam #image_fields:first').clone().hide()
    p.find('input.caption').val('')
    p.find('img.loading').hide()
    setupFileUpload p.find('input.custom-file-input')
    p.insertBefore(this)
    p.slideDown()

  $('.delete_image_button').click(deleteImage)
