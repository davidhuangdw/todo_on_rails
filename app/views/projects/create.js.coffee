$('#project_name').val('')
$('#projects').prepend("<%= j render(partial:'teams/projects/project', locals:{project:@project}) %>")
