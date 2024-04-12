require "sinatra"
require "sinatra/reloader"

get("/square/new") do
 erb(:square)

end
