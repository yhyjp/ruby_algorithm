# http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=DPL_1_E
# Combinatorial - Edit Distance (Levenshtein Distance)

a = gets.chomp
b = gets.chomp

dp = Array.new(a.length + 1) { Array.new(b.length + 1, -1) }

(0..a.length).each do |i|
  dp[i][0] = i
end
(0..b.length).each do |i|
  dp[0][i] = i
end

(1..a.length).each do |i|
  (1..b.length).each do |j|
    dp[i][j] = [dp[i - 1][j] + 1, dp[i][j - 1] + 1,
                dp[i - 1][j - 1] + (a[i - 1] == b[j - 1] ? 0 : 1)].min
  end
end

puts dp[a.length][b.length]
