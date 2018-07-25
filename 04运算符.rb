
# -*- code:utf-8 -*-
# /usr/bin/ruby -w

# @type Ruby 运算符
# Ruby 支持一套丰富的运算符。大多数运算符实际上是方法调用。
# 例如，a + b 被解释为 a.+(b)，其中指向变量 a 的 + 方法被调用，b 作为方法调用的参数。
# 对于每个运算符（+ - * / % ** & | ^ << >> && ||），都有一个相对应的缩写赋值运算符（+= -= 等等）


# @type Ruby 算术运算符
# 假设变量 a 的值为 10，变量 b 的值为 20，那么
#
# a + b 将得到 30
# a - b 将得到 -10
# a * b 将得到 200
# b / a 将得到 2
# b % a 将得到 0
# a**b  将得到 10 的 20 次方



# @type Ruby 比较运算符
# 假设变量 a 的值为 10，变量 b 的值为 20
# (a == b)  不为真
# (a != b)  为真
# (a > b)   不为真
# (a < b)   为真
# (a <=> b) 返回 -1
# (1...10) === 5 返回 true
# 1 == 1.0 返回 true，但是 1.eql?(1.0) 返回 false
# 如果 aObj 是 bObj 的副本，那么 aObj == bObj 返回 true，a.equal?bObj 返回 false，但是 a.equal?aObj 返回 true


# @type Ruby 赋值运算符
# 假设变量 a 的值为 10，变量 b 的值为 20
# +=  -=  *=  /=   %=   **=

# @type Ruby 并行赋值
# Ruby 也支持变量的并行赋值。这使得多个变量可以通过一行的 Ruby 代码进行初始化

a, b, c = 10, 20, 30

a, b = b, c
print a,  ' ', b, ' ', c,"\n"



# @type Ruby 位运算符
# 假设如果 a = 60，且 b = 13，现在以二进制格式，它们如下所示：
#
# a = 0011 1100
# b = 0000 1101
# -----------------
# a&b = 0000 1100
# a|b = 0011 1101
# a^b = 0011 0001
# ~a  = 1100 0011
# a << 2 将得到 240，即为 1111 0000
# a >> 2 将得到 15，即为 0000 1111


# @type Ruby defined? 运算符
# defined? 是一个特殊的运算符，以方法调用的形式来判断传递的表达式是否已定义。
# 它返回表达式的描述字符串，如果表达式未定义则返回 nil。

defined? variable # 如果 variable 已经初始化，则为 True

defined? method_call # 如果方法已经定义，则为 True

defined? puts        # => "method"
defined? puts(bar)   # => nil（在这里 bar 未定义）
defined? unpack      # => nil（在这里未定义）

# 如果存在可被 super 用户调用的方法，则为 True
defined? super

defined? yield    # => "yield"（如果已传递块）
defined? yield    # => nil（如果未传递块）



# @type Ruby 点运算符 "." 和双冒号运算符 "::"
# 你可以通过在方法名称前加上类或模块名称和 . 来调用类或模块中的方法。
# 你可以使用类或模块名称和两个冒号 :: 来引用类或模块中的常量。
#
# :: 是一元运算符，允许在类或模块内定义常量、实例方法和类方法，可以从类或模块外的任何地方进行访问
#
# 在 Ruby 中，类和方法也可以被当作常量
#
# 如果 :: 前的表达式为类或模块名称，则返回该类或模块内对应的常量值；如果 :: 前未没有前缀表达式，则返回主Object类中对应的常量值


CONST = ' out there'
class Inside_one
  CONST = proc {' in there'}
  def where_is_my_CONST
    ::CONST + ' inside one'
  end
end

class Inside_two
  CONST = ' inside two'
  def where_is_my_CONST
    CONST
  end
end

puts Inside_one.new.where_is_my_CONST
puts Inside_two.new.where_is_my_CONST

puts Object::CONST + Inside_two::CONST

puts Inside_two::CONST + CONST
puts Inside_one::CONST

puts Inside_one::CONST.call + Inside_two::CONST