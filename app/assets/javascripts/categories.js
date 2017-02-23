$(document).on("turbolinks:load", function(){
  $("select#order").change(function(){
    $(this.form).submit();
  });
});
