class Optimization

  def self.optimize(sum, array, key = nil)
    sort_combinations(delete_negative(normalized_combinations(all_combinations(array), sum, key))).first
  end

  def self.normalized_combinations(combinations, sum, key = nil)
    combinations.map{ |c| { combination: c, value: sum_values(c, key) - sum } }
  end

  def self.delete_negative(combinations)
    combinations.delete_if{ |c| c[:value] < 0 }
  end

  def self.sort_combinations(combinations)
    combinations.sort { |c1, c2| c1[:value] <=> c2[:value] }
  end

  def self.all_combinations(array)
    all = []
    (1..array.size).each do |size|
      array.combination(size).to_a.each do |combination|
        all << combination
      end
    end
    all
  end

  def self.sum_values(array, key = nil)
    begin
      if key.present?
        array.map{ |element| element[key] }.reduce(:+)
      else
        array.reduce(:+)
      end
    rescue
      -1
    end
  end

end