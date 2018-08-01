
# -*-code:utf-8-*-
# /usr/bin/ruby -w

# @type Ruby 模块（Module）
# 模块（Module）是一种把方法、类和常量组合在一起的方式。模块（Module）为您提供了两大好处。
#
# 模块提供了一个命名空间和避免名字冲突。
# 模块实现了 mixin 装置。
#
# 模块（Module）定义了一个命名空间，相当于一个沙盒，在里边您的方法和常量不会与其他地方的方法常量冲突。
# 模块类似与类，但有一下不同：
#
# 模块不能实例化
# 模块没有子类
# 模块只能被另一个模块定义
# 语法
# module Identifier
#    statement1
#    statement2
#    ...........
# end
# 您可以在类方法名称前面放置模块名称和一个点号来调用模块方法，您可以使用模块名称和两个冒号来引用一个常量。

module Trig
  PI = 3.141592653
  def Trig.sin(x)
    puts "Trig.sin #{x}"
  end
  def Trig.cos(x)
    puts "Trig.cos #{x}"
  end
end

Trig.sin 89
Trig.cos 89
puts "Trig::PI #{Trig::PI}"


# 我们可以定义多个函数名称相同但是功能不同的模块

module Moral
  VERY_BAD = 0
  BAD = 1
  def Moral.sin(badness)
    puts "Moral.sin #{badness}"
  end
end

puts "Moral::VERY_BAD #{Moral::VERY_BAD}"
puts "Moral::BAD #{Moral::BAD}"
Moral.sin 78910
wrongdoing = Moral.sin(Moral::VERY_BAD)


# @type Ruby require 语句
# equire 语句类似于 C 和 C++ 中的 include 语句以及 Java 中的 import 语句。
# 如果一个第三方的程序想要使用任何已定义的模块，则可以简单地使用 Ruby require 语句来加载模块文件
# 语法
# require filename
# 在这里，我们使用 $LOAD_PATH << '.' 让 Ruby 知道必须在当前目录中搜索被引用的文件
# 如果您不想使用 $LOAD_PATH，那么您可以使用 require_relative 来从一个相对目录引用文件。

$LOAD_PATH << '.'
require '02类与对象.rb'

custom = CustomerClass.new 27, "caoxiujin", "Beijing"
custom.display_details
custom.total_no_of_customers



# @type Ruby include 语句
#您可以在类中嵌入模块。为了在类中嵌入模块，您可以在类中使用 include 语句：
# 语法
# include modulename



# @type Ruby 中的 Mixins
# Ruby 不直接支持多重继承，但是 Ruby 的模块（Module）有另一个神奇的功能。
# 它几乎消除了多重继承的需要，提供了一种名为 mixin 的装置。
# Ruby 没有真正实现多重继承机制，而是采用成为mixin技术作为替代品。将模块include到类定义中，模块中的方法就mix进了类中。

module A
  def a1
  end
  def a2
  end
end

module B
  def b1
  end
  def b2
  end
end

class Sample
  include A
  include B
  def s1
  end
end
sample = Sample.new
sample.a1
sample.a2

sample.b1
sample.b2

sample.s1


# 模块 A 由方法 a1 和 a2 组成。
# 模块 B 由方法 b1 和 b2 组成。
# 类 Sample 包含了模块 A 和 B。
# 类 Sample 可以访问所有四个方法，即 a1、a2、b1 和 b2。
# 因此，您可以看到类 Sample 继承了两个模块，您可以说类 Sample 使用了多重继承或 mixin 。