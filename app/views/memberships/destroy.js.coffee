$("#membership<%= @membership.id%>").remove()
$("#membership_user_id").prepend(
  $("<option value='<%= @membership.user.id%>'><%= @membership.user.username%></option>")
)
