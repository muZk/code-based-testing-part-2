class RobotWeapon < ActiveRecord::Base
	belongs_to :robot 
	belongs_to :weapon 

	has_one :health, as: :machine 
end
