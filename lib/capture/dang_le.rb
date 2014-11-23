require 'nokogiri'
require 'rubyXL'
require 'simple_xlsx'

class DangLe
  URL = 'http://ng.d.cn/channel/testlist.html'

  def self.get_list
    games = []
    doc = Nokogiri::HTML(open(URL))
    table = doc.css("table.testList").first
    list = table.css("tr")
    list.each do |tr|
      game = {}
      name = tr.css("td.name a").text.split("（")[0]
      name = name.split("(")[0]
      time = tr.css("td")[2].text
      game[name] = Time.now.year.to_s + "-" + time
      games << game
    end
    return games
  end

end