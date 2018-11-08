class ServiceScrapping

require 'rubygems'
require 'open-uri'
require 'nokogiri'

	def initialize(url)
		@url = url
	end

	def coin
	    page = Nokogiri::HTML(open(@url))
	    value = page.css(".price")
	    array_value = []
	    value.each do |node| #On récupère les prix et on les met dans un array
	        array_value.push(node.text)
	    end
	    names = page.css(".currency-name-container.link-secondary")
	    array_names = []
	    names.each do |node| #On récupère les currencies et on les met dans un array
	        array_names.push(node.text)
	    end
	    super_array = []
	    counter = 0
	    while counter < array_value.size #On créée un array qui contient tous les hashs regroupant le couple currency-price
	        hash = {:money => array_names[counter], :price => array_value[counter]}
	        super_array << hash
	        counter += 1
	    end 
	    return super_array

	end


	def save(coin)
		currency_table = Currency.new
		coin.each do |element|
			currency_table = Currency.create!(currency_name: element[:money], currency_value: element[:price])
		end
	end

	def perform
		save(coin)
	end



end