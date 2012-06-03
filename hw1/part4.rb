class Dessert
  def initialize(name, calories)
    @name = name
    @calories = calories
  end
  def name
    @name
  end
  def name=(new_name)
    @name = new_name
  end
  def calories
    @calories
  end
  def calories=(new_calories)
    @calories = new_calories
  end
  def healthy?
    @calories < 200 ? true : false
  end
  def delicious?
    true
  end end
class JellyBean < Dessert
  def initialize(name, calories, flavor)
    @flavor = flavor
  end
  def flavor
    @flavor
  end
  def flavor=(new_flavor)
    @flavor = new_flavor
  end
  def delicious?
    @flavor == "black licorice" ? false : true
  end
end

#d = JellyBean.new("bean", 100, "black licorice")
#d.flavor = "pie"
#p d.delicious?