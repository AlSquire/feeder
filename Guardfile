# require 'test/unit'

guard 'test' do
  watch(%r{^feeder.rb$})     { |m| "test/feeder_test.rb" }
  watch(%r{^test/.+_test\.rb$})
  watch('test/test_helper.rb')  { "test" }
end