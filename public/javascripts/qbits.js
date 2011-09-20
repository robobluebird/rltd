$(document).ready(function(){
  $('a.up').click(function(event){
      event.preventDefault();
      var url = $(this).attr('href');
      var $t = $(this);
      $.post(url,{vote:'up'},function(data){
        $t.siblings('#qbit_points').html(data.points);
      });
  });
  $('a.down').click(function(event){
      event.preventDefault();
      var url = $(this).attr('href');
      var $t = $(this);
      $.post(url,{vote:'down'},function(data){
        $t.siblings('#qbit_points').html(data.points);
      });
  });
});

