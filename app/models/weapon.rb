class Weapon < ActiveRecord::Base
  has_many :robot_weapons
  has_many :robots, through: :robot_weapons

  # should be uniq by name -
  # if created with the same name as one previously saved should return that one

  # validates :name, uniqueness: true
  # validate :get_instance_by_name

  before_create :lawl

  def initialize(attributes = nil, options = {})
    puts ':o'
    super
  end

  def lawl
    puts ':O'
  end

  def get_instance_by_name
    # return the existing object if any, otherwise return true
  end

  # def self.create(attributes, &block)
  #   if attributes.is_a?(Array)
  #     attributes.collect { |attr| create(attr, &block) }
  #   else
  #     if attributes.has_key?(:name)
  #       weapon = find_by(name: attributes[:name])
  #       return weapon if weapon.present?
  #     end
  #     object = new(attributes, &block)
  #     object.save
  #     object
  #   end
  # end
  #
  # def self.create!(attributes, &block)
  #   if attributes.is_a?(Array)
  #     attributes.collect { |attr| create!(attr, &block) }
  #   else
  #     if attributes.has_key?(:name)
  #       weapon = find_by(name: attributes[:name])
  #       return weapon if weapon.present?
  #     end
  #     object = new(attributes)
  #     yield(object) if block_given?
  #     object.save!
  #     object
  #   end
  # end

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
