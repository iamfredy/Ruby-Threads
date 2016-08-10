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

def make_csv(url,rank)
  http_code=getStatus("https://www."+url);
  https_code=getStatus("https://www."+url);
  #puts rank+","+url+","+http_code+","+https_code
  @out_file.puts(rank+","+url+","+http_code+","+https_code)
  puts rank+" "+url
end

#puts getStatus("https://www.facebook.com")
webs=File.read("/home/iamfred/Ruby-Threads/Test.csv")
@out_file=File.new("/home/iamfred/Ruby-Threads/out.csv","w")
@names=webs.split.map{|i| i.split(",")}#contains an array of [rank,url] pair
@items=@names.size
threads = Array.new
@names.each_slice(5) do |set|
   set.each do |item|
        threads.push(Thread.new{make_csv(item[1],item[0])})
   end
end
threads.each{|thread| thread.join}
