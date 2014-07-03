// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$("#upvote").on('click', function(e){
  e.preventDefault();
  $.ajax({
    url: '/food_trucks/:food_truck_id/reviews/:id/upvote',
    dataType: 'json',
    type: "POST",
    success: function(data){
      //somehow update the cached_votes_score on the page
      //would be cool to change the color of the link to indicate the state of the vote
      alert("the score is now" + data.cached_votes_score);
    }
  });
});

$("downvote").on('click', function(e){
  e.preventDefault();
  $.ajax({
    url: '/food_trucks/:food_truck_id/reviews/:id/downvote',
    dataType: 'json',
    type: "POST",
    success: function(data){
      alert("the score is now" + data.cached_votes_score);
    }
  });
});


function upvote()
{
  $.ajax({
    url: '/food_trucks/:food_truck_id/reviews/:id/upvote',
    dataType: 'json',
    type: "POST",
    success: function(data){
      //somehow update the cached_votes_score on the page
      //would be cool to change the color of the link to indicate the state of the vote
      alert("the score is now" + data.cached_votes_score);
    };
  });
};
