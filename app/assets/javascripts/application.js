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
//= require datatables

function saveHistory() {
  if (window.history.pushState) {
    window.history.pushState({}, "", $.url);
  }
}

function buildDataTable(selector){
  
  columns = $(selector + ' th').map(function(k, v) { return $(v).data() })
  order_column = columns.map( function(k, v) { if(v.order) return k;  } )[0] || 0;
  order_direction = columns.map( function(k, v) { return v.order;  } )[0] || 'asc';

  tableParams = {
    dom: "<'row'<'col-sm-12'f><'col-sm-12'tr>><'row'<'col-sm-5'i><'col-sm-7'p>>",
    pageLength: $(selector).data().pageLength,
    order: [[order_column, order_direction]],
    columns: columns,
    drawCallback: paginationDisplay
  };
  if(url = $(selector).data().ajaxUrl) {
    $.extend(tableParams, {
      processing: true,
      serverSide: true,
      sPaginationType: 'full_numbers',
      fnInfoCallback: function (oSettings, iStart, iEnd, iMax, iTotal, sPre) {
        return  "Showing " + (iTotal>0 ? iStart + " to " : '') + iEnd + " of " + iTotal + " entries";
      },
      ajax: {
        url: url,
        data: function (d, thing) {
          findClosestDatatableInputs(selector).each(function (k, v) {
            d[v.id] = inputValue(v);
          });
        },
        complete: saveHistory
      }
    });
  }

  var t = $(selector).DataTable(tableParams);
  findClosestDatatableInputs(selector).on( 'input change', function(e) { redrawTable(selector, e) } );

  t.on( 'click', 'tr.selectable', function (e) {
    markRowSelected('#' + $(this).attr('id'));
    if($(e.target).is('a')){
      window.location = $(e.target).attr('href');
      return false;
    } else {
      $(this).find('a').click();
    }
  } );
  selectPage(t, '.selected');

  return t;
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
