
# -*- code:utf-8 -*-
#! usr/bin/ruby -w

# @type 字符串

# @type 单引号字符串
# 最简单的字符串是单引号字符串，即在单引号内存放字符串
# 如果您需要在单引号字符串内使用单引号字符，那么需要在单引号字符串使用反斜杠(\)，
# 这样 Ruby 解释器就不会认为这个单引号字符是字符串的终止符号

puts '这是一个 Ruby 程序的字符串'


# @type 双引号字符串
# 在双引号字符串中我们可以使用 #{} 井号和大括号来计算表达式的值

name1 = "Joe"
name2 = "Mary"
puts "你好 #{name1}, #{name2} 在哪？"

x, y, z = 12, 36, 72
puts "x 的值为 #{ x }"
puts "x + y 的值为 #{ x + y }"
puts "x + y + z 的平均值为 #{ (x + y + z) / 3 }"

# 支持一种采用 %q 和 %Q 来引导的字符串变量，%q 使用的是单引号引用规则，
# 而 %Q 是双引号引用规则，后面再接一个 (! [ { 等等的开始界定符和与 } ] ) 等等的末尾界定符
# 跟在 q 或 Q 后面的字符是分界符.分界符可以是任意一个非字母数字的单字节字符.
# 如:[,{,(,<,!等,字符串会一直读取到发现相匹配的结束符为止.

desc1 = %Q{Ruby 的字符串可以使用 '' 和 ""。#{name1}}
desc2 = %q|Ruby 的字符串可以使用 '' 和 ""。#{name1}|      # %q单引号规则支持变量

puts desc1
puts desc2
puts "ssssssss #{desc1.to_c}" # return 一个复数


# @type 字符串内建方法
# 要有一个 String 对象的实例来调用 String 方法。下面是创建 String 对象实例的方式

myStr = String.new("THIS IS TEST")
foo = myStr.downcase
puts "#{foo}"
str = foo

# str % arg 使用格式规范格式化字符串。如果 arg 包含一个以上的替代，那么 arg 必须是一个数组
other = str % "this"
puts "#{other}"

# str * integer 返回一个包含 integer 个 str 的新的字符串。换句话说，str 被重复了 integer 次。
ary = str*3
puts "#{ary}"

# str + other_str 连接 other_str 到 str
puts "#{str + " hahha "}"

# str << obj 连接一个对象到字符串。如果对象是范围为 0.255 之间的固定数字 Fixnum，则它会被转换为一个字符。把它与 concat 进行比较。
puts "#{"1" << " hahha "}"

# str <=> other_str 把 str 与 other_str 进行比较，返回 -1（小于）、0（等于）或 1（大于）。比较是区分大小写的
puts "#{"abc" <=> "Abc"}"

# str == obj 检查 str 和 obj 的相等性。如果 obj 不是字符串，则返回 false，如果 str <=> obj，则返回 true，返回 0。
puts "#{"abc" == "Abc"}"

# str =~ obj 根据正则表达式模式 obj 匹配 str。返回匹配开始的位置，否则返回 false。
#puts "#{"abc" =~ ""}"

# str[position] 注意返回的是ASCII码而不是字符
puts "#{"abc"[2]}"
puts "#{str[0, 2]}"
puts "#{str[0..2]}"
puts "#{str[0...2]}"

# str.capitalize 把字符串转换为大写字母显示。
puts "#{str.capitalize}"      #This is test

# str.capitalize! 与 capitalize 相同，但是 str 会发生变化并返回。
puts "#{str.capitalize!}"     # This is test
puts "#{str}"                 # This is test

# str.casecmp 不区分大小写的字符串比较。
puts "#{"abc".casecmp("Abc")}"

# str.chomp 从字符串末尾移除记录分隔符（$/），通常是 \n。如果没有记录分隔符，则不进行任何操作

# str.chop 移除 str 中的最后一个字符。

# str.concat(other_str) 连接 other_str 到 str。

# str.count(str, ...) 给一个或多个字符集计数。如果有多个字符集，则给这些集合的交集计数
count = str.count("1 This is test qqq ttttt", "This is test ssss", "This is test jkljl")
puts "#{count}" # 0

# str.delete(other_str, ...)  返回 str 的副本，参数交集中的所有字符会被删除。
temp = str.delete("test", "est")
puts "#{temp}"

# str.each(separator=$/) { |substr| block } 使用参数作为记录分隔符（默认是 $/）分隔 str，传递每个子字符串给被提供的块。

# str.each_byte { |fixnum| block } 传递 str 的每个字节给 block，以字节的十进制表示法返回每个字节。

# str.each_line(separator=$/) { |substr| block } 使用参数作为记录分隔符（默认是 $/）分隔 str，传递每个子字符串给被提供的 block。

# str.eql?(other) 如果两个字符串有相同的长度和内容，则这两个字符串相等。

# str.gsub(pattern, replacement) [or]
# str.gsub(pattern) { |match| block }
# 返回 str 的副本，pattern 的所有出现都替换为 replacement 或 block 的值。pattern 通常是一个正则表达式 Regexp；
# 如果是一个字符串 String，则没有正则表达式元字符被解释（即，/\d/ 将匹配一个数字，但 '\d' 将匹配一个反斜杠后跟一个 'd'）。

# str.include? other_str [or] str.include? fixnum 如果 str 包含给定的字符串或字符，则返回 true。

# str.insert(index, other_str) 在给定索引的字符前插入 other_str，修改 str。负值索引从字符串的末尾开始计数，
# 并在给定字符后插入。其意图是在给定的索引处开始插入一个字符串。

#str.inspect 返回 str 的可打印版本，带有转义的特殊字符。

# str.lstrip 返回 str 的副本，移除了前导的空格。

# str.match(pattern) 如果 pattern 不是正则表达式，则把 pattern 转换为正则表达式 Regexp，然后在 str 上调用它的匹配方法。

# str.replace(other_str) 把 str 中的内容替换为 other_str 中的相对应的值。
temp = str;
temp.replace("tjossss")
puts "#{temp}"

# str.reverse 返回一个新字符串，新字符串是 str 的倒序。

# @type str.unpack(format)
# 根据 format 字符串解码 str（可能包含二进制数据），返回被提取的每个值的数组。
# format 字符由一系列单字符指令组成。每个指令后可以跟着一个数字，表示重复该指令的次数。 星号（*）将使用所有剩余的元素。
# 指令 sSiIlL 每个后可能都跟着一个下划线（_）， 为指定类型使用底层平台的本地尺寸大小，否则使用独立于平台的一致的尺寸大小。
# format 字符串中的空格会被忽略。

"abc \0\0abc \0\0".unpack('A6Z6')   #=> ["abc", "abc "]
"abc \0\0".unpack('a3a3')           #=> ["abc", " \000\000"]
"abc \0abc \0".unpack('Z*Z*')       #=> ["abc ", "abc "]
"aa".unpack('b8B8')                 #=> ["10000110", "01100001"]
"aaa".unpack('h2H2c')               #=> ["16", "61", 97]
"\xfe\xff\xfe\xff".unpack('sS')     #=> [-2, 65534]
"now=20is".unpack('M*')             #=> ["now is"]
"whole".unpack('xax2aX2aX1aX2a')    #=> ["h", "e", "l", "l", "o"]