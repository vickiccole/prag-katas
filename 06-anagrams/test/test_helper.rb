require "minitest/reporters"
require "minitest/autorun"

Minitest::Reporters.use! [Minitest::Reporters::ProgressReporter.new(:color => true)]