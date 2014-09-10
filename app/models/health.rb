class Health < ActiveRecord::Base
	belongs_to :machine, polymorphic: true 
end
