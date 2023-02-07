# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return if self.empty?
        self.max - self.min
    end
    
    def average
        return if self.empty?
        self.sum / self.length.to_f
    end

    def median
        return if self.empty?
        self.length % 2 == 0 ? self.sort[self.length / 2 - 1 .. self.length / 2].average : self.sort[self.length / 2]
    end

    def counts
        hash = Hash.new(0)

        self.each { |v| hash[v] += 1 }
        hash
    end
    
    def my_count(val)
        self.inject(0) { |acc, ele| ele == val ? acc + 1 : acc }
    end

    def my_index(val)
        self.each_with_index { |v, i| return i if v == val}
        return
    end

    def my_uniq
        new_arr = []
        self.each { |v| new_arr << v if !new_arr.include?(v) }
        new_arr
    end

    def my_transpose
        (0 ... self.length).map { |i| self.map { |v| v[i] } }
    end
end
