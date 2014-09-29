class Weapon < ActiveRecord::Base
  has_many :robot_weapons
  has_many :robots, through: :robot_weapons

  # should be uniq by name -
  # if created with the same name as one previously saved should return that one

  # validates :name, uniqueness: true
  # validate :get_instance_by_name

  def get_instance_by_name
    # return the existing object if any, otherwise return true
  end

  def new_record?
    if self.name.present?
      weapon = Weapon.find_by(name: self.name)
      if weapon.present?
        self.id = weapon.id
        self.created_at = weapon.created_at
        return false
      end
    end
    super
  end

end
