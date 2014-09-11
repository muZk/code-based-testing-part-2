FactoryGirl.define do

    factory :robot do
        after(:build) do |roboto, evaluator|
            gun = FactoryGirl.create(:gun) # could be affected 
            roboto.health = FactoryGirl.build(:health)
            roboto.weapons = [gun]
            roboto.save 
        end
    end

    factory :t_800, class: Health do
        after(:build) do |roboto, evaluator|
            gun = FactoryGirl.create(:rifle) # could be affected 
            roboto.health = FactoryGirl.build(:health_800)
            roboto.weapons = [gun]
            roboto.save 
        end
    end

    factory :t_1000, class: Health do
        after(:build) do |roboto, evaluator|
            gun = FactoryGirl.create(:machine_gun) # could be affected 
            roboto.health = FactoryGirl.build(:health_1000)
            roboto.weapons = [gun]
            roboto.save 
        end
    end

    factory :t_x, class: Health do
        after(:build) do |roboto, evaluator|
            gun = FactoryGirl.create(:gun) # could be affected 
            rifle = FactoryGirl.create(:rifle) # could be affected 
            machine_gun = FactoryGirl.create(:machine_gun) # could be affected 
            bazuka = FactoryGirl.create(:bazuka) # could be affected 
            roboto.health = FactoryGirl.build(:health_x)
            roboto.weapons = [gun, rifle, machine_gun, bazuka]
            roboto.save 
        end
    end

end