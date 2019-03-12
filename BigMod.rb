require "bigdecimal"
a, b = gets.split.map { |x| BigDecimal(x) }
puts (a % b).floor
