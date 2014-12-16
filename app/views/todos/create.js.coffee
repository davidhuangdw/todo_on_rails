$('#todo_name').val('')
$('#incomplete_todos').prepend("<%= j render(partial:'projects/todo',
      locals:{todo:@todo,members: @todo.project.team.members_to_select}) %>")

