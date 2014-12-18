$(document).ready(function(){
  //add comment
  $('#comment_input').on('submit', function (event) {
    event.preventDefault();
    $target = $(event.target);
    console.log($target);
    $.ajax({
      url: $target.attr('action'),
      type: 'POST',
      data: $target.serialize()
    }).done(function (response) {
      $target.closest('#container').replaceWith(response);
    });
  });


  $('.votethumb').on('click', function (event) {
    event.preventDefault();
    $target = $(event.target);
    console.log($target);
    // $.ajax({
    //   url: $target.attr('action'),
    //   type: 'POST',
    //   data: $target.serialize()
    // }).done(function (response) {
    //   $target.closest('#container').replaceWith(response);
    // });
  });
});