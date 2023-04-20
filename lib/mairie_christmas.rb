require 'open-uri'
require 'nokogiri'
require 'pry'

def get_townhall_url_hash
  page_index = Nokogiri::HTML(URI.open('http://annuaire-des-mairies.com/val-d-oise.html'))
  townhall_urls_array = page_index.xpath('//*[@class="lientxt"]').map do |url|
    "https://www.annuaire-des-mairies.com#{url['href'][1..-1]}"
  end
  townhall_names = page_index.xpath('//*[@class="lientxt"]').map do |href|
    href.text
  end
  if townhall_urls_array.empty? == false
    then puts "> Scrapping successful. Program has found #{townhall_urls_array.length} URLs \n" 
    else puts "Scrapping not successful. Check your internet connextion, or if http://annuaire-des-mairies.com/val-d-oise.html is online, or complain to The Hacking Project "
  end
  return townhall_urls_hash = Hash[townhall_names.zip townhall_urls_array]
end

def get_townhall_emails(urls)
    urls.each do |k, v|
    page_townhall = Nokogiri::HTML(URI.open("#{v}"))
    townhall_email = page_townhall.xpath('//section[2]/div/table/tbody/tr[4]/td[2]').text
    urls[k] = townhall_email
  end
  townhall_mails_array = []
  return puts townhall_mails_array.push(urls)
end

def perform
  urls = get_townhall_url_hash
  get_townhall_emails(urls)
end

perform

