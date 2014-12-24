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


  $('.upvote').on('click', function (event) {
    event.preventDefault();
    $target = $(event.target);

    console.log($target.attr('href'));
    $.ajax({
      url: $target.attr('href'),
      type: 'GET'
    }).done(function(response){
      console.log(response);
    });
  });

  $('.downvote').on('click', function (event) {
    event.preventDefault();
    $target = $(event.target);
    $.ajax({
      url: $target.attr('href'),
      type: 'GET'
    }).done(function(response){
      console.log(response);
    });
  });
});