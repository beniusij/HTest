require 'sinatra'
require_relative 'models/story'

@@story = Story.new("Once upon a time, there was big bad wolf.")
@@current_sentence = @@story.current

get '/' do
  @@current_sentence = @@story.root

  erb :layout
end

post '/' do
  id = params.keys[0]
  sentence = params[id]
  @@current_sentence.add_sentence_node(id, sentence)

  erb :layout
end

get '/select/:id' do
  @@current_sentence = @@current_sentence.get_sentence_node(params[:id])

  erb :layout
end

__END__

@@ layout
<html>
  <head>
    <title>Stories Web Builder</title>
    <style>
      td {
        border: 1px solid black;
      }
    </style>
  </head>
<body>
  <a href='/'>Back to the start.</a>
  <table>
  <tr>
    <td></td>
    <td>
    <% id = 1 %>
      <% if @@current_sentence.get_sentence_node(id) %>
        <%= erb :link, :locals => { id: id }  %>
      <% else %>
        <%= erb :form, :locals => { id: id } %>
      <% end %>
    </td>
    <td></td>
  </tr>
  <tr>
    <td>
    <% id = 2 %>
      <% if @@current_sentence.get_sentence_node(id) %>
        <%= erb :link, :locals => { id: id }  %>
      <% else %>
        <%= erb :form, :locals => { id: id } %>
      <% end %>
    </td>
    <td><%= @@current_sentence.sentence %></td>
    <td>
    <% id = 3 %>
      <% if @@current_sentence.get_sentence_node(id) %>
        <%= erb :link, :locals => { id: id }  %>
      <% else %>
        <%= erb :form, :locals => { id: id } %>
      <% end %>
    </td>
  </tr>
  <tr>
    <td></td>
    <td>
    <% id = 4 %>
      <% if @@current_sentence.get_sentence_node(id) %>
        <%= erb :link, :locals => { id: id }  %>
      <% else %>
        <%= erb :form, :locals => { id: id } %>
      <% end %>
    </td>
    <td></td>
  </tr>
</table>
</body>
</html>

@@ form
<form method='POST' action='/'>
  <input name='<%= id %>' value='' />
  <input type='submit' value='Submit' />
</form>

@@ link
<a href='/select/<%= id %>'>
  <%= @@current_sentence.get_sentence_node(id).sentence %>
</a>