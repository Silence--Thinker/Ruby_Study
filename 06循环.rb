
# /-*- code:utf-8 -*-
# /usr/bin/ruby -w

# @type Ruby while 语句
#
# while conditional [do]
#    code
# end
#
# while conditional [:]
#    code
# end
# 语法中 do 或 : 可以省略不写。但若要在一行内写出 while 式，则必须以 do 或 : 隔开条件式或程式区块

$i = 0
$num = 5
while $i < $num do
  puts "(循环中 i = #$i)"
  $i += 1
end


# @type Ruby while 修饰符
# code while condition
# 或者
#
# begin
#   code
# end while conditional
# 当 conditional 为真时，执行 code。
# 如果 while 修饰符跟在一个没有 rescue 或 ensure 子句的 begin 语句后面，code 会在 conditional 判断之前执行一次\

$i = 0
$num = 5
begin
  puts ("循环中 i = #$i")
  $i += 1
end while $i < $num


# @type Ruby until 语句
# until conditional [do]
#    code
# end
# 当 conditional 为假时，执行 code。
# 语法中 do 可以省略不写。但若要在一行内写出 until 式，则必须以 do 隔开条件式或程式区块

$i = 0
$num = 5
until $i > $num do
  puts ("循环中 i = #$i")
  $i += 1
end


# @type Ruby until 修饰符
# until conditional [do]
# code until conditional
#
# 或者
#
# begin
#    code
# end until conditional
# 当 conditional 为 false 时，执行 code。
#
# 如果 until 修饰符跟在一个没有 rescue 或 ensure 子句的 begin 语句后面，code 会在 conditional 判断之前执行一次

$i = 0
$num = 5
begin
  puts ("循环中 i = #$i")
  $i += 1
end until $i > $num


# @type Ruby for 语句
# for variable [, variable ...] in expression [do]
#    code
# end
# 先计算表达式得到一个对象，然后针对 expression 中的每个元素分别执行一次 code
for i in 0..5
  puts "i = #{i}"
end

(0..5).each do |i|
  puts "局部变量的值为 #{i}"
end

# @type break 语句
for i in 0..5
  if i > 2 then
    break
  end
  puts "i = #{i}"
end

# @type Ruby next 语句
for i in 0..5
  if i < 2 then
    next
  end
  puts "局部变量的值为 #{i}"
end


# @type Ruby redo 语句
# 重新开始最内部循环的该次迭代，不检查循环条件。如果在块内调用，则重新开始 yield 或 call

for i  in 3..5
   if i < 3 then
      puts "i = #{i}"
      redo
   end
end


# @type Ruby retry 语句
# 如果 retry 出现在 begin 表达式的 rescue 子句中，则从 begin 主体的开头重新开始
# begin
#    do_something   # 抛出的异常
# rescue
#    # 处理错误
#    retry          # 重新从 begin 开始
# end

for i in 0..5
  begin
    if i > 3 then puts "i > 3, i = #{i}"
    elsif i === 1
    then
      i = 4
      puts "i >= 3, i = #{i}"
    else puts "i <= 3, i = #{i}"
    end
  rescue i = 3
    retry
  end
end

for i in 1..5
  retry if  i > 2
  puts "局部变量的值为 #{i}"
end
