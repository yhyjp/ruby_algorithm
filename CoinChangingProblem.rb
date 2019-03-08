# http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=DPL_1_A
# Combinatorial - Coin Changing Problem

n, m = gets.split.map(&:to_i)
c = gets.split.map(&:to_i)
n += 1
c.sort!
inf = n * 2
dp = Array.new(m) { Array.new(n, inf) }

0.step(n, c[0]).each_with_index do |x, i|
  dp[0][x] = i
end

(1...m).each do |i|
  n.times do |j|
    if (j - c[i] < 0)
      dp[i][j] = [dp[i - 1][j], dp[i][j]].min
    else
      dp[i][j] = [
        dp[i - 1][j - c[i]] + 1,
        dp[i - 1][j],
        dp[i][j - c[i]] + 1,
      ].min
    end
  end
end

puts dp[m - 1][n - 1]
