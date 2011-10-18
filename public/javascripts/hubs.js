$(document).ready(function(){
  $('a.linkhubclick').click(function(event){
    event.preventDefault();
    $('.linkhub').toggle();
  });
  $('#link_it').click(function(event){
    // event.preventDefault();
    // var url = $(this).attr('href');
    // var $t = $(this);
    // $.post(url,{vote:'up'},function(data){
    //   $t.siblings('#ibit_points').html(data.points);
    // });
  });
  $('#search_box').focus(function(event){
    if(this.value == "search for a hub") {
      this.value = "";
    }
  });
  $('#search_box').blur(function(event){
    if(this.value == "") {
      this.value = "search for a hub";
    }
  });
  $('a.addanlbit').click(function(event){
    event.preventDefault();
    $('.addlbit').toggle();
  });
  $('a.addanibit').click(function(event){
    event.preventDefault();
    $('.addibit').toggle();
  });
  $('a.addaqbit').click(function(event){
    event.preventDefault();
    $('.addqbit').toggle();
  });
  $('a.addatbit').click(function(event){
    event.preventDefault();
    $('.addtbit').toggle();
  });
  $('a.ibitup').click(function(event){
      event.preventDefault();
      var url = $(this).attr('href');
      var $t = $(this);
      $.post(url,{vote:'up'},function(data){
        $t.siblings('#ibit_points').html(data.points);
      });
  });
  $('a.ibitdown').click(function(event){
      event.preventDefault();
      var url = $(this).attr('href');
      var $t = $(this);
      $.post(url,{vote:'down'},function(data){
        $t.siblings('#ibit_points').html(data.points);
      });
  });
  $('a.lbitup').click(function(event){
      event.preventDefault();
      var url = $(this).attr('href');
      var $t = $(this);
      $.post(url,{vote:'up'},function(data){
        $t.siblings('#lbit_points').html(data.points);
      });
  });
  $('a.lbitdown').click(function(event){
      event.preventDefault();
      var url = $(this).attr('href');
      var $t = $(this);
      $.post(url,{vote:'down'},function(data){
        $t.siblings('#lbit_points').html(data.points);
      });
  });
  $('a.qbitup').click(function(event){
      event.preventDefault();
      var url = $(this).attr('href');
      var $t = $(this);
      $.post(url,{vote:'up'},function(data){
        $t.siblings('#qbit_points').html(data.points);
      });
  });
  $('a.qbitdown').click(function(event){
      event.preventDefault();
      var url = $(this).attr('href');
      var $t = $(this);
      $.post(url,{vote:'down'},function(data){
        $t.siblings('#qbit_points').html(data.points);
      });
  });
  $('a.tbitup').click(function(event){
      event.preventDefault();
      var url = $(this).attr('href');
      var $t = $(this);
      $.post(url,{vote:'up'},function(data){
        $t.siblings('#tbit_points').html(data.points);
      });
  });
  $('a.tbitdown').click(function(event){
      event.preventDefault();
      var url = $(this).attr('href');
      var $t = $(this);
      $.post(url,{vote:'down'},function(data){
        $t.siblings('#tbit_points').html(data.points);
      });
  });
});
