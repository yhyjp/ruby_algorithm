# http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=NTL_1_C
# Elementary Number Theory - Least Common Multiple

n = gets.to_i
x = gets.split.map(&:to_i)

ans = x[0]
(1...x.size).each do |i|
  ans = ans * x[i] / ans.gcd(x[i])
end

puts ans
