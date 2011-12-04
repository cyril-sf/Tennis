# This file contains custom RSpec matchers to allow for more consise/readable
# model specs.

# Verifies that the ActiveModel instance has errors on the specified attribute
#
# Usage:
#
# context 'when the required foo is missing' do
#   it 'is not valid' do
#     Bar.new(:foo => nil).should have_errors_on :foo
#   end
# end
RSpec::Matchers.define :have_errors_on do |expected|
  match do |object|
    !object.valid? and object.errors.messages.has_key?(expected) and !object.errors[expected].empty?
  end

  failure_message_for_should do |object|
    actual = object.errors.keys.join(", ")
    "Expected #{object.inspect} to have errors on #{expected}, but actually had errors on [#{actual}]."
  end
end

