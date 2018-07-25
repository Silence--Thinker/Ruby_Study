
# -*- code:utf-8 -*-
#!/usr/bin/ruby -w

puts "数据类型"

# @type 整型 _不影响数据的结果

a1 = 0
a2 = 1_000_000
a3 = 1_000000_0
puts a2, a3


# @type 浮点
# ** 代表幂运算

puts 2 ** (1 / 4)     # 2的零次方
puts 16 ** (1 / 4.0)  # 16的0.25次次方，16开4次方根


# @type 字符串
# 双引号标记的字符串允许替换和使用反斜线符号，单引号标记的字符串不允许替换，且只允许使用 \\ 和 \' 两个反斜线符号

puts 'escape using "\\" '
puts 'that\'s right'

# 使用序列 #{ expr } 替换任意 Ruby 表达式的值为一个字符串
#
puts "24乘以60乘以60 : #{24 * 60 * 60}"

# @type 数组
# （1）数组通过[]索引访问
# （2）通过赋值操作插入、删除、替换元素
# （3）通过+，－号进行合并和删除元素，且集合做为新集合出现
# （4）通过<<号向原数据追加元素
# （5）通过*号重复数组元素
# （6）通过｜和&符号做并集和交集操作（注意顺序）

ary = ['fred', 10, 3.14, "this is string", "last element"]
ary.each do |i|
  puts i
end
ary<<"new elment"        # add obj
puts ary.last
puts ary.include?"fred"  # true


# @type 哈希类型
# Ruby 哈希是在大括号内放置一系列键/值对，键和值之间使用逗号和序列 => 分隔。尾部的逗号会被忽略

hash = colors = {'red' => 0xf00, "green" => 0x0f0, "blue" => 0x00f}
hash.each do |key, value|
  print key, " : ", value, "\n"
end


# @type 范围类型
# 范围 (1..5) 意味着它包含值 1, 2, 3, 4, 5，范围 (1...5) 意味着它包含值 1, 2, 3, 4 。

(10..15).each do |n|
  print n, '  '
end

range = (10...16)
print "\n", range.count, "\n"
puts range.include?11
puts range.first

range.each do |i|
  puts i
end


# @type 范围类型 练习
# 序列 1..100 是一个 Range 对象，包含了两个 Fixnum 对象的引用。如果需要，您可以使用 to_a 方法把范围转换为列表

range1 = (1..10).to_a
range2 = ('bar'..'bay').to_a
puts "#{range1}"        # [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
puts "#{range2}"        # ["bar", "bas", "bat", "bau", "bav", "baw", "bax", "bay"]

# 范围实现了让您可以遍历它们的方法，您可以通过多种方式检查它们的内容

# 指定范围
digits = 0..9

puts digits.include?(5)
ret = digits.min
puts "最小值为 #{ret}"

ret = digits.max
puts "最大值为 #{ret}"

ret = digits.reject {|i| i < 5} # reject 屏蔽，在digists中做筛选
puts "不符合条件的有#{ret}"

digits.each do |digit|
  puts "在循环中 #{digit}"
end

score = 70
result = case score
         when 0..40
           "糟糕的分数"
         when 41..60
           "快要及格了"
         when 61..70
           "及格分数"
         when 71..100
           "良好分数"
         else
           "错误分数"
         end
puts result

# 范围的最后一个用途是间隔检测：检查指定值是否在指定的范围内。需要使用 === 相等运算符来完成计算

if ((1..10) === 5)
  puts "5 在 (1..10)中"
end

if(('a'..'j') === 'c')
  puts "c 在 ('a'..'j') 中"
end

if(('a'..'j') === 'z')
  puts "z 在 ('a'..'j') 中"
end

# 范围也可以用作条件表达式。例如，下面的代码片段从标准输入打印行，其中每个集合的第一行包含单词 start，最后一行包含单词 end

while gets
  print if /start/../end/
end