require 'nokogiri'
require 'rubyXL'
require 'simple_xlsx'

class NineGame

  URL = 'http://www.9game.cn/kc/'
  def self.get_list
    games = []
    doc = Nokogiri::HTML(open(URL))
    list = doc.css("div.box-text div.des-table1")
    list.each do |table|
      /(\d+).(\d+)/ =~ table.css("div.day").text
      day = Time.now.year.to_s + "-" + $1.to_s + "-" + $2.to_s
      table.css("table tr").each do |tr|
        game = {}
        name = tr.css("td.nametr a").text.split("（")[0]
        name = name.split("(")[0]
        time = tr.css("td.timetr span").text
        game[name] = day + " " + time
        games << game
      end
    end
    return games
  end

end
