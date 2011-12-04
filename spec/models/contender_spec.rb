require 'spec_helper'

describe Contender do
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
