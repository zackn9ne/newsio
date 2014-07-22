require 'net/http'
require 'json'
require 'awesome_print'


class Twilio

    ACCOUNT_SID = ENV["TWILIO_ACCOUNT_SID"]
    AUTH_TOKEN = ENV["TWILIO_ACCOUNT_AUTH_TOKEN"]
    BASE_URI = "https://api.twilio.com/2010-04-01"

    TRIAL_NUMBER = "+15162034469"
    MY_NUMBER = "+15164950887"

    def self.send_sms(to, message)
        ap Twilio.new.post("/Messages", {
            From: Twilio::TRIAL_NUMBER,
            To: to,
            Body: message
        })
    end

    def self.get(path)
        Twilio.new.request(Net::HTTP::Get, path)
    end

    def self.post(path, form_data)
        Twilio.new.request(Net::HTTP::Post, path, form_data)
    end

    def request(method_class, path, form_data=nil)
        uri = URI.parse("#{BASE_URI}/Accounts/#{ACCOUNT_SID}#{path}.json")

        request = method_class.new(uri)
        request.basic_auth(ACCOUNT_SID, AUTH_TOKEN)
        request.form_data = form_data if form_data

        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.set_debug_output($stdout)

        response = http.request(request)

        JSON.parse(response.body)
    end

end
