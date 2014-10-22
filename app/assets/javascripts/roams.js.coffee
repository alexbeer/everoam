# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$.blueimp.fileupload.prototype.processActions.duplicateImage = (data, options) ->
  if data.canvas
    data.files.push(data.files[data.index])
  data

$.blueimp.fileupload.prototype.processActions.scaleDown2 = (data, options) ->
  return data unless data.canvas || data.img

  that = this

  resizeByHalf = (data) ->
    img = data.canvas || data.img
    newWidth = Math.floor(img.width / 2)
    newHeight = Math.floor(img.height / 2)

    if newWidth > options.maxWidth || newHeight > options.maxHeight
      opts = $.extend({}, options, { maxWidth: newWidth, maxHeight: newHeight, forceResize: true })
      that.processActions.resizeImage(data, opts).done (newData) ->
        data = newData
        resizeByHalf(data)
    else
      opts = $.extend({}, options, { forceResize: true })
      that.processActions.resizeImage(data, opts)

  return resizeByHalf(data)

setupFileUpload = (field) ->
  $(field).fileupload
    url: s3PresignedPosts[0].url
    type: 'POST'
    autoUpload: false
    formData: (form) ->
      fields = s3PresignedPosts.pop().fields
      $.map fields, (value, name) ->
        { name: name, value: value }
    paramName: 'file'
    dataType: 'XML'
    replaceFileInput: false
    disableImageResize: false
    imageForceResize: true
    processQueue: [
      {
        action: 'loadImage',
        fileTypes: /^image\/(gif|jpeg|png)$/,
        maxFileSize: 20000000
      }, {
        action: 'scaleDown2',
        maxWidth: 1000,
        maxHeight: 800
      }, {
        action: 'saveImage'
      }, {
        action: 'duplicateImage'
      }, {
        action: 'scaleDown2',
        maxWidth: 300,
        maxHeight: 300
      }, {
        action: 'saveImage'
      }, {
        action: 'duplicateImage'
      }, {
        action: 'scaleDown2',
        maxWidth: 100,
        maxHeight: 100
      }, {
        action: 'saveImage'
      }
    ]

  $(field).bind 'fileuploadprocessdone', (e, data) ->
    that = this
    @upFiles = data.files
    @totalSize = @upFiles[0].size + @upFiles[1].size + @upFiles[2].size
    @totalUploaded = 0

    $(this).siblings('.progress:first').slideDown()

    data.files = [@upFiles[0]]
    data.submit().success (result, textStatus, jqXHR) ->
      that.totalUploaded += that.upFiles[0].size
      thumb_url = $(result).find('Location:first').text()
      $(that).siblings('input[name*="image_thumb_url"]').val(thumb_url)
      $(that).parent().find('img').remove()
      $(that).parent().prepend('<img class="preview thumb" src="' + thumb_url + '">')

      data.files = [that.upFiles[1]]
      data.submit().success (result, textStatus, jqXHR) ->
        that.totalUploaded += that.upFiles[1].size
        $(that).siblings('input[name*="image_large_url"]').val($(result).find('Location:first').text())

        data.files = [that.upFiles[2]]
        data.submit().success (result, textStatus, jqXHR) ->
          $(that).siblings('input[name*="image_medium_url"]').val($(result).find('Location:first').text())
          $(that).siblings('.progress:first').slideUp()


  $(field).bind 'fileuploadprocessfail', (e, data) ->
    console.log 'fail: ', data

  $(field).bind 'fileuploadprogress', (e, data) ->
    percentage = Math.round((@totalUploaded + data.loaded) / @totalSize * 90)
    $(this).siblings('.progress:first').show().find('.progress-bar').attr('aria-valuenow', percentage).text(percentage + '%').css
      width: Math.round(percentage) + '%'

$ ->
  $('#roams').imagesLoaded ->
    $('#roams').masonry
      itemSelector: '.box'
      isFitWidth: true

  setupFileUpload $('form.roam input.custom-file-input:first')

  limitNumImages = ->
    numImages = $('form.roam .images-fields').length
    if numImages > 9
      $('form.roam #add_image_fields').hide()

  limitNumImages()

  $('form.roam #add_image_fields').click ->
    n = $('form.roam .images-fields').length
    p = $('form.roam .images-fields:first').clone().hide()
    p.find('input').each (i, input) ->
      newName = $(input).attr('name').replace('[0]', '[' + n + ']')
      $(input).attr('name', newName)

      if $(input).attr('id')
        newId = $(input).attr('id').replace('_0_', '_' + n + ']')
        $(input).attr('id', newId)

      $(input).removeAttr('checked').val('')

    p.find('img').remove()
    setupFileUpload p.find('input.custom-file-input')
    p.insertBefore(this)
    p.slideDown()

    limitNumImages()
