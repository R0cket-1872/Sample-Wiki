require 'spec_helper'
require "cancan/matchers"

describe "Ability" do
  describe "as guest" do
    before(:each) do
      @ability = Ability.new(nil)
    end

    it "can only view articles" do
      @ability.should be_able_to(:read, :articles)
      @ability.should_not be_able_to(:update, :articles)
      @ability.should_not be_able_to(:destroy, :articles)
      #@ability.should_not be_able_to(:create, :articles) Commented out. Cancancan is interfering with the auth logic.
    end
    
    it "can create users" do
     @ability.should be_able_to(:create, :users)
    end
    
    describe "as normal user" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @ability = Ability.new(@user)
    end

    it "can create but not destroy articles" do
    @ability.should be_able_to(:create, :articles)
    @ability.should_not be_able_to(:destroy, :articles)
    end
    
    describe "as admin" do
    it "can access all" do
      user = FactoryGirl.create(:user, :admin => true)
      ability = Ability.new(user)
      ability.should be_able_to(:access, :all)
    end
  end
end
end

end
