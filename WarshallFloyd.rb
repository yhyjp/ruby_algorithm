
inf = 2 ** 50
vn, en = gets.split.map(&:to_i)
adj = Array.new(vn) { Array.new(vn, inf) }

vn.times do |i|
  adj[i][i] = 0
end

en.times do
  s, t, d = gets.split.map(&:to_i)
  adj[s][t] = d
end

vn.times do |k|
  vn.times do |i|
    vn.times do |j|
      if (adj[i][k] != inf && adj[k][j] != inf)
        adj[i][j] = [adj[i][j], adj[i][k] + adj[k][j]].min
      end
    end
  end
end

has_negative = false

vn.times do |i|
  has_negative = true if adj[i][i] < 0
end

if has_negative
  puts "NEGATIVE CYCLE"
else
  vn.times do |i|
    vn.times do |j|
      print(" ") if j != 0
      print(adj[i][j] >= inf ? "INF" : adj[i][j])
    end
    puts()
  end
end
