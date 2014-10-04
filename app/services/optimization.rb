class Optimization

  attr_accessor :max_value, :objects, :key
  attr_accessor :generations, :current_generation, :best_solutions

  def self.optimize(objects, key, max_value)
    o = Optimization.new(objects, key, max_value)
    o.run
    o.best[:objects]
  end

  def config
    {
      generations: 10000,
      population: 40,
      crossover: 0.5,
      mutation: 0.1
    }
  end

  def initialize(objects, key, max_value)
    self.generations = 1
    self.current_generation = []
    self.best_solutions = []
    self.objects = objects
    self.key = key
    self.max_value = max_value
  end

  def run
    create_initial_population
    repeat
    best
  end

  def best

    best_of_all = best_solutions.first

    best_solutions.each do |candidate|
      if best_of_all[:fitness] > candidate[:fitness]
        best_of_all = candidate
      end
    end

    best_of_all
  end

  def repeat
    while generations < config[:generations]
      calculate_generation_fitness
      add_best_solution
      create_next_generation
      mutation
      break if best_solutions.last[:fitness] == 0
    end
  end

  def mutation
    current_generation.each do |solution|
      if Random.rand < config[:mutation]
        random_index = Random.rand(solution[:objects].size)
        solution[:objects][random_index] = objects.sample
      end
    end
  end

  def create_initial_population
    config[:population].times do
      solution = { objects: [] }
      while evaluate_solution_sum(solution) < max_value
        solution[:objects] << objects.sample
      end
      current_generation << solution
    end
  end

  def evaluate_solution_sum(solution)
    solution[:objects].map{ |object| object[key] }.reduce(:+) || 0
  end

  def set_fitness(solution)
    solution[:fitness] = fitness(solution)
  end

  def fitness(solution)
    value = evaluate_solution_sum(solution) - max_value
    return value if value >= 0
    max = objects.sort{|x, y| x[key] <=> y[key] }.last
    - value * max[key]
  end

  def calculate_generation_fitness
    current_generation.each do |solution|
      set_fitness(solution)
    end
  end

  def add_best_solution
    best_solutions << best_solution
  end

  def best_solution
    current_generation.sort{ |x, y| x[:fitness] <=> y[:fitness] }.first
  end

  def create_next_generation

    next_generation = []

    while next_generation.size < config[:population]

      # Tomar dos pares de padres al azar, y mediante torneo elegir la siguiente generacion
      subset1 = random_parents
      subset2 = random_parents

      parent1 = tournament(subset1.first, subset2.first)
      parent2 = tournament(subset1.second, subset2.second)

     if Random.rand < config[:crossover]
        child1, child2 = crossover(parent1, parent2)
        next_generation << child1
        next_generation << child2
      else
        next_generation << parent1
        next_generation << parent2
      end
    end

    self.current_generation = next_generation
    self.generations += 1
  end

  def crossover(solution1, solution2)
    c1 = []
    c2 = []

    s1 = solution1[:objects]
    s2 = solution2[:objects]

    # child1 tiene la primera mitad de s1 y la segunda mitad de s2
    (s1.size/2+1).times { |index| c1 << s1[index] }
    (s2.size/2+1).times { |index| c1 << s2[index] }

    # child2 tiene la primera mitad de s2 y la segunda mitad de s1
    (s2.size/2+1).times { |index| c2 << s2[index] }
    (s1.size/2+1).times { |index| c2 << s1[index] }

    [{ objects: c1 }, { objects: c2 }]
  end

  def random_parents
    [current_generation.sample, current_generation.sample]
  end

  def tournament(solution1, solution2)
    solution1[:fitness] < solution2[:fitness] ? solution1 : solution2
  end

end