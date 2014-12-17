window.when_ready = (f) -> $(document).on 'page:change', f

when_ready ->
  $('.best_in_place').best_in_place()
  $('.editable-icon').remove()
  $('.best_in_place').after("<span class='fa fa-pencil editable-icon'></span>")

