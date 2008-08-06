require File.join(File.dirname(__FILE__), "..", "lib", "micro-mack")

app.get("/") do
  text "hello world!"
end

app.get("/foo") do
  inline "<%= 1 + 1 %>"
end

app.get("/posts/new") do
 text %{
<form action="/posts/create" method="post">
  <input type="text" name="id" value=""/>
  <input type="submit" value="Submit" />
</form>
  }
end

app.post("/posts/create") do
  text "id: #{params[:id]}"
end

MicroMack.start!