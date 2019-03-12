# http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=DPL_1_C&lang=jp
# Combinatorial - Knapsack Problem

n = gets.to_i
a = []
n.times do
  a << gets.to_i
end

def lower_bound(arr, s, t, x)
  m = (s + t) / 2
  return s if s >= t - 1
  return lower_bound(arr, m, t, x) if (x >= arr[m])
  lower_bound(arr, s, m, x)
end

inf = 2 ** 30
dp = Array.new(n, inf)
n.times do |i|
  idx = dp.bsearch_index { |x| x >= a[i] }
  dp[idx] = a[i] if idx
end

res = dp.bsearch_index { |x| x >= inf }
if res
  puts res
else
  puts n
end
