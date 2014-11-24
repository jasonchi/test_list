require 'nokogiri'
require 'rubyXL'
require 'simple_xlsx'

class NineGame

  URL_KC = 'http://www.9game.cn/kc/'
  URL_KF = 'http://www.9game.cn/kf/'

  def self.get_kc_list
    games = []
    doc = Nokogiri::HTML(open(URL_KC))
    list = doc.css("div.box-text div.des-table1")
    list.each do |table|
      /(\d+).(\d+)/ =~ table.css("div.day").text
      day = Time.now.year.to_s + "-" + $1.to_s + "-" + $2.to_s
      table.css("table tr").each do |tr|
        game = {}
        name = tr.css("td.nametr a").text.split("（")[0]
        name = name.split("(")[0]
        time = tr.css("td.timetr span").text
        status = tr.css("td.stattr").text
        game[name] = [day + " " + time, status]
        games << game
      end
    end
    return games
  end

  def self.get_kf_list
    games = []
    doc = Nokogiri::HTML(open(URL_KF))
    list = doc.css("div.box-text div.des-table1")
    list.each do |table|
      /(\d+).(\d+)/ =~ table.css("div.day").text
      day = Time.now.year.to_s + "-" + $1.to_s + "-" + $2.to_s
      table.css("table tr").each do |tr|
        game = {}
        nametr = tr.css("td.nametr a")[1]
        name = nametr.text.split("（")[0]
        name = name.split("(")[0]
        time = tr.css("td.timetr span").text
        href = nametr.attr("href")
        inner_doc = Nokogiri::HTML(open(href))
        event_list = inner_doc.css("ul.event-list li.android")
        events = []
        event_list.each do |e|
          events << e.css("span.t").text + " " + e.css("p.des").text
        end
        game[name] = [day + " " + time] + events
        games << game
      end
    end
    return games
  end
end
