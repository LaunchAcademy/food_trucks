$(document).ready(function() {
  $('.upvote').click( function(event) {
    // event.preventDefault();

    var $vote = $(event.currentTarget);
    // var $score = $(document.getElementById('$vote(id)'));
    // console.log($score)

    $.ajax({
      type: "POST",
      url: $vote.attr('href'),
      dataType: "json",
      success: function(review) {
        console.log('success handler called');

        console.log('this is the review: ' + review.cached_votes_score)
        // debugger
        $('#vote_score-' + review.id).text("Score: " + (review.get_upvotes.size review.get_downvotes.size) );
        // $score.replaceWith(review.cached_votes_score)
        //debugger;
        //alert("Vote happend"); // This won't work yet!
      }
    })
  });
  $('.downvote').click( function(event) {
    // event.preventDefault();

    var $vote = $(event.currentTarget);
    // var $score = $(document.getElementById('$vote(id)'));
    // console.log($score)

    $.ajax({
      type: "POST",
      url: $vote.attr('href'),
      dataType: "json",
      success: function(review) {
        console.log('success handler called');

        console.log('this is the review: ' + review.cached_votes_score)
        // debugger
        $('#vote_score-' + review.id).text("Score: " + review.cached_votes_score);
        // $score.replaceWith(review.cached_votes_score)
        //debugger;
        //alert("Vote happend"); // This won't work yet!
      }
    })
  });
});
