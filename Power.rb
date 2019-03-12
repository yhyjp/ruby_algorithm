# http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=NTL_1_B
# Elementary Number Theory - Power

def power(n, m, cache)
  return 1 if m.zero?
  return n if m == 1
  if (cache[n])
    return cache[n][m] if cache[n].has_key?(m)
  else
    cache[n] = {}
  end
  t = power(n, m / 2, cache) % 1000000007
  cache[n][m] = (m % 2 == 1 ? t * t * n : t * t) % 1000000007
end

n, m = gets.split.map(&:to_i)
cache = {}
puts power(n, m, cache)
