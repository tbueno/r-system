# Simple ruby implementation od L-System
#
# Alphabet:
# => 'F' = Move Forward'
# => '+' = Turn Right
# => '-' = Turn Left

#Axioms
#productions


require 'rules'
class LSystem
   
  attr_accessor :prod
  
  def copyvars
  self.class.instance_variables.each do |var|
   instance_variable_set(var, self.class.instance_variable_get(var))
  end 
 end

  def self.create(&block)
    l = LSystem.new    
    l.class.class_eval(&block) if block_given?
    l.copyvars        
    return l
  end
  
  def self.rule(name, &blk)
    p = Rules.new(name)
    p.class.class_eval(&blk)   
    @prod = p
    @text = @axiom.to_s 
    p.copyvars       
  end
    
  
  def self.alphabet(a)
    @alphabet = a    
  end
  
  def self.axiom(sym)
    @axiom = sym
  end
  
  def generate   
    @text = @prod.produce(@text)
    @text
  end
end


l = LSystem.create do 
  alphabet ['F', '-', '-']
  axiom :F  
  rule "First" do
    production ({:F => 'F-F+F+F-F'})
  end  
end

puts l.generate
puts l.generate

