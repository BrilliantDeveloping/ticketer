$(document).ready ->
  # Priorities
  $('.priority1').addClass ''
  $('.priority2').addClass 'label-primary'
  $('.priority3').addClass 'label-warning'
  $('.priority4').addClass 'label-danger'
  # Statuses
  $('.status1').addClass 'label-default'
  $('.status2').addClass ''
  $('.status3').addClass 'label-warning'
  $('.status4').addClass 'label-info'
  $('.status5').addClass 'label-primary'
  $('.status6').addClass 'label-success'
  
  $("select").selecter("enable", "1")