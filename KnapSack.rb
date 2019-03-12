# http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=DPL_1_C&lang=jp
# Combinatorial - Knapsack Problem

n, maxW = gets.split.map(&:to_i)
vw = Array.new
n.times do
  v, w = gets.split.map(&:to_i)
  vw << { v: v, w: w }
end

maxW += 1
dp = Array.new(n) { Array.new(maxW, 0) }

n.times do |i|
  (1...maxW).each do |j|
    if i == 0
      dp[i][j] = j / vw[i][:w] * vw[i][:v]
    else
      if j >= vw[i][:w]
        dp[i][j] = [dp[i - 1][j], dp[i][j - 1], dp[i][j - vw[i][:w]] + vw[i][:v]].max
      else
        dp[i][j] = [dp[i - 1][j], dp[i][j - 1]].max
      end
    end
  end
end

puts dp[n - 1][maxW - 1]
