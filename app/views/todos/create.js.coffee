$('#todo_name').val('')
$('#incomplete_todos').prepend("<%= j render(partial:'projects/todo',
      locals:{todo:@todo,members: @todo.project.team.members_to_select}) %>")
set_best_in_place()
set_todo_check()

