class HomeController < ApplicationController
  
  def index
    if Currency.first == nil
  	  service_scrapping = ServiceScrapping.new('https://coinmarketcap.com/all/views/all/')
      service_scrapping.perform
    end 
    @currency = Currency.find(params[:currency_id]) unless params[:currency_id] == nil 
  end

  

end
