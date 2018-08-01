
# -*- code:utf-8 -*-
# /usr/bin/ruby -w

# @type Ruby 哈希（Hash）
# 哈希类似于一个数组，只不过它的索引不局限于使用数字。 Hash 的索引（或者叫"键"）几乎可以是任何对象。
# Hash 的元素没有特定的顺序。 如果顺序很重要的话就要使用数组了。

# @tyep 创建哈希

hash1 = Hash.new
puts "hash1 #{hash1}"

hash2 = Hash.new("month")
puts "hash2 #{hash2}"


# 当您访问带有默认值的哈希中的任意键时，如果键或值不存在，访问哈希将返回默认值
puts "#{hash2[0]}"
puts "#{hash2[72]}"

hash3 = Hash["a" => 100, "b" => 200]
puts "hash3 #{hash3}"
puts "#{hash3['a']}"
puts "#{hash3['b']}"
puts "#{hash3[72]}"

# 您可以使用任何的 Ruby 对象作为键或值，甚至可以使用数组，如下实例所示：
hash4 = Hash[[1, "jan"] => "January"]
puts "hash4 #{hash4}"


# @type 哈希内置方法
# 如果需要调用 Hash 方法，需要先实例化一个 Hash 对象。下面是创建 Hash 对象实例的方式：
# Hash[[key =>|, value]* ] or
#
# Hash.new [or] Hash.new(obj) [or]
#
# Hash.new { |hash, key| block }

$, = ", "
hash5 = Hash.new("month")
hash5 = {"1" => "January", "2" => "February"}

hash6 = Hash.new {|hash, key| hash[key] = "just hash #{key}"}
puts "#{hash6["cao"]}"
puts "#{hash6["xiu"]}"
puts "#{hash6["jin"].upcase}"

puts "hash6 #{hash6}"

keys = hash5.keys
puts "hash5 keys #{keys}"


# hash == other_hash
# 检查两个哈希是否具有相同的键值对个数，键值对是否相互匹配，来判断两个哈希是否相等。

# hash.[key]
# 使用键，从哈希引用值。如果未找到键，则返回默认值。

# hash.clear
# 从哈希中移除所有的键值对。

# hash.default(key = nil)
# 返回 hash 的默认值，如果未通过 default= 进行设置，则返回 nil。（如果键在 hash 中不存在，则 [] 返回一个默认值。）

# hash.default = obj
# 为 hash 设置默认值。

# hash.default_proc
# 如果 hash 通过块来创建，则返回块。

# hash.delete(key) [or]
# array.delete(key) { |key| block }
# 通过 key 从 hash 中删除键值对。如果使用了块 且未找
#
#
# 到匹配的键值对，则返回块的结果。把它与 delete_if 进行比较。

# hash.delete_if { |key,value| block }
# block 为 true 的每个块，从 hash 中删除键值对。

# hash.each { |key,value| block }
# 遍历 hash，为每个 key 调用一次 block，传递 key-value 作为一个二元素数组。

# hash.fetch(key [, default] ) [or]
# hash.fetch(key) { | key | block }
# 通过给定的 key 从 hash 返回值。如果未找到 key，且未提供其他参数，则抛出 IndexError 异常；
# 如果给出了 default，则返回 default；如果指定了可选的 block，则返回 block 的结果。

# hash.invert
# 创建一个新的 hash，倒置 hash 中的 keys 和 values。也就是说，在新的哈希中，hash 中的键将变成值，值将变成键。

# hash.length
# 以整数形式返回 hash 的大小或长度。

# hash.merge(other_hash) [or]
# hash.merge(other_hash) { |key, oldval, newval| block }
# 返回一个新的哈希，包含 hash 和 other_hash 的内容，重写 hash 中与 other_hash 带有重复键的键值对。

# hash.rehash
# 基于每个 key 的当前值重新建立 hash。如果插入后值发生了改变，该方法会重新索引 hash。