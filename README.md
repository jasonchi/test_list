# Capture

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capture'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capture

## Usage
#Windows 7
先安装 rubyinstaller-2.1.5，看电脑如果是64位就选有带64的安装，如果是32位就选没有带64的
  中间有需要勾选的 全部勾上
同时可以安装 git， 
  一直下一步

ruby安装完以后安装DevKit-mingw64-32-4.7.2-20130224-1151-sfx.exe （同样也根据电脑选择32或64）
打开只是解压，随便解压打哪个文件夹 建议新建一个
比如： D:/DevKit
解压完以后 打开开始菜单 运行里面输入 cmd
切换到 D盘 直接输入 d:
然后cd DevKit
然后 打开文件夹下面 config.yml
在最后一行加入 ruby 安装的目录 默认应该在C盘下
如：- C:\Ruby21-x64

然后运行 ruby dk.rb init
没问题的话 再运行 ruby dk.rb install

然后在开始菜单找到git目录 打开 git_bash
在打开的窗口中 输入随便盘符
如：d: 切换到D盘
然后运行 git clone https://github.com/jasonchi/test_list.git
然后cd test_list
然后 gem install bundler
然后 bundle install

这样如果没有错误就算安装完成了 

然后以后如果要抓取就切换到D盘下的 test_list目录
运行：
rake kaice
rake kaifu
上面的是抓取开测
下面的是抓取开服


## Contributing

1. Fork it ( https://github.com/[my-github-username]/capture/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
