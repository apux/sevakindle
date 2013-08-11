# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


showFieldsForUrl = () ->
  $('.not_for_url').toggle(!$('#publicacion_leer_de_url').is(':checked'))

$ ->
  if $('#publicacion_leer_de_url').size() > 0
    showFieldsForUrl()
    $('#publicacion_leer_de_url').click -> showFieldsForUrl()
