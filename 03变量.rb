
# -*- code:utf-8 -*-
# /usr/bin/ruby -w

# @type Ruby 全局变量
#
# 一般小写字母、下划线开头：变量（Variable）。
# $开头：全局变量（Global variable）。
# @开头：实例变量（Instance variable）。
# @@开头：类变量（Class variable）类变量被共享在整个继承链中
# 大写字母开头：常数（Constant）。

$global_variable = 10

class Class1
  def print_global
    $global_variable += 1
    puts "全局变量 在 Class1 中的值为 : #$global_variable"
  end
end

class Class2
  def print_global
    $global_variable += 1
    puts "全局变量 在 Class2 中的值为 : #$global_variable"
  end
end

class1obj = Class1.new
class1obj.print_global

class2obj = Class2.new
class2obj.print_global


# @type Ruby 实例变量
# 实例变量以 @ 开头。未初始化的实例变量的值为 nil，在使用 -w 选项后，会产生警告。

class Customer
  def initialize (id, name, addr)
    @cust_id = id
    @cust_name = name
    @cust_addr = addr
  end
  def display_details ()
    puts "customer id #@cust_id"
    puts "customer name #@cust_name"
    puts "customer addr #@cust_addr"
  end
end

customer = Customer.new("1233", "Caoxiufa", "tt")
customer.display_details()


# @type Ruby 类变量
# 类变量以 @@ 开头，且必须初始化后才能在方法定义中使用。
# 引用一个未初始化的类变量会产生错误。类变量在定义它的类或模块的子类或子模块中可共享使用。
# 在使用 -w 选项后，重载类变量会产生警告。

class Customer2
  @@no_of_customers = 0;
  def initialize (id, name, addr)
    @cust_id = id
    @cust_name = name
    @cust_addr = addr
  end
  def display_details ()
    puts "customer id #@cust_id"
    puts "customer name #@cust_name"
    puts "customer addr #@cust_addr"
  end
  def total_no_of_customers ()
    @@no_of_customers += 1
    puts "total number of customer: #@@no_of_customers"
  end

end

customer1 = Customer2.new("1233", "Caoxiufa", "tt")
customer2 = Customer2.new("1233", "Caoxiujin", "tt")
customer1.total_no_of_customers()
customer2.total_no_of_customers()


# @type Ruby 局部变量
# 局部变量以小写字母或下划线 _ 开头。局部变量的作用域从 class、module、def 或 do 到相对应的结尾或者从左大括号到右大括号 {}。
#
# 当调用一个未初始化的局部变量时，它被解释为调用一个不带参数的方法。
#
# 对未初始化的局部变量赋值也可以当作是变量声明。变量会一直存在，直到当前域结束为止。局部变量的生命周期在 Ruby 解析程序时确定。
#
# 在上面的实例中，局部变量是 id、name 和 addr。



# @type Ruby 常量
# 常量以大写字母开头。定义在类或模块内的常量可以从类或模块的内部访问，定义在类或模块外的常量可以被全局访问。
#
# 常量不能定义在方法内。引用一个未初始化的常量会产生错误。对已经初始化的常量赋值会产生警告。

class Example
  VAR1 = 100
  VAR2 = 200
  def show ()
    puts "第一个常量值为:#{VAR1}"
    puts "第二个常量值为:#{VAR2}"
  end
end
object = Example.new()
object.show()



# @type Ruby 伪变量
# 它们是特殊的变量，有着局部变量的外观，但行为却像常量。您不能给这些变量赋任何值。
#
# self: 当前方法的接收器对象。
# true: 代表 true 的值。
# false: 代表 false 的值。
# nil: 代表 undefined 的值。
# __FILE__: 当前源文件的名称。
# __LINE__: 当前行在源文件中的编号


class Person
  @person_name
  @person_age
      def initialize (name, age)
    @person_name = name
    @person_age = age
  end
  def lastYearAge ()
    puts "#{self.class}"
  end
end

person = Person.new("caoxiujin", 27)
person.lastYearAge()