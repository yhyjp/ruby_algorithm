# http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=DPL_1_F
# Combinatorial - Knapsack Problem II

n, maxW = gets.split.map(&:to_i)
vw = Array.new
maxV = 0
n.times do
  v, w = gets.split.map(&:to_i)
  vw << { v: v, w: w }
  maxV += v
end

maxV += 1
inf = 2000000000
dp = Array.new(n) { Array.new(maxV, inf) }

n.times do |i|
  dp[i][0] = 0
end

n.times do |i|
  (0...maxV).each do |j|
    if i == 0
      dp[i][j] = vw[i][:w] if vw[i][:v] == j
    else
      if dp[i - 1][j] < inf
        dp[i][j] = [dp[i - 1][j], dp[i][j]].min
        if (dp[i - 1][j] + vw[i][:w] <= maxW)
          dp[i][j + vw[i][:v]] = [dp[i][j + vw[i][:v]], dp[i - 1][j] + vw[i][:w]].min
        end
      end
    end
  end
end

printed = false
(0...maxV).reverse_each do |j|
  if dp[n - 1][j] <= maxW
    puts j
    printed = true
    break
  end
end

puts 0 if !printed
