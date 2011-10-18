$(document).ready(function(){
  $("#search_box").autocomplete({
    source: "/suggestions.js"
  });
  $("#hub_name").autocomplete({
    source: "/suggestions.js"
  });
});
