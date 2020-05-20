$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
# require "_helper"

require "minitest/reporters"
require "minitest/autorun"

Minitest::Reporters.use! [Minitest::Reporters::ProgressReporter.new(:color => true)]

class Minitest::Test
  # include ..Helper
end