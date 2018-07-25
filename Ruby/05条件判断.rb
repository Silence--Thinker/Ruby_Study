
# -*- code:utf-8 -*-
# /usr/bin/ruby

# @type Ruby if...else 语句
# if conditional [then]
#       code...
# [elsif conditional [then]
#       code...]...
# [else
#       code...]
# end


x = 3
if x > 2
  puts "x 大于 2"
elsif x <= 2 and x!= 0
  puts "x 是 1"
else
  puts "无法得知 x 的值"
end

a = 11
if a == 4 then a = 7 end


# @type Ruby if 修饰符
# code if condition
# if修饰词组表示当 if 右边之条件成立时才执行 if 左边的式子。即如果 conditional 为真，则执行 code

$debug = 1
print "debug\n" if $debug


# @type Ruby unless 语句
# unless式和 if式作用相反，即如果 conditional 为假，则执行 code。如果 conditional 为真，则执行 else 子句中指定的 code

x = 2
unless x > 2
  puts "x 小于等于 2"
else
  puts "x 大于 2"
end


# @type Ruby unless 修饰符
# code unless conditional
# 如果 conditional 为假，则执行 code
$var = 1
print "1 ----这一行输出\n" if $var
print "2 ----这一行不输出\n" unless $var

$var = false
print "3 ----这一行输出\n" unless $var


# @type Ruby case 语句
# case先对一个 expression 进行匹配判断，然后根据匹配结果进行分支选择。
# 它使用 ===运算符比较 when 指定的 expression，若一致的话就执行 when 部分的内容
# 通常我们省略保留字 then 。若想在一行内写出完整的 when 式，则必须以 then 隔开条件式和程式区块

$age = 27
case $age
when 0..2
  puts "婴儿"
when 3..6
  puts "小孩"
when 7..12
  puts "儿童"
when 13..18
  puts "青少年"
else
  puts "老了"
end

case $age
when 0..2 then puts "婴儿"
else puts "老了"
end