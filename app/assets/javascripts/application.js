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
//= require turbolinks

//= require jquery3

function saveHistory() {
  if (window.history.pushState) {
    window.history.pushState({}, "", $.url);
  }
}

function buildDataTable(selector){
  new DataTable(selector);
}

function findClosestDatatableInputs(selector){
  return $(selector).parents().has('.datatable_input').first().find('.datatable_input');
}

function inputValue(selector) {
  if( $(selector).attr('type') == "checkbox" ){
    return $(selector).is(':checked') ? 1 : 0;
  } else {
    return $(selector).val();
  }
}

function markRowSelected(selector){
  $('.selected').removeClass('selected');
  $(selector).addClass('selected');
}

function paginationDisplay(settings){
  if($(this).DataTable().page.info().pages > 1) {
    $(settings.nTableWrapper).find(".dataTables_paginate").show();
  } else {
    $(settings.nTableWrapper).find(".dataTables_paginate").hide();
  }
}

function selectPage(table, selector){
  row = table.row(selector);
  if(!row.length) { return; }
  page = Math.floor(row.index()/table.page.info()['length']);
  if(page != table.page()){
    table.page(page).draw( false );
  }
}

function superfluousChangeEvent(e, override) {
  override = typeof override !== 'undefined' ? override : false;
  // for text inputs, all the necessary handling is done on 'input' event
  // 'change' event is not fired until user moves to another field
  // don't process change in that case unless we send data.override
  // TODO: we may be able to get rid of condition for data.override
  if(e.type == 'input'){
    $.last_input = e.target;
  }
  if(e.type == 'focus' || e.type == 'blur'){
    return true;
  }
  if(e.type == 'change' && override){
    if($.last_input == e.target)
      return true;
  }
}

function redrawTable(selector, e){
  if($.datatableTimeout){
    if(superfluousChangeEvent(e)){
      return;
    }
    clearTimeout($.datatableTimeout);
  }
  $.url = UpdateQueryString(e.target.name, inputValue(e.target)); // save updated search params in url
  $.datatableTimeout = setTimeout(function() {
    $(selector).DataTable().draw();
  }, 200);
}

function buildDatatables() {
  $('.datatable').each(function(k,v){
    buildDataTable('#'+ $(v).attr('id'));
  })
}

$(document).ready(function(){
  $.url = window.location.href;
  buildDatatables();
});
