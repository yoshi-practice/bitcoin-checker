require 'net/http'
require 'uri'
require 'json'
class Integer
def jpy_comma
self.to_s.gsub(/(\d)(?=(\d{3})+(?!\d))/, '\1,')
end
end
uri = URI.parse("https://api.bitflyer.jp")
uri.path = '/v1/getboard'
uri.query = 'product_code=BTC_JPY'
https = Net::HTTP.new(uri.host, uri.port)
https.use_ssl = true
response = https.get uri.request_uri
response.body
response_hash = JSON.parse(response.body)
puts "¥"+response_hash["mid_price"].to_i.jpy_comma