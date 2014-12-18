$(".<%= @todo.html_list_class %>")
  .prepend("<%= j render partial:'projects/todo',
    locals:{todo:todo, member:todo.project.team.members_to_select} %>")