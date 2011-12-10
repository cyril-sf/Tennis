require 'spec_helper'

describe User do
  describe 'attributes' do
    [:email, :admin].each do |attr|
      it "responds to #{attr}" do
        User.new.should respond_to(attr)
      end
    end
  end

  describe 'associations' do
    it 'has many contenders' do
      User.should have_many :contenders
    end
  end
end
