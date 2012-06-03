class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_reader attr_name # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
#    attr_writer attr_name
    class_eval "def #{attr_name}=(new_value) ; @#{attr_name} = new_value; end"
  end

#  def setter_with_history=(attr_name)
# end

end

class Foo

  attr_accessor_with_history :bar


end

f = Foo.new("")
f.bar = "helloxx"
p f.bar