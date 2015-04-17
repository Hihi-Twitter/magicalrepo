      <%if user.followers.include?(session[:id]) %>
       <% @follow = true %>
       <% puts session[:id]%>
        <% else %>
        <% @follow = false %>
        <% end %>
