class Weapon < ActiveRecord::Base
    has_many :robot_weapons 
    has_many :robots, through: :robot_weapons

    # should be uniq - if created with the same name as one previously saved should return that one 
end
