class Robot < ActiveRecord::Base
    belongs_to :code_name 

    has_many :robot_weapons
    has_many :weapons, through: :robot_weapons

    has_one :health, as: :machine 

    validates :code_name, presence: true #, message: "Needs to be a registered robot"
    validates :health, presence: true #, message: "Needs to be initialized with a health status"

    accepts_nested_attributes_for :health
    accepts_nested_attributes_for :robot_weapons

    delegate :damage, to: :code_name

    def alive?
        remaining_health > 0
    end

    def remaining_health
        self.health.current
    end

    def take_damage damage 
        # should not get lower than 0
        self.health.current -= damage
    end

    def calculate_damage(total_health=1)
        # doesn't need to be the highest one
        max_damage = self.damage
        robot_weapons.each do |weapon|
            max_damage = weapon.damage if weapon.stable? and max_damage < weapon.damage
        end
        max_damage
    end

end
