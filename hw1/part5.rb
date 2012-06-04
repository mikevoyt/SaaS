class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_reader attr_name # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval "def #{attr_name}=(new_value)
                  @#{attr_name} = new_value
                  @#{attr_name}_history ||= [nil]
                  @#{attr_name}_history.push(new_value)
                end"
  end

end

class Foo
  attr_accessor_with_history :bar
end

# metaprogramming to the rescue!

class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1.0}
  def method_missing(method_id, *args)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end

  def in(tag)
    singular_currency = tag.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self / @@currencies[singular_currency]
    else
      super
    end
  end
end


#p 10.euros
#p 10.rupees.in(:euro)

#f = Foo.new
#f.bar = 1
#f.bar = 2
#p f.bar_history
#f = Foo.new
#f. bar = 4
#p f.bar_history