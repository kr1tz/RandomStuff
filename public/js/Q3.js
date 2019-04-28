//question 3


//insert a string that is the class/id of a div you want to hide/replace
function searchAndDestroy (divId) {
   
   //hiding the original div
   $(divId).hide().before(

      //insert a new div to replace the original div
      //once the new div is clicked it will be destroyed and the original div will now show
      $('<div></div>').text(divId).click(function(){
         $(this).remove();
         $(divId).show();
      })
   );
}