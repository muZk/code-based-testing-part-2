class CodeName < ActiveRecord::Base
	has_many :robots

	validates :name, length: { minimum: 3 }, message: "It has to be al least 3 characters long"
	
end
