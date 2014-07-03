$(document).ready(function() {
  $('[upvote="upvote"]').click( function(event) {
    event.preventDefault();

    var $vote = $(event.currentTarget);

    alert('upvote!');

    $.ajax({
      type: "POST",
      url: $vote.attr('action'),
      dataType: "json"
    })
  });
});

$(document).ready(function() {
  $('[downvote="downvote"]').click( function(event) {
    event.preventDefault();

    $form = $(event.currentTarget);

    alert('downvote!');
  });
});
