   
  var id;
  var i = 1;

  $(document).ready(function () {
   document.getElementById("saveButton").onclick = function () {
     if (CheckNote("notename", "notecontent")) {
       var element = CreateNote();
       element.setAttribute("id", i++);
       var insert = document.getElementById("container");

       if (insert != null)
         insert.insertBefore(element, insert.firstChild);
       else
         document.getElementById("container").appendChild(element);
       return false;
     }
     return true;
   };

   document.getElementById("deleteButton").onclick = function () {
     var toRemove = document.getElementById(id);
     toRemove.parentElement.removeChild(toRemove);

     var insert = document.getElementById("deteledContainer");

     if (insert != null)
       insert.insertBefore(toRemove, insert.firstChild);
     else
       document.getElementById("deletedContainer").appendChild(toRemove);

     document.getElementById("g0" + toRemove.id).remove();
     document.getElementById("g1" + toRemove.id).remove();
     document.getElementById("g2" + toRemove.id).remove();
     document.getElementById("glyphContainer" + toRemove.id).appendChild(RestoreGlyph(toRemove.id));

     toRemove.className += " grayout";
   };

   document.getElementById("yesButton").onclick = function () {
     var toMove = document.getElementById(id);
     toMove.parentElement.removeChild(toMove);
     toMove.className += " grayout";

     document.getElementById("container").appendChild(toMove);
     var glyph = document.getElementById("g1" + toMove.id);
     glyph.removeAttribute("data-toggle");
     glyph.removeAttribute("data-target");
   };


   document.getElementById("editButton").onclick = function () {
     if (CheckNote("editname", "editcontent")) {
       var newTitle = document.getElementById("heading" + id);
       newTitle.textContent = document.getElementById("editname").value;

       var newBody = document.getElementById("glyphContainer" + id);
       newBody.textContent = document.getElementById("editcontent").value;
       newBody.innerHTML += '<br/><br/>';

       if (newBody.parentElement.parentElement.parentElement.id == "container")
         newBody = createGlyphs(newBody, id);
       else {
         newBody.appendChild(RestoreGlyph(id));
       }
       return false;
     };
     return true;
   };