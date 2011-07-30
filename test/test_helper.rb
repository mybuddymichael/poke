require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require_relative '../main'

module Poke
  class Test < MiniTest::Unit::TestCase

    def self.test(name, &block)
      define_method("test_#{name.gsub(/\W/,'_')}", &block) if block
    end

  end
end
