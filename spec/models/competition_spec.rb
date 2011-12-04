require 'spec_helper'

describe Competition do
  describe 'initialization' do
    it 'creates the ladder' do
      c = Competition.new
      c[:ladder].is_a?(Array).should be_true
    end
  end
end
