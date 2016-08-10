require 'net/http'
require 'openssl'
def getStatus(domain)
  uri = URI(domain)
  http = Net::HTTP.new(uri.host, uri.port)
  if uri.scheme=='https'
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE 
  end
  return http.get(uri.request_uri).code
end



puts getStatus("https://www.facebook.com")
webs=File.read("/home/iamfred/Ruby-Threads/Test.csv")
@names=webs.split.map{|i| i.split(",")}#contains an array of [rank,url] pair
@items=@names.size
(0..@items-1).each do |i|
  puts "url:www."+@names[i][1]+" rank "+@names[i][0]   
end 