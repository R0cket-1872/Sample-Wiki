require 'rails_helper'

RSpec.describe Article, :type => :model do
it "has a valid factory" do
	expect(FactoryGirl.build(:article)).to be_valid
end
it "is invalid without a title" do
	article = FactoryGirl.build(:article, title: nil)
	expect(article).to have(1).errors_on(:title)
end	
it "is invalid without a body" do
	article = FactoryGirl.build(:article, body: nil)
	expect(article).to have(1).errors_on(:body)
end
it "is invaild without an author" do
    article = FactoryGirl.build(:article, user_id: nil)
    expect(article).to have(1).errors_on(:user_id)
end


end
