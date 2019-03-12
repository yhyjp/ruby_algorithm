require "bigdecimal"
a, b = gets.split.map { |x| BigDecimal(x) }
ans = (a / b)
if ans > 0
  puts ans.floor
else
  puts ans.ceil
end
