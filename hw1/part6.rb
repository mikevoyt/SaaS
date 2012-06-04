class CartesianProduct
  include Enumerable
  def initialize(a, b)
    @a = a
    @b = b
  end

  def each
    @a.each do |a|
      @b.each do |b|
        yield [a, b]
      end
    end
  end

end

#c = CartesianProduct.new([:a,:b], [4,5])
#c.each { |elt| puts elt.inspect }
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]

c = CartesianProduct.new([:a,:b], [])
c.each { |elt| puts elt.inspect }
# (nothing printed since Cartesian product
# of anything with an empty collection is empty)

x = [1,2,3]
x.send :[]=,0,2
#p x[0] + x.[](1) + x.send(:[],2)


class Book
  attr_accessor :author
  attr_reader :title
  attr_writer :comments
  def initialize(author, title)
    @author = author
    @title = title
    @comments = []
  end
end

book = Book.new("Chuck Palahniuk", "Fight Club")

"#{book.title} was written by #{book.author}."

#p book.superclass

movies = [%q{"Aladdin",   "G"},
          %q{"I, Robot", "PG-13"},
          %q{"Star Wars","PG"}]

regexp = /"([^"]+)",\s*"([^"]+)"/

movies.each do |movie|
  movie.match(regexp)
  title,rating = $1,$2
  puts title + " " + rating

end
