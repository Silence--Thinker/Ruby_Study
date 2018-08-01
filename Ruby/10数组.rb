
# -*- code:utf-8 -*-
# /usr/bin/ruby -w

# @type Ruby 数组（Array）
# Ruby 数组是任何对象的有序整数索引集合。数组中的每个元素都与一个索引相关，并可通过索引进行获取。
# 一个负数的索相对于数组的末尾计数的，也就是说，索引为 -1 表示数组的最后一个元素，-2 表示数组中的倒数第二个元素，依此类推
# Ruby 数组不需要指定大小，当向数组添加元素时，Ruby 数组会自动增长


# @type 创建数组

array1 = Array.new
array2 = Array.new(20)

puts array2.size
puts array2.length

array3 = Array.new(5, "caoxiujin")
puts "#{array3}"

# 您也可以使用带有 new 的块，每个元素使用块中的计算结果来填充
array4 = Array.new(10) {|e| e = e * 2}
puts "#{array4}"

array5 = Array.[](1, 2, 3, 4, 5)
puts "#{array5}"

array6 = Array[1, 2, 3, 4, 5, 6]
puts "#{array6}"

# 在 Ruby 核心模块中可以有一个只接收单个参数的 Array 方法，该方法使用一个范围作为参数来创建一个数字数组：

digits = Array(0..9)
puts "#{digits}"

# @type 数组内建方法
# 我们需要有一个 Array 对象的实例来调用 Array 方法。下面是创建 Array 对象实例的方式：
# Array.[](...) [or] Array[...] [or] [...]

digits = Array(0..9)
num = digits.at(6)
puts "num = #{num}"

# array & other_array
# 返回一个新的数组，包含两个数组中共同的元素，没有重复。

puts "array & other_array #{ Array(0..9) & Array(4..10)}"

# array - other_array
# 返回一个新的数组，新数组是从初始数组中移除了在 other_array 中出现的项的副本。

# array + other_array
# 返回一个新的数组，新数组通过连接两个数组产生第三个数组创建的。

# array | other_array
# 通过把 other_array 加入 array 中，移除重复项，返回一个新的数组。

# array << obj
# 把给定的对象附加到数组的末尾。该表达式返回数组本身，所以几个附加可以连在一起。

# array <=> other_array
# 如果数组小于、等于或大于 other_array，则返回一个整数（-1、 0 或 +1）。

# array == other_array
# 如果两个数组包含相同的元素个数，且每个元素与另一个数组中相对应的元素相等（根据 Object.==），那么这两个数组相等。\

# array[index] [or] array[start, length] [or]
# array[range] [or] array.slice(index) [or]
# array.slice(start, length) [or] array.slice(range)
# 返回索引为 index 的元素，或者返回从 start 开始直至 length 个元素的子数组，或者返回 range 指定的子数组。
# 负值索引从数组末尾开始计数（-1 是最后一个元素）。如果 index（或开始索引）超出范围，则返回 nil。

# array.clear
# 从数组中移除所有的元素。

# array.at(index)
# 返回索引为 index 的元素。一个负值索引从 self 的末尾开始计数。如果索引超出范围则返回 nil。

# array.collect { |item| block } [or]
# array.map { |item| block }
# 为 self 中的每个元素调用一次 block。创建一个新的数组，包含 block 返回的值。

# array.collect! { |item| block } [or]
# array.map! { |item| block }
# 为 self 中的每个元素调用一次 block，把元素替换为 block 返回的值。

# array.compact
# 返回 self 的副本，移除了所有的 nil 元素。

# array.concat(other_array)
# 追加 other_array 中的元素到 self 中。

# array.delete(obj) [or]
# array.delete(obj) { block }
# 从 self 中删除等于 obj 的项。如果未找到相等项，则返回 nil。如果未找到相等项且给出了可选的代码 block，则返回 block 的结果

# array.delete_if { |item| block }
# 当 block 为 true 时，删除 self 的每个元素。

# array.eql?(other)
# 如果 array 和 other 是相同的对象，或者两个数组带有相同的内容，则返回 true。

# array.inspect
# 创建一个数组的可打印版本。

# array.insert(index, obj...)
# 在给定的 index 的元素前插入给定的值，index 可以是负值。


# 下表列出了方法 Array#pack 的压缩指令
# a = [ "a", "b", "c" ]
# n = [ 65, 66, 67 ]
# puts a.pack("A3A3A3")   #=> "a  b  c  "
# puts a.pack("a3a3a3")   #=> "a\000\000b\000\000c\000\000"
# puts n.pack("ccc")      #=> "ABC"