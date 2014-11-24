require 'nokogiri'
require 'rubyXL'
require 'simple_xlsx'

class DangLe
  URL_KC = 'http://ng.d.cn/channel/testlist.html'
  URL_KF = "http://ng.d.cn/channel/newserver.html"

  def self.get_kc_list
    games = []
    doc = Nokogiri::HTML(open(URL_KC))
    table = doc.css("table.testList").first
    list = table.css("tr")
    list.each do |tr|
      game = {}
      name = tr.css("td.name a").text.split("（")[0]
      name = name.split("(")[0]
      time = tr.css("td")[2].text
      status = tr.css("td")[3].text
      game[name] = [Time.now.year.to_s + "-" + time, status]
      games << game
    end
    return games
  end

  def self.get_kf_list
    games = []
    doc = Nokogiri::HTML(open(URL_KF))
    table = doc.css("table.testList")[0]
    list = table.css("tr")
    list.each do |tr|
      game = {}
      name = tr.css("td.name a").text.split("（")[0]
      name = name.split("(")[0]
      time = tr.css("td")[2].text
      info = tr.css("td")[3].text
      game[name] = [Time.now.year.to_s + "-" + time, info]
      games << game
    end
    return games
  end

end