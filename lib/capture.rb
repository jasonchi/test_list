require "capture/version"
require "capture/dang_le"
require "capture/nine_game"

module Capture

  # Your code goes here...
  def self.get_games_list
    ng_list = NineGame.get_list
    dl_list = DangLe.get_list
    list = ng_list | dl_list
    return list
  end

  def self.read_xlsx
    workbook = RubyXL::Parser.parse("all.xlsx")
    worksheet =  workbook[0]
    data = worksheet.extract_data
    hash = {}
    data[1..-1].each do |d|
      hash[d[3].to_s.split('(')[0]] = [d[0], d[1], d[2], d[3], d[4]]
    end
    return hash
  end

  def self.capture
    games = get_games_list
    rows = read_xlsx
    hash = {}
    games.each do |g|
      key = g.keys[0]
      row = rows[key]
      if row
        #names[g.keys[0]] = [d[0], d[1], d[2], d[3], g[g.keys[0]]]
        hash[key] = [row[0], row[1], row[2], row[3], g[key]]
      else
        hash[key] = [nil, nil, nil, key, g[key]]
      end
    end

    serializer = SimpleXlsx::Serializer.new("开服开测信息/#{Time.now.to_s}.xlsx") do |doc|
      doc.add_sheet(Time.now.to_s) do |sheet|
        hash.keys.each do |name|
          sheet.add_row(hash[name])
        end
      end
    end
  end
end
