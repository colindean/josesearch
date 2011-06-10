$(function(){

  $('input.query').autocomplete({
    source: "/suggestions.json"
  });

  $('form.query').submit(function(e){
    e.preventDefault();
    $.ajax({
      url: '/search',
      data: { q: $('input.query').val(), pjax: true },
      dataType: 'json',
      success: function(data, textStatus, jqXHR){
        extData = data;
        if(data.length){
          handleMultipleSearchResults(data);
        }else{
          retrieveAndShow(data);
        }
      }
    });
    
  });

});

function handleMultipleSearchResults(data){
  $.each(data, function(i,v){
    addWork(v.work, v.url);
  });
}

function addWork(work, url){
  alert(work + ": " + url);
}

function retrieveAndShow(wo){
  $('#search').removeClass('centered');
  $('#search').addClass('stowed');
  $('body').append('<section class="content"/>');

  setTimeout("$('section.content').load('"+wo.url+"')", 2000);
}

var extData;
