$(document).ready(function() {
  $('#pacman').on('load', function() {
    $.post(window.location.pathname, function(response) {
      console.log(response)
      $('table').html(response)
    })
  })
});
