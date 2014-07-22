# https://www.twilio.com/user/account/developer-tools/api-explorer/message-create
# curl -X POST 'https://api.twilio.com/2010-04-01/Accounts/ACbbd0943e17312304cbdd5b07f0891fa4/Messages.json'  \

#get everyhing ready
require 'httparty'
require 'dotenv'
require 'nokogiri'
require 'open-uri'


class Noko
    def things(enter_uri, html_open)
        @enter_uri = enter_uri
        @html_open = html_open
    end

    def display
        puts "uri entered: #{@enter_uri}"
        puts "task was: #{@html_open}"
    end

    def run
        doc = Nokogiri::HTML(open("http://www.threescompany.com/"))
        puts doc
    end
end

link1 = Noko.new
link1.run
puts link1
#link1 = Nokogiri.parse_uri("http://www.apartmenttherapy.com/the-10-worst-things-about-renting-and-how-to-deal-with-them-renters-solutions-205631", html_open)
puts link1 
