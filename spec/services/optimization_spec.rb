require 'rails_helper'

RSpec.describe Optimization do

  it '#sum_values using integers' do
    expect(Optimization.sum_values([2, 2, 2])).to eq(6)
  end

  it '#sum_values using hashes' do
    expect(Optimization.sum_values([{ value: 1 }, { value: 2 }, { value: 4 }], :value)).to eq(7)
    expect(Optimization.sum_values([{ value: 1 }, { value: 2 }, { value: 4 }], :missing_key)).to eq(-1)
  end

  it '#all_combinations (arrays)' do
    expect(Optimization.all_combinations([1, 2, 3])).to eq([[1],[2],[3],[1,2],[1,3],[2,3],[1,2,3]])
  end

  it '#all_combinations (hashes)' do
    arr = [{ value: 1 }, { value: 2 }, { value: 3 }]
    expect(Optimization.all_combinations(arr)).to eq([[arr.first],[arr.second],[arr.third],[arr.first,arr.second],[arr.first,arr.third],[arr.second,arr.third],[arr.first,arr.second,arr.third]])
  end

  it '#normalized_combinations (array)' do
    arr = [1, 2, 3]
    result = [{:combination=>[1], :value=>-1}, {:combination=>[2], :value=>0}, {:combination=>[3], :value=>1}, {:combination=>[1, 2], :value=>1}, {:combination=>[1, 3], :value=>2}, {:combination=>[2, 3], :value=>3}, {:combination=>[1, 2, 3], :value=>4}]
    expect(Optimization.normalized_combinations(Optimization.all_combinations(arr), 2)).to eq(result)
  end

  it '#normalized_combinations (hashes)' do
    arr = [{ value: 1 }, { value: 2 }, { value: 3 }]
    result = [{:combination=>[{:value=>1}], :value=>-1}, {:combination=>[{:value=>2}], :value=>0}, {:combination=>[{:value=>3}], :value=>1}, {:combination=>[{:value=>1}, {:value=>2}], :value=>1}, {:combination=>[{:value=>1}, {:value=>3}], :value=>2}, {:combination=>[{:value=>2}, {:value=>3}], :value=>3}, {:combination=>[{:value=>1}, {:value=>2}, {:value=>3}], :value=>4}]
    expect(Optimization.normalized_combinations(Optimization.all_combinations(arr), 2, :value)).to eq(result)
  end

  it '#delete_negative' do
    expect(Optimization.delete_negative([{ value: -1}, {value: -2}, {value: 1 }])).to eq ([{ value: 1 }])
    expect(Optimization.delete_negative([{ value: -1}, {value: -2}, {value: -10 }])).to eq ([])
    expect(Optimization.delete_negative([{ value: 1}, {value: 2}])).to eq([{ value: 1}, {value: 2}])
  end

  it '#sort_combinations' do
    ordered = [{ value: 1 }, { value: 2 }, { value: 3 }]
    expect(Optimization.sort_combinations(ordered.shuffle)).to eq(ordered)
    expect(Optimization.sort_combinations(ordered.shuffle)).to eq(ordered)
    expect(Optimization.sort_combinations(ordered.shuffle)).to eq(ordered)
    expect(Optimization.sort_combinations(ordered.shuffle)).to eq(ordered)
    expect(Optimization.sort_combinations([])).to eq([])
  end

  it '#optimize (using arrays)' do
    expect(Optimization.optimize(1, [1, 2, 3])).to eq({ value: 0, combination: [1] })
    expect(Optimization.optimize(1, [0, 1, 2, 3])).to eq({ value: 0, combination: [1] })
    expect(Optimization.optimize(2, [1, 2, 3])).to eq({ value: 0, combination: [2] })
    expect(Optimization.optimize(3, [1, 2, 3])).to eq({ value: 0, combination: [3] })
    expect(Optimization.optimize(4, [1, 2, 3])).to eq({ value: 0, combination: [1,3] })
  end

  it '#optimize (using hashes)' do
    arr1 = [{ value: 1 }, { value: 2 }, { value: 3 }]
    arr2 = [{ value: 0 }, { value: 1 }, { value: 2 }, { value: 3 }]
    expect(Optimization.optimize(1, arr1, :value)).to eq({ value: 0, combination: [arr1.first] })
    expect(Optimization.optimize(1, arr2, :value)).to eq({ value: 0, combination: [arr1.first] })
    expect(Optimization.optimize(2, arr1, :value)).to eq({ value: 0, combination: [arr1.second] })
    expect(Optimization.optimize(3, arr1, :value)).to eq({ value: 0, combination: [arr1.third] })
    expect(Optimization.optimize(4, arr1, :value)).to eq({ value: 0, combination: [arr1.first, arr1.third] })
  end

end
