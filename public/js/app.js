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
      // debugger
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

  $('#sort').on('click', function (event) {
    event.preventDefault();
    $target = $(event.target);
    $.ajax({
      url: $target.attr('action'),
      type: 'GET',
      data: $('#sort_by').val()
    }).done(function(response){
      $('.post_list').replaceWith(response)
    });
  });
});


//'created_at DESC'
// <% posts.order('created_at DESC').each_with_index do |post, index| %>


//'created_at'
//  <% posts.order('created_at').each_with_index do |post, index| %>

//'up_count'
// <% postvotes.order('up_count DESC').each do |post_vote| %>
//   <% post = posts.find(post_vote.post_id) %>

//'down_count'
// <% postvotes.order('down_count DESC').each do |post_vote| %>
//   <% post = posts.find(post_vote.post_id) %>