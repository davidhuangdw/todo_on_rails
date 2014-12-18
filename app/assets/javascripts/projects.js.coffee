window.set_todo_check = ->
  $('.todo_check').on 'click', (e)->
    li = $(@).closest('li')
    list_id = li.closest('ul').attr('id')
    target_id = if list_id=='complete_todos' then 'incomplete_todos' else 'complete_todos'
    li.prependTo("#"+target_id)

when_ready(set_todo_check)