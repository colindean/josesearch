$(function(){

  $('input.query').autocomplete({
    source: "/suggestions.json"
  });

});
