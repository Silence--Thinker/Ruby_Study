#!usr/bin/ruby -w

# -*- coding : utf-8 -*-

puts "hello world";

print <<EOF
    这是第一种方式创建here document 。
    多行字符串
EOF

print <<"EOF"
    这是第二种方式创建here document 。
    多行字符串
EOF

print <<'EOC'
    echo hi here
    echo lo there
EOC

# 堆叠
print <<"foo", <<"bar"
    I said foo.
foo
    I said bar
bar

# 转存
text = <<'foo'
    cat /etc/passwd
foo

puts text


