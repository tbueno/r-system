require 'production'
class LSystem
  #Alphabet
  #Axioms
  #productions
  
  def initialize
    @alphabet = ['a', 'b']
    @axiom = 'a'
    @production = Production.new({:a => 'b', :b => 'ba'})
    @text = ""
    puts @axiom
  end
  
  def generate
    if @text == ""
      @text << @production.produce(@axiom)
    else 
      @text = @production.produce(@text)
    end
    @text
  end
end


l = LSystem.new
puts l.generate
puts l.generate
puts l.generate
puts l.generate
puts l.generate