
document.addEventListener("DOMContentLoaded", function(event) { 
  
    $(document).on('click', '.step_panel .panel-heading i.clickable', collapseStepPanel)
    $(document).on('click', '.field_panel .panel-heading i.clickable', collapseFieldPanel)
  
    console.log("Se cargó contenido")
    $('.fields_container')
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


    $(function(){
      $('.type-container select').change(function() {

        if ($(this).val()=="OPTIONS") {
          console.log("SOY OPTIONS")
          var parent = $(this).parent().parent();
          var children = parent.children('.option-values');
          children.show()
        } else {
          console.log("SOY OTRA COSA")
          var parent = $(this).parent().parent();
          var children = parent.children('.option-values');
          children.hide()
        }
    });
});
});


function collapseStepPanel(event){
  console.log("Collapse step panel")
  var element = $('#'+event.target.id);
  if(!element.hasClass('panel-collapsed')) {
    element.parents('.step_panel').find('.panel-body').slideUp();
    element.addClass('panel-collapsed');
    element.removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down');
  } else {
    element.parents('.step_panel').find('.panel-body').slideDown();
    element.removeClass('panel-collapsed');
    element.removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up');
  }
}

function collapseFieldPanel(event){
  console.log("Collapse field panel")
  var element = $('#'+event.target.id);
  if(!element.hasClass('panel-collapsed')) {
    element.parents('.field_panel').find('.panel-body').slideUp();
    element.addClass('panel-collapsed');
    element.removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down');
  } else {
    element.parents('.field_panel').find('.panel-body').slideDown();
    element.removeClass('panel-collapsed');
    element.removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up');
  }
}