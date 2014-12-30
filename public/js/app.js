$(document).ready(function(){
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

  $('#posts').on('click', '.upvote',function (event) {
    // debugger
    event.preventDefault();
    $target = $(event.target);
    $.ajax({
      url: $target.attr('href'),
      type: 'GET'
    }).done(function(response){
      $target.replaceWith('<h6>'+response+'</h6>')
    });
  });

  $('#posts').on('click', '.downvote', function (event) {
    event.preventDefault();
    $target = $(event.target);
    $.ajax({
      url: $target.attr('href'),
      type: 'GET'
    }).done(function(response){
      $target.replaceWith('<h6>'+response+'</h6>')
    });
  });

  $('#sort_form').on('click', '#sort', function (event) {
    event.preventDefault();
    $target = $(event.target);
    $.ajax({
      url: $target.attr('action'),
      type: 'GET',
      data: {order: $('#sort_by option:selected').text()}
    }).done(function(response){
      $('.post_list').replaceWith(response)
    });
  });
});
