class Production
  
  def initialize(rules)
    @rules = rules
  end
  
  def produce(text)
    produced_text = ''
    return produce_char(text) if text.size == 1
    text.split('').each do |c|
      produced_text << produce_char(c)
    end
    produced_text
  end
  
  private
  def produce_char(c)
    @rules[c.to_sym]
  end
end