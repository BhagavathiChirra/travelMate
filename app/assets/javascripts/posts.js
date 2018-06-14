$( document ).ready(function() {

  if( $('body.posts.show').length ){

    $('form').submit(function(event){
      event.preventDefault();
      return false;
    });
    // This gets called when the page loads
    getCommentsJson();
    // getLikes();

    $('#btn_comment').on('click', function(){
      const content = $('#txt_area_comments').val();
      $.post({
        url: "http://localhost:3000/comments",
        data: { content:  content, post_id: postId } ,
      })
      .done(function (data) {
        $('#txt_area_comments').val('');
        const comment = data;
        displayComment(comment);
      })
      .fail(errorHandler);
    });


    $('#btn_like').on('click', function(){
      $.get({
        url: `http://localhost:3000/posts/${postId}/like`
      })
      .done(function(data){
        if(data.added){
          $("#btn_like").removeClass().addClass("fa fa-thumbs-down");
          $("#span_likes").text(data.likes);
        }else if(data.removed){
          $("#btn_like").removeClass().addClass("fa fa-thumbs-up");
          $("#span_likes").text(data.likes);
        }
      })
      .fail(errorHandler);
    });

  } // CSS controller/action test

});
// Making JSON call to get the comments belongs to that particular Post
const getCommentsJson = function(){
  const URL = `http://localhost:3000/comments/${postId}`;
  $.getJSON(URL,{
    format: 'json',
    nojsoncallback: 1
  })
  .done(getComments)
  .fail(errorHandler);
}
// This gets called on success
const getComments = data => {
  for(i=0; i< data.length; i++){
    const comment = data[i];
    displayComment(comment);
  }
};
const errorHandler = xhr => {
  console.warn('Error with comments request: ', xhr.responseText, xhr);
};

const displayComment = comment => {
  var $display_delete;
  if(userId === comment.user.id){

    $display_delete = $(`<a class="delete_comment">Delete?</a>`);
    $display_delete.on('click', function(){
      const url_destroy = `http://localhost:3000/comments/${ comment.id }`;
      // console.log('url', url_destroy);
      $.ajax({
        url: url_destroy,
        type: 'DELETE'
      })
      .done(function(){
        // $('#comments_div').html(""); // getCommentsJson();
        $(`#comment_${ comment.id }`).remove();
      })
      .fail(errorHandler);
    });
  }
  else {
    $display_delete = "";
  }
  var commentsContent = `<strong>Posted By:</strong><img src="${comment.user.image}" class="comment_user_image" /> ${comment.user.username}<br><strong>Comment:</strong> ${comment.content}`;
  $comment = $(`<div class="comment_div" id="comment_${ comment.id }">`).html(`<p class="commentbox">${ commentsContent }</p>`);
  $comment.append($display_delete);
  $comment.appendTo('#comments_div');
};
