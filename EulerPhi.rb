# http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=NTL_1_D
# Elementary Number Theory - Euler's Phi Function

def phi(n)
  return 0 if n == 0
  lim = 1000000000
  ret = n
  i = 2
  while i * i <= lim
    if n % i == 0
      ret -= ret / i
      n /= i while n % i == 0
    end
    i += 1
  end
  ret -= ret / n if n > 1
  ret
end

n = gets.to_i
puts phi(n)
