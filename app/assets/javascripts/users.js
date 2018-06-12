// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
//
//

$( document ).ready(function() {

  // Only load from the news API on the users#show profile page
  if( $('body.users.show').length ){
    const country = $('#articles').data("article");
    console.log(country);
    searchNews(country)
  }

});

const searchNews = searchQuery => {
  // const address = `${"<%= @address.inspect.html_safe %>"}`;
  // console.log(address);
  console.log(searchQuery);
  const URL = 'https://api.newsriver.io/v2/search';
  $.ajaxSetup({
    headers : {
      'Authorization' : 'sBBqsGXiYgF0Db5OV5tAw6TRtAPZuQS1KWUp3WzS3spoIvLoT56AmBcIA-CX97czn2pHZrSf1gT2PUujH1YaQA'
      }
  });
  $.getJSON(URL, {
    query: encodeURI(searchQuery),
    sortBy: '_score',
    sortOrder: 'DESC',
    limit: '15'
  })
  .done(updateNews)
  .fail()
};

const updateNews = data => {
  console.log(data);
  $('#articles').empty();
  data.forEach(function(item){
    // console.log(item.title);
    $('<a>', {
      href: item.url,
      html: item.title,
      target: '_blank'
    }).appendTo('#articles');
    $('<br>').appendTo('#articles');
    // $('<p>').html(item.title).appendTo('#articles');
  })
};

// searchNews(@user.address);
