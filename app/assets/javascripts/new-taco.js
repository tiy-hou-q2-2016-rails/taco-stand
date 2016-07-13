// Makes turbolinks work with your jquery
document.addEventListener("page:update", function() {
  // console.log("event: turbolinks:load");
  $('[data-toggle="tooltip"]').tooltip()

  //$("a").on("click", function(){
  //  // alert("sup");
  //});

})
