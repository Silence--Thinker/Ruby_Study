
# -*- code:utf-8 -*-
# /usr/bin/ruby -w

# @type Ruby 块
# 块由大量的代码组成。
# 您需要给块取个名称。
# 块中的代码总是包含在大括号 {} 内。
# 块总是从与其具有相同名称的函数调用。这意味着如果您的块名称为 test，那么您要使用函数 test 来调用这个块。
# 您可以使用 yield 语句来调用块。
# 语法
# block_name{
#    statement1
#    statement2
#    ..........
# }

# @type yield 语句
# yield 语句后跟着参数。您甚至可以传递多个参数。在块中，您可以在两个竖线之间放置一个变量来接受参数

def test
  puts "在 test 方法内"
  yield
  puts "你又回到了 test 方法内"
  yield
end

test {puts "你在块内"}

def test_01
  yield 5
  puts "在 test_01 方法内"
  yield 100
end

test_01 {|i| puts "你 test_01 在 #{i} 内"}

def test_02
  yield 5, 2323, 987
  puts "在 test_02 方法内"
  yield 300, "silence"
end

test_02 {|a, b, c| puts "你 test_02 在 #{a} #{b} #{c} 内"}


# @type 块和方法
# 您通常使用 yield 语句从与其具有相同名称的方法调用块
# 如果方法的最后一个参数前带有 &， 那么您可以向该方法传递一个块，且这个块可被赋给最后一个参数。
# 如果 * 和 & 同时出现在参数列表中，& 应放在后面

def test_03 (&block)
  block.call
  yield
end
test_03 { puts "test_03 Hello world!"}

# @type BEGIN 和 END 块
# 每个 Ruby 源文件可以声明当文件被加载时要运行的代码块（BEGIN 块），以及程序完成执行后要运行的代码块（END 块）

BEGIN {
  # BEGIN 代码块
  puts "BEGIN 代码块"
}

END {
  # END 代码块
  puts "END 代码块"
}
# MAIN 代码块
puts "MAIN 代码块"
