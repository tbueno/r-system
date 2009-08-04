class Rules
  
  def initialize(name)
    @name = name
  end
  
  def copyvars
  self.class.instance_variables.each do |var|
   instance_variable_set(var, self.class.instance_variable_get(var))
  end 
 end
  
  def self.production(rules)
    @rules = rules
  end
  
  def produce(text)    
    return produce_char(text) if text.size == 1
    produced_text = ''
    text.split('').each do |c|
      produced_text << produce_char(c)
    end
    produced_text
  end
  
  private
  def produce_char(c)   
    return c if (c == '-' or c == '+')
    @rules[c.to_sym]
  end
end
