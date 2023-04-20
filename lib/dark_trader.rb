require 'open-uri'
require 'nokogiri'
require 'pry'

def scrap_to_hash
  page = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))
  crypto_names = page.xpath('//tbody/tr/td[3]/div').map do |name|
    name.text
  end
  crypto_prices = page.xpath('//tbody/tr/td[5]/div/a').map do |price|
    price.text
  end
  if crypto_names.empty? == false && crypto_prices.empty? == false
    then puts "> Scrapping successful. Program has found #{crypto_names.length} crypto currencies with #{crypto_names.length} values \n \n" 
    else puts "Scrapping not successful. Check your internet connextion, or if https://coinmarketcap.com/all/views/all/ is online, or complain to The Hacking Project "
  end
  return crypto_hash = Hash[crypto_names.zip crypto_prices]
end

def reorganise(crypto_hash)
    final_array = []
  return puts final_array.push(crypto_hash)
end

def perform
  crypto_hash = scrap_to_hash
  reorganise(crypto_hash)
end

perform