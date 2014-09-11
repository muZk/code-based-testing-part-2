require 'rails_helper'

RSpec.describe Weapon, :type => :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  context "Factories" do 
    it ":health" do 
      health = FactoryGirl.create(:gun)
      expect(health.id).to be > 0
    end

    it ":health_800" do 
      health = FactoryGirl.create(:rifle)
      expect(health.id).to be > 0
    end

    it ":health_1000" do 
      health = FactoryGirl.create(:machine_gun)
      expect(health.id).to be > 0
    end

    it ":health_x" do 
      health = FactoryGirl.create(:bazuka)
      expect(health.id).to be > 0
    end

    it "should not create two different instances for the same (defined) Weapon" do 
      gun1 = FactoryGirl.create(:bazuka)
      gun2 = FactoryGirl.create(:bazuka)
      expect(gun1.id == gun2.id).to be true
    end
  end

end
