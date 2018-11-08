class HomeController < ApplicationController
  
  def index

  	service_scrapping = ServiceScrapping.new('https://coinmarketcap.com/all/views/all/')
  	service_scrapping.perform

  end

end
