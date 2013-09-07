require 'rubygems'
require 'nokogiri'
require 'open-uri'


def grab_ticker(headline)
  i = headline.chomp('-TSX)')
  names_and_tickers = i.split('(')
  names_and_tickers.last
end

def get_chart_url(ticker) # use the tickers to fetch corresponding chart
  "http://stockcharts.com/c-sc/sc?chart=#{ticker}.to,uu[305,a]dacayaci[pb20!b50][dg]"
end

# add a method that will sort based on criteria

# def sort_ticker(search_ticker)
#   #take user input and output all chart of certain type
#   search_ticker = gets.chomp.downcase
#   #pass search into the ETF loop  
# end


page = Nokogiri::HTML(open("http://etf.stock-encyclopedia.com/category/etfs-listed-in-canada.html"))
etfs = page.css('td.main table a')

File.open('etflist.html', 'w') do |f| # f is rep the file with File.open

  f.puts("<html>")
  f.puts("<head>")
  f.puts("<title>Intro to HTML</title>")
  f.puts(" <link rel=\"stylesheet\" type=\"text/css\" href=\"etfstyle.css\"> ")
  f.puts("</head>")
  f.puts("<body rel=\"stylesheet\" type=\"text/css\" href=\"etfstyle.css\">")
  f.puts("<h1><span></span> List of ETF's in Canada with Charts</h1>")
  

  etfs.each do |etf|
    f.puts(" <div class=\"list\"> ")
    ticker = grab_ticker(etf.text)
    f.puts("<p>  " + etf.text + "  </p>")
    f.puts(" <br /> ") 
    f.puts(" <img src=\"#{get_chart_url(ticker)}\" />")
    f.puts ("</div>")
  end

  
  f.puts ("</body>\n")
  f.puts ("</html>\n")

end
