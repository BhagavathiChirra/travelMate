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
  console.log(searchQuery);
  const URL = 'https://content.guardianapis.com/search';
  $.getJSON(URL, {
    q: searchQuery,
    section: 'travel',
    'api-key': 'cde3aa09-a7bf-4d4c-a07e-14eddc349b5a'
  })
  .done(updateNews)
  .fail()
};

const updateNews = data => {
  console.log(data);
  $('#articles').empty();
  data.response.results.forEach(function(item){
    // console.log(item.title);
    $('<a>', {
      href: item.webUrl,
      html: item.webTitle,
      target: '_blank',
      id: 'articles'
    }).appendTo('#articles');
    $('<br>').appendTo('#articles');
    // $('<p>').html(item.title).appendTo('#articles');
  })
};

// searchNews(@user.address);
