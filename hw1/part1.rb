def palindrome?(string)
    fwd_string = string.downcase.gsub(/[^A-Za-z]/, '')
    rev_string = fwd_string.reverse
    return fwd_string == rev_string
end

def count_words(string)
  hash = {}
  string.downcase.scan(/\w+/).each do |word|
    count = hash[word]
    count == nil ? count = 1 : count = count + 1
    hash[word] = count
  end
  return hash
end

#puts count_words("A man, a plan, a canal -- Panama")
# => {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1}
#puts count_words "Doo bee doo bee doo"
# => {'doo' => 3, 'bee' => 2