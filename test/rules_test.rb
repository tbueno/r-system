$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require 'test/unit'
require 'rules'

class ProductionTest < Test::Unit::TestCase
	
	def setup
		@rules = Rules.new("test")
		@rules.class.class_eval do
			axiom :F
			production ({:F => 'F+F--F+F'})			   		
		end
		@rules.copyvars
    #@production.class.class_eval(&blk) 
	end
	
	def test_produce_with_F		
		assert_equal 'F+F--F+F', @rules.produce('F')
		assert_equal 'F+F--F+F+F+F--F+F--F+F--F+F+F+F--F+F', @rules.produce('F+F--F+F')
	end
	
	def test_produce_with_plus
		assert_equal '+', @rules.produce('+')
	end
	
	def test_produce_with_minus
		assert_equal '-', @rules.produce('-')
	end
	
	def test_produce_with_plus_and_minus
		assert_equal '+-', @rules.produce('+-')
	end
	
	def test_produce_with_F_plus_and_minus
		p = Rules.new("test")
		p.class.class_eval do
			production ({:F => 'F-F+F+F-F'})
		end
		p.copyvars
		first_iteration = 'F-F+F+F-F'
		second_iteration = 'F-F+F+F-F-F-F+F+F-F+F-F+F+F-F+F-F+F+F-F-F-F+F+F-F'
		assert_equal first_iteration, p.produce('F')
		assert_equal second_iteration, p.produce(first_iteration)		
	end
	
	#TODO need to test alphabets and axioms
	
end

