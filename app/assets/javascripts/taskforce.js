
document.addEventListener("DOMContentLoaded", function(event) { 
  
    $(document).on('click', '.panel-heading i.clickable', collapsePanel)
  
    console.log("Se cargó contenido")
    $('#step_definition_container')
      .on('cocoon:before-insert', function(e,step_to_be_added) {
        
      })
      .on('cocoon:after-insert', function(e, added_step) {
        new_id = new Date().getTime();
        var a = added_step.find(".unique");
        a.prop("id", new_id);
      })
      .on('cocoon:before-remove', function(e, step) {
        // allow some time for the animation to complete
        $(this).data('remove-timeout', 1000);
        // step.fadeOut('slow');
      });
});


function collapsePanel(event){
  var element = $('#'+event.target.id);
  if(!element.hasClass('panel-collapsed')) {
    element.parents('.panel').find('.panel-body').slideUp();
    element.addClass('panel-collapsed');
    element.removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down');
  } else {
    element.parents('.panel').find('.panel-body').slideDown();
    element.removeClass('panel-collapsed');
    element.removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up');
  }
}