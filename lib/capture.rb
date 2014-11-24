require "capture/version"
require "capture/dang_le"
require "capture/nine_game"

module Capture

  # Your code goes here...
  def self.get_kc_list
    ng_list = NineGame.get_kc_list
    dl_list = DangLe.get_kc_list
    list = ng_list | dl_list
    return list
  end

  def self.get_kf_list
    ng_list = NineGame.get_kf_list
    dl_list = DangLe.get_kf_list
    list = ng_list | dl_list
    return list
  end

  def self.read_xlsx
    workbook = RubyXL::Parser.parse("all.xlsx")
    worksheet =  workbook[0]
    data = worksheet.extract_data
    hash = {}
    data.each do |d|
      hash[d[1].to_s.split('(')[0]] = [d[0], d[1]]
    end
    return hash
  end

  def self.kaice
    games = get_kc_list
    rows = read_xlsx
    hash = {}
    games.each do |g|
      key = g.keys[0]
      row = rows[key]
      if row
        #names[g.keys[0]] = [d[0], d[1], d[2], d[3], g[g.keys[0]]]
        hash[key] = [row[0], key] + g[key]
      else
        hash[key] = [nil, key] + g[key]
      end
    end

    serializer = SimpleXlsx::Serializer.new("开测信息/#{Time.now.to_s}.xlsx") do |doc|
      doc.add_sheet(Time.now.to_s) do |sheet|
        sheet.add_row(%w{游戏ID 游戏名 状态 开测时间})
        hash.keys.each do |name|
          sheet.add_row(hash[name])
        end
      end
    end
  end

  def self.kaifu
    games = get_kf_list
    rows = read_xlsx
    hash = {}
    games.each do |g|
      key = g.keys[0]
      row = rows[key]
      
      if row
        #names[g.keys[0]] = [d[0], d[1], d[2], d[3], g[g.keys[0]]]
        hash[key] = [row[0], key] + g[key]
      else
        hash[key] = [nil, key] + g[key]
      end
    end

    serializer = SimpleXlsx::Serializer.new("开服信息/#{Time.now.to_s}.xlsx") do |doc|
      doc.add_sheet(Time.now.to_s) do |sheet|
        sheet.add_row(%w{游戏ID 游戏名 开服信息 开服时间})
        hash.keys.each do |name|
          sheet.add_row(hash[name])
        end
      end
    end
  end

end
