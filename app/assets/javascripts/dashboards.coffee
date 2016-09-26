$(document).on "turbolinks:load", ->
  $('.alert').fadeTo(2000, 500).slideUp 500, ->
    $('.alert').hide('slow')