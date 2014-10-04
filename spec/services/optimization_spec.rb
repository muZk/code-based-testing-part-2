require 'rails_helper'

RSpec.describe Optimization do

  it '#optimize' do
    arr1 = [{ value: 1 }, { value: 2 }, { value: 3 }]

    o1 = Optimization.new(arr1, :value, 1)
    o1.run
    expect(o1.best[:fitness]).to eq(0)

    o1 = Optimization.new(arr1, :value, 2)
    o1.run
    expect(o1.best[:fitness]).to eq(0)

    o1 = Optimization.new(arr1, :value, 3)
    o1.run
    expect(o1.best[:fitness]).to eq(0)

    o1 = Optimization.new(arr1, :value, 4)
    o1.run
    expect(o1.best[:fitness]).to eq(0)

    o1 = Optimization.new(arr1, :value, 10)
    o1.run
    expect(o1.best[:fitness]).to eq(0)
  end

end
