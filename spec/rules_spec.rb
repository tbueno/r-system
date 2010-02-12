require 'rules'

describe Rules do
  before :each do
    	@rules = Rules.new("test")
  		@rules.class.class_eval do
  			axiom :F
  			production ({:F => 'F+F--F+F'})			   		
  		end
  		@rules.copyvars
  end
  
  context "producing rules" do
    it "should produce F" do
      @rules.produce('F').should == 'F+F--F+F'
      @rules.produce('F+F--F+F').should == 'F+F--F+F+F+F--F+F--F+F--F+F+F+F--F+F'
  	end
  	
  	it "should produce with PLUS" do
  	  @rules.produce('+').should == '+'
  	end
  	
  	it "should produce with MINUS" do
  	  @rules.produce('-').should == '-'
  	end
  	
  	it "should produce with F, Plus and Minus" do
  	  p = Rules.new("test")
  		p.class.class_eval do
  			production ({:F => 'F-F+F+F-F'})
  		end
  		p.copyvars
  		first_iteration = 'F-F+F+F-F'
    	second_iteration = 'F-F+F+F-F-F-F+F+F-F+F-F+F+F-F+F-F+F+F-F-F-F+F+F-F'
    	first_iteration.should == p.produce('F')
    	second_iteration.should == p.produce(first_iteration)		
  	end
  end
end
    
  