require 'rubygems'
require 'nokogiri'
require 'open-uri'
# require 'etf.rb'
require 'debugger'

a = ARGV[0]
#broken_sym  = Nokogiri::HTML(open("http://stockcharts.com/symsearch/index.html?q=#{a}.to&section=symbol&start=0"))
broken_sym  = Nokogiri::HTML(open("http://stockcharts.com/h-sc/ui?s=#{a.upcase}.TO"))
debugger
symbols = broken_sym.css(".chartImg-container")
good_symbols = symbols.map{|s| s unless s.empty?}

# symbols = broken_sym.css('#search-results-wrapper #search-results-container #search-results strong')
 
 puts symbols.inspect 

if symbols.empty? 
 puts "image returned"
  # puts get_chart_url(ticker)
else
  puts "broken"
end
 
symbols.each do |symbol|
 f.puts("<p>  " + symbol.in_html + "  </p>")
end

# etfs.each do |etf|
#   #   if ticker not found
#   #   then do nothing
#   #   else do everything below this line. 

#     f.puts(" <div class=\"list\"> ")
#     ticker = grab_ticker(etf.text)
#     f.puts("<p>  " + etf.text + "  </p>")
#     f.puts(" <br /> ") 
#     f.puts(" <img src=\"#{get_chart_url(ticker)}\" />")
#     f.puts ("</div>")
#   end
