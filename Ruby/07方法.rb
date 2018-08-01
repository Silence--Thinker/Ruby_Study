
# -*- code:utf-8 -*-
# /usr/bin/ruby -w

# @type Ruby 方法
# 方法名应以小写字母开头。如果您以大写字母作为方法名的开头，Ruby 可能会把它当作常量，从而导致不正确地解析调用。
# 方法应在调用之前定义，否则 Ruby 会产生未定义的方法调用异常。

# 语法
# def method_name [( [arg [= default]]...[, * arg [, &expr ]])]
#    expr..
# end

def method_name (var1, var2)
  puts(var1)
  puts var2
end

method_name(1, 2)

# 您可以为参数设置默认值，如果方法调用时未传递必需的参数则使用默认值
def method_two (var1 = 100, var2 = 200)
  puts(var1)
  puts var2
end

method_two
method_two 20 , 30

def test_01 (a1 = "Ruby", a2 = "Perl")
  puts "编程语言为 #{a1}"
  puts "编程语言为 #{a2}"
end

test_01
test_01 "C", "C++"
test_01 "C"

# 使用带参数方法最大的缺点是调用方法时需要记住参数个数。例如，如果您向一个接受三个参数的方法只传递了两个参数，Ruby 会显示错误


# @type 方法返回值
# Ruby 中的每个方法默认都会返回一个值。这个返回的值是最后一个语句的值

def test
  i = 100
  j = 200
  k = 10
end

puts test   # 10  方法的返回值是10

# @type Ruby return 语句
# Ruby 中的 return 语句用于从 Ruby 方法中返回一个或多个值
# 语法
# return [expr[`,' expr...]]
# 如果给出超过两个的表达式，包含这些值的数组将是返回值。如果未给出表达式，nil 将是返回值

def test_02
  i = 100
  j = 200
  k = 10
  return i, j, k
end
puts "test_02 #{test_02}"

def test_03
  i = 100
  j = 200
  k = 10
  return
end
puts "test_03 #{test_03}"

# @type 可变数量的参数
# Ruby 允许您声明参数数量可变的方法

def sample (*test)
  puts "sample 参数个数为 #{test.length}"
  for i in 0...test.length
    puts "sample 参数值为 #{test[i]}"
  end
end
sample "Silence", "22", "T"
sample "caoxiujin", "27", "M", "C"



# @type Ruby 类方法
# 当方法定义在类的外部，方法默认标记为 private。另一方面，如果方法定义在类中的，则默认标记为 public。
# 方法默认的可见性和 private 标记可通过模块（Module）的 public 或 private 改变
# Ruby 提供了一种不用实例化即可访问方法的方式

class Accounts
  def reading_change

  end
  def Accounts.return_date
    return 100
  end
end
puts "Accounts.return_date #{Accounts.return_date}"


# @type Ruby alias 语句
# 这个语句用于为方法或全局变量起别名。别名不能在方法主体内定义。即使方法被重写，方法的别名也保持方法的当前定义。
# 为编号的全局变量（$1, $2,...）起别名是被禁止的。重写内置的全局变量可能会导致严重的问题。
# 语法
# alias 方法名 方法名
# alias 全局变量 全局变量

alias foo sample
alias $MATCH $&

puts "foo is #{foo}"
puts "$MATCH is #{$MATCH}"


# @type Ruby undef 语句
# 这个语句用于取消方法定义。undef 不能出现在方法主体内。
# 通过使用 undef 和 alias，类的接口可以从父类独立修改，但请注意，在自身内部方法调用时，它可能会破坏程序
# undef 方法名

undef sample

sample "Silence", "22", "T" # NO log
