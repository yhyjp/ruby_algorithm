# http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=GRL_1_A
# Shortest Path - Single Source Shortest Path

require "set"

class St
  attr :p, :cost

  def initialize(p, cost)
    @p = p
    @cost = cost
  end

  def >(other)
    @cost == other.cost ? @p > other.p : @cost > other.cost
  end
end

class PriorityQueue
  def initialize()
    @data = []
  end

  def push(x)
    i = @data.bsearch_index { |y| y > x }
    if i
      @data.insert(i, x)
    else
      @data.push(x)
    end
  end

  def length()
    @data.length
  end

  def pop()
    @data.shift
  end
end

class Dijkstra
  def initialize(n)
    @n = n
    @adj = Array.new(n) { Array.new(0) }
  end

  def set(s, t, cost)
    @adj[s].push({ to: t, cost: cost })
  end

  def calc(s)
    @visited = Array.new(@n, -1)
    que = PriorityQueue.new
    que.push(St.new(s, 0))
    while que.length > 0
      current = que.pop
      cp = current.p
      next if (@visited[cp] != -1)
      @visited[cp] = current.cost
      @adj[cp].each do |a|
        if (@visited[a[:to]] == -1)
          que.push(St.new(a[:to], current.cost + a[:cost]))
        end
      end
    end
  end

  def result(p)
    @visited[p]
  end
end

vn, en, r = gets.split.map(&:to_i)
g = Dijkstra.new(vn)
en.times do
  s, t, d = gets.split.map(&:to_i)
  g.set(s, t, d)
end

g.calc(r)

vn.times do |i|
  res = g.result(i)
  puts(res == -1 ? "INF" : res)
end
