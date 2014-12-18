window.when_ready = (f) -> $(document).on 'page:change', f

window.set_best_in_place = ->
  $('.best_in_place').best_in_place()
  $('.editable-icon').remove()
  $('.best_in_place').after("<span class='fa fa-pencil editable-icon'></span>")

when_ready(set_best_in_place)

