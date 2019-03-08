# http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=GRL_7_A&lang=jp
# Matching - Bipartite Matching

# 0=s, 1=t
class EdmondsKarp
  def initialize(n)
    @n = n
    @flow = Array.new(n) { Array.new(n, 0) }
    @cap = Array.new(n) { Array.new(n, 0) }
  end

  def connect(s, t, w)
    @cap[s][t] = w
  end

  def calc
    inf = 2 ** 30
    sum = 0
    while true
      que = [0]
      prev = Array.new(@n, -1)
      prev[0] = 0
      while !que.empty? && prev[1] == -1
        u = que.shift
        @n.times do |i|
          if prev[i] == -1 && @cap[u][i] - @flow[u][i] > 0
            prev[i] = u
            que.push(i)
          end
        end
      end
      return sum if (prev[1] == -1)
      inc = inf
      c = 1
      while c != 0
        inc = [inc, @cap[prev[c]][c] - @flow[prev[c]][c]].min
        c = prev[c]
      end
      c = 1
      while c != 0
        @flow[prev[c]][c] += inc
        @flow[c][prev[c]] -= inc
        c = prev[c]
      end
      sum += inc
    end
  end
end

xn, yn, en = gets.split.map(&:to_i)
n = xn + yn + 2
g = EdmondsKarp.new(n)

xn.times do |i|
  g.connect(0, 2 + i, 1)
end
yn.times do |i|
  g.connect(2 + xn + i, 1, 1)
end

en.times do
  x, y = gets.split.map(&:to_i)
  g.connect(2 + x, 2 + xn + y, 1)
end

puts g.calc
