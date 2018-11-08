class HomeController < ApplicationController
  
  def index

  	#service_scrapping = ServiceScrapping.new('https://coinmarketcap.com/all/views/all/')
  	#service_scrapping.perform
  end

  def currency_price_display

  	render 'index'
		puts "/////"
		@currency_name = Currency.find(params[:currency_id])
		puts @currency_name.currency_name
  end

end
