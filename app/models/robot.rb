class Robot < ActiveRecord::Base
	belongs_to :code_name 

	has_many :robot_weapons
	has_many :weapons, through: :robot_weapons

	has_one :health, as: :machine 
end
