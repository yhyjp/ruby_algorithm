# http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=NTL_1_A
# Elementary Number Theory - Prime Factorize
require "prime"
n = gets.to_i
print "#{n}:"
n.prime_division.each do |x|
  x[1].times do
    print " #{x[0]}"
  end
end
puts
