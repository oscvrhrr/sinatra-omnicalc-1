require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square, layout: :layout)
end

get("/square/new") do 
  erb(:square, layout: :layout)
end

get("/square/results") do 
  @title = "Square"
  @number = params.fetch("number").to_f
  erb(:results, layout: :layout)
end

get("/square_root/new") do 
  erb(:square_root, layout: :layout)
end

get("/square_root/results") do
  @title = "Square Root"
  @number = params.fetch("square_root").to_f

  erb(:results, layout: :layout)
end

get("/payment/new") do 
  erb(:payment, layout: :layout)
end

get("/payment/results") do
  @title = "Payment"
  @apr = params.fetch("apr").to_f / 100
  @years = params.fetch("years").to_i
  @principal = params.fetch("principal").to_f

  monthly_rate = @apr.to_f / 12
  total_payments = @years * 12

  @monthly = @principal * (monthly_rate * (1 + monthly_rate)**total_payments) / ((1 + monthly_rate)**total_payments - 1)
  @monthly = @monthly.to_fs(:currency)
  @apr = @apr * 100
  @apr = @apr.to_fs(:percentage, { :precision => 4 })
  @principal = @principal.to_fs(:currency)

  erb(:results, layout: :layout)
end

get("/random/new") do 
  erb(:random, layout: :layout)
end

get("/random/results") do
  @title = "Random"
  @min = params.fetch("min").to_f
  @max = params.fetch("max").to_f
  @random = rand(@min..@max)


  erb(:results, layout: :layout)
end
