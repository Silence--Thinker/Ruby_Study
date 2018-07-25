
# -*- code:utf-8 -*-
#! usr/bin/ruby -w


# @type ruby 类与对象

# 类 Vehicle 的定义如下
# Class Vehicle
# {
#     Number no_of_wheels
#     Number horsepower
#     Characters type_of_tank
#     Number Capacity
#
#     Function speeding
#     {
#     }
#
#     Function driving
#     {
#
#     }
#
#     Function halting
#     {
#
#     }
# }

# 在 Ruby 中，类总是以关键字 class 开始，后跟类的名称。类名的首字母应该大写
class Custormer

end

# @type 类中的变量
# 局部变量：局部变量是在方法中定义的变量。局部变量在方法外是不可用的。在后续的章节中，您将看到有关方法的更多细节。局部变量以小写字母或 _ 开始。
# 实例变量：实例变量可以跨任何特定的实例或对象中的方法使用。这意味着，实例变量可以从对象到对象的改变。实例变量在变量名之前放置符号（@）。
# 类变量：类变量可以跨不同的对象使用。类变量属于类，且是类的一个属性。类变量在变量名之前放置符号（@@）。
# 全局变量：类变量不能跨类使用。如果您想要有一个可以跨类使用的变量，您需要定义全局变量。全局变量总是以美元符号（$）开始。

class Custormer
    @@no_of_customers = 0
end

# 在 Ruby 库中预定义。new 方法属于类方法
cust1 = Custormer.new
cust2 = Custormer.new
puts cust1
puts cust2

# initialize 方法是一种特殊类型的方法，将在调用带参数的类的 new 方法时执行
class Customer
  @@no_of_customers = 0
  def initialize(id, name, addr)
    @cust_id = id
    @cust_name = name
    @cust_addr = addr
  end
end

cust3 = Customer.new(12, "Caoxiujin", "Anhui")

# @type 成员函数 在Ruby中，函数被称为方法。类中的每个方法是以关键字 def 开始，后跟方法名。
# 方法名总是以小写字母开头。在 Ruby 中，您可以使用关键字 end 来结束一个方法，定义方式如下
# def  function
#     stastement 1
#     stastement 2
# end

class Sample
  def hello
    puts "hello ruby"
  end
end

object = Sample.new
object.hello


# @type 类案例
# 下面将创建一个名为 Customer 的 Ruby 类，声明两个方法：
# display_details：该方法用于显示客户的详细信息。
# total_no_of_customers：该方法用于显示在系统中创建的客户总数量。

# 当您想要在一个单行上显示实例变量的文本和值时，您需要在 puts 语句的变量名前面放置符号（#）。
# 文本和带有符号（#）的实例变量应使用双引号标记。
class CustomerClass
  @@no_of_customers = 0
  def initialize(id, name, addr)
    @cust_id = id
    @cust_name = name
    @cust_addr = addr
  end

  def display_details()
    puts "Customer id #@cust_id"
    puts "Customer name #@cust_name"
    puts "Customer addr #@cust_addr"
  end
  def total_no_of_customers()
    @@no_of_customers += 1
    puts "total number of customers: #@@no_of_customers"
  end
end

cust4 = CustomerClass.new(27, "Caoxiujin", "Beijing")
cust5 = CustomerClass.new(23, "Caoxiufa", "Anhui")
cust4.display_details
cust4.total_no_of_customers
