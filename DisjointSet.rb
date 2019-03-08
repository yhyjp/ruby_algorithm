# http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=DSL_1_A
# Set - Disjoint Set: Union Find Tree

class DisjointSet
  def initialize(size)
    @parent = Array.new(size, 0)
    @rank = Array.new(size, 0)
    size.times { |i| @parent[i] = i }
  end

  def find_set(x)
    @parent[x] = find_set(@parent[x]) if x != @parent[x]
    @parent[x]
  end

  def union(x, y)
    link(find_set(x), find_set(y))
  end

  def same_set?(x, y)
    find_set(x) == find_set(y)
  end

  private

  def link(x, y)
    if @rank[x] > @rank[y]
      @parent[y] = x
    else
      @parent[x] = y
      if @rank[x] == @rank[y]
        @rank[y] = @rank[y] + 1
      end
    end
  end
end

n, q = gets.split.map(&:to_i)
ds = DisjointSet.new(n + 1)
q.times do
  com, x, y = gets.split.map(&:to_i)
  if com.zero?
    ds.union(x, y)
  elsif com == 1
    puts ds.same_set?(x, y) ? 1 : 0
  end
end
