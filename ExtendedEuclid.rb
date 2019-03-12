# http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=NTL_1_E
# Elementary Number Theory - Extended Euclid Algorithm

def ext_gcd(a, b)
  if (b == 0)
    [1, 0]
  else
    q, t = a.divmod(b)
    x, y = ext_gcd(b, a % b)
    [y, x - q * y]
  end
end

a, b = gets.split.map(&:to_i)
x, y = ext_gcd(a, b)
puts "#{x} #{y}"
