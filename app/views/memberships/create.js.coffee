$('.<%= @membership.role%>').prepend("<%= j render(partial:'teams/members/membership', locals:{membership:@membership}) %>")
$("#membership_user_id option[value='<%= @membership.user.id%>']").remove()