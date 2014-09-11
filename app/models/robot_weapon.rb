class RobotWeapon < ActiveRecord::Base
    belongs_to :robot 
    belongs_to :weapon 

    has_one :health, as: :machine 

    validates :robot, presence: true
    validates :weapon, presence: true

    validates :health, presence: true
    accepts_nested_attributes_for :health

    after_initialize :check_attrs

    def check_attrs
        self.health = Health.new unless  self.health
    end

    delegate :damage, to: :weapon

    def stable?
        self.health.current > 0
    end

end
