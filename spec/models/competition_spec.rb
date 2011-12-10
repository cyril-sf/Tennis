require 'spec_helper'

describe Competition do
  describe 'attributes' do
    [:name].each do |attr|
      it "responds to #{attr}" do
        Competition.new.should respond_to(attr)
      end
    end
  end

  describe 'associations' do
    it 'has many contenders' do
      Competition.should have_many :matches
    end
  end

  describe 'initialization' do
    it 'creates the ladder' do
      c = Competition.new
      c[:ladder].is_a?(Array).should be_true
    end
  end
end
