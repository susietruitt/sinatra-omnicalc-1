require "sinatra"
require "sinatra/reloader"

get("/square/new") do
 erb(:square)

end

get("/square/results") do
  @square_number_var = params["number"]
  @square_var = @square_number_var.to_f * @square_number_var.to_f
  erb(:square_results)
end

get ("/square_root/new") do
  erb(:square_root)
end

get("/square_root/results") do
  @square_root_input = params["user_number"]
  @square_root_result = Math.sqrt(@square_root_input.to_f)
  erb(:square_root_results)
end

get("/payment/new") do
erb(:payment)
end

get("/payment/results") do
  @apr_input = params["user_apr"].to_f
  @r_input = @apr_input/100/12
  @dec_r_input = sprintf("%.4f%%", @r_input)
  @years_input = params["user_years"].to_i
  @n_input = @years_input*12
  @principal_input = params["user_pv"].to_f
  @dec_principal = format("%.2f", @principal_input)
  @payment_num = @r_input * @principal_input
  @payment_denom = 1 - ((1 + @r_input)** -@n_input)
  @payment = @payment_num/@payment_denom
  @dec_payment = format("%.2f", @payment)
  erb(:payment_results)


end
