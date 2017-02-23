$(document).on("turbolinks:load", function(){
  $("select#category_id").change(function(){
    $(this.form).submit();
  });
  $("input#status").change(function(){
    $(this.form).submit();
  });
});
