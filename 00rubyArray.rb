
#!usr/bin/ruby -w
# -*- coding : utf-8 -*-


# BEGIN END
puts "ruby 主程序"

BEGIN {
    puts "初始化 ruby 程序" # 注释
}

END {
    puts "停止 ruby 程序"
}

=begin
 这是一个注释代码块
 这是一个注释代码块
 puts "停止 ruby 程序"
 这是一个注释代码块
 这是一个注释代码块
=end

# a 的字符编码
puts "a".ord

# 单引号，双引号
puts 'escape using "\\"';
puts 'That\'s right'

# #{ expr } 替换替换表达式的值为一个字符串
puts "相乘 : #{24 * 60 * 60}"

name = "Ruby"
puts name
puts "#{name + ", ok " + name}"

# 数组
ary = ["fred", 10, 3.14, "this is a string", "last element", ]
ary.each do |i|
    puts i
end

# 哈希类型
hsh = colors = {"red" => 0xf00, "green" => 0x0f0, "blue" => 0x00f }
hsh.each do |key, value|
    print key, " is ", value, "\n"
end

# 范围类型
(10...15).each do |n|
    print n, ' '
end
puts ""
(10..15).each do |n|
    print n, ' '
end
puts ""

puts "#{(1 +3)}"

# @type error
text = <<'foo'
  cat /etc/passwd
foo

puts text

# @type 向文件中写东西 abc 文件
File.open("./abc", "w") do |io|
  io.write(text)
end

puts "-------------------"
exec "ls -al ./ && cat ./abc"

