
# -*- code:utf-8 -*-
# /usr/bin/ruby -w

# @type Ruby 日期 & 时间（Date & Time）
# Time 类在 Ruby 中用于表示日期和时间。
# 它是基于操作系统提供的系统日期和时间之上。该类可能无法表示 1970 年之前或者 2038 年之后的日期。


# @type 创建当前的日期和时间

time1 = Time.new
puts "当前时间 : " + time1.inspect

time2 = Time.now
puts "当前时间 : " + time2.inspect


# @type 获取 Date & Time 组件
# 我们可以使用 Time 对象来获取各种日期和时间的组件

time = Time.new

# time 的组件
puts "当前时间 : " + time.inspect
puts "日期的年份 : #{time.year}"
puts "日期的月份 : #{time.month}"
puts "一个月的第几天 : #{time.day}"
puts "一周中的星期几 : #{time.wday}"
puts "一年中的第几天 : #{time.yday}"
puts "小时 24小时制 : #{time.hour}"
puts "分钟 : #{time.min}"
puts "秒钟 : #{time.sec}"
puts "微妙 : #{time.usec}"
puts "时区名称 : #{time.zone}"


# @type Time.utc、Time.gm 和 Time.local 函数
# 这些函数可用于格式化标准格式的日期，如下所示

puts "#{Time.local(2008, 7, 8)}"
puts "#{Time.local(2008, 7, 8, 9, 10)}"

puts "#{Time.utc(2008, 7, 8, 9, 10)}"
puts "#{Time.gm(2008, 7, 8, 9, 10, 11)}"

# 下面的实例在数组中获取所有的组件：
# [sec,min,hour,day,month,year,wday,yday,isdst,zone]
time = Time.new
values = time.to_a
p values  # => puts "#{values}"


# 下面是获取时间的方式，从纪元以来的秒数（平台相关）

# 返回从纪元以来的秒数
time = Time.now.to_i
puts "time class : #{time.class} time : #{time}"

# 把秒数转换为 Time 对象
time2 = Time.at(time)
puts "time2 class : #{time2.class} time : #{time2}"

# 返回从纪元以来的秒数，包含微秒
time = Time.now.to_f
puts "#{time}"



# @type 时区和夏令时
# 您可以使用 Time 对象来获取与时区和夏令时有关的所有信息

time = Time.new
puts "----时区和夏令时----"
p time.zone       # => "UTC"：返回时区
p time.utc_offset # => 0：UTC 是相对于 UTC 的 0 秒偏移
p time.zone       # => "PST"（或其他时区）
p time.isdst      # => false：如果 UTC 没有 DST（夏令时）
p time.utc?       # => true：如果在 UTC 时区
p time.localtime  # 转换为本地时区
p time.gmtime     # 转换回 UTC
p time.getlocal   # 返回本地区中的一个新的 Time 对象
p time.getutc     # 返回 UTC 中的一个新的 Time 对象


# @type 格式化时间和日期
# 有多种方式格式化日期和时间

puts "----格式化日期和时间----"
puts time.to_s
puts time.ctime
puts time.localtime
puts time.strftime("%Y/%m/%d %H:%M:%S")

# @type 时间算法
# 您可以用时间做一些简单的算术

now = Time.now          # 当前时间
puts now

past = now - 10         # 10 秒之前。Time - number => Time
puts past

future = now  + 10      # 从现在开始 10 秒之后。Time + number => Time
puts future

diff = future - now     # => 10  Time - Time => 秒数
puts diff
