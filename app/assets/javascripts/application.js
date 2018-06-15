// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require jquery_ujs
//= require jquery3
//= require popper
//= require bootstrap
//= require_tree .

var menu_visible = false;

$(document).ready(function () {
  $('#menu').click(function() {

    if(menu_visible){
      console.log('hide');
      // $('.anim').toggleClass('reverse-animation');
      $('.overlay').toggleClass('anim');
      $('.content_body').toggleClass('small_content');
    } else {
      console.log('show');
      $('.overlay').toggleClass('anim');
      $('.content_body').toggleClass('small_content');
    }
    menu_visible = !menu_visible;
  });


  $("#slideshow > div:gt(0)").hide();

  setInterval(function() {
    $('#slideshow > div:first')
      .fadeOut(1000)
      .next()
      .fadeIn(1000)
      .end()
      .appendTo('#slideshow');
  },  3000);

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

    $('<a>', {
      href: item.webUrl,
      html: item.webTitle,
      target: '_blank',
      id: 'articles'
    }).appendTo('#articles');
    $('<br>').appendTo('#articles');
  })
};



const SearchWeather = searchQuery => {
  console.log(searchQuery);
  const URL = 'https://api.apixu.com/v1/current.json';
  $.getJSON(URL, {
    'key': '8d1b1b0ad2ae41cdbec103542181406',
    q: searchQuery
  })
  .done(updateWeather)
  .fail()
};

const updateWeather = data => {
  console.log(data);
  $('#weather').empty();
  $('<img/>', {
   src:"http:" + data.current.condition.icon,
   id:"weather_icon"}).appendTo('#weather');
  $('<p><strong>Condition:</strong> ' + data.current.condition.text + '</p>').appendTo('#weather');
  $('<p><strong>Temperature:</strong> ' + data.current.temp_c + ' celsius</p>').appendTo('#weather');
  $('<p><strong>Wind:</strong> ' + data.current.wind_kph + ' km/h</p>').appendTo('#weather');

};
