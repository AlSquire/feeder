guard 'minitest' do
  # with Minitest::Unit
  # watch(%r|^test/test_(.*)\.rb|)
  # watch(%r|^lib/(.*)([^/]+)\.rb|)     { |m| "test/#{m[1]}test_#{m[2]}.rb" }
  # watch(%r|^test/test_helper\.rb|)    { "test" }

  # with Minitest::Spec
  watch(%r|^spec/(.*)_spec\.rb|)
  watch(%r|^lib/(.*)\.rb|)            { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r|^spec/spec_helper\.rb|)    { "spec" }

  watch(%r|^feeder.rb|)               { |m| "spec/feeder_spec.rb" }
  watch(%r|^goodanime_parser.rb|)     { |m| "spec/goodanime_parser_spec.rb" }
end
