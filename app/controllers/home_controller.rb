class HomeController < ApplicationController
  
  def index
  	@url = 'https://coinmarketcap.com/all/views/all/'
    if Currency.first == nil
  	  service_scrapping = ServiceScrapping.new(@url)
      service_scrapping.perform
    end 
    @currency = Currency.find(params[:currency_id]) unless params[:currency_id] == nil 
  end

  

end
