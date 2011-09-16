# require 'test/unit'

guard 'test' do
  watch(%r{^feeder.rb$})     { |m| "test/feeder_test.rb" }
  watch(%r{^goodanime_parser.rb$})     { |m| "test/goodanime_parser_test.rb" }
  watch(%r{^test/.+_test\.rb$})
  watch('test/test_helper.rb')  { "test" }
end