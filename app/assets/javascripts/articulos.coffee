# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#articulo_unidad_medida_nombre').autocomplete
    source: $('#articulo_unidad_medida_nombre').data('autocomplete-source')

  jQuery ->
  $('#articulo_componente_nombre').autocomplete
    source: $('#articulo_componente_nombre').data('autocomplete-source')