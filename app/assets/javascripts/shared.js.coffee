when_ready = (f) -> $(document).on 'ready page:change', f

when_ready ->
  $('.best_in_place').best_in_place()
