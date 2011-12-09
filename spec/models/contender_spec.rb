require 'spec_helper'

describe Contender do
  describe 'attributes' do
    [:side, :set1, :set2, :set3].each do |attr|
      it "responds to #{attr}" do
        Contender.new.should respond_to(attr)
      end
    end
  end

  describe 'associations' do
    it 'belongs to a user' do
      Contender.should belong_to :user
    end

    it 'belongs to a match' do
      Contender.should belong_to :match
    end
  end

  describe 'validation' do
    before(:all) do
      @contender = Contender.new
    end

    [:set1, :set2, :set3].each do |set|
      it "ensures #{set} is an integer greater or equal to 0" do
        @contender.should have_errors_on(set)
      end
    end
  end
end
