# O(n!) factorial
def first_anagram?(anagram, word)
  anagrams(anagram).include?(word)
end

def anagrams(word)
  return [word] if word.length <= 1
  first = word[0]
  perm_anagrams = anagrams(word[1..-1])
  all_anagrams = []
  perm_anagrams.each do |perm|
    (0..perm.length).each do |idx|
      all_anagrams << perm[0...idx] + first + perm[idx..-1]
    end
  end
  all_anagrams
end

p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true

# 0(n^2) quadratic
def second_anagram(anagram,word)
  word_dup = word.dup
  anagram_dup = anagram.dup

  word.chars.each do |el|
    if anagram.include?(el)
      word_dup.delete!(el)
      anagram_dup.delete!(el)
    end
  end
  anagram_dup.empty? && word_dup.empty?

end

p second_anagram("gizmo", "sally")    #=> false
p second_anagram("elvis", "lives")    #=> true

# O(n log n) linearithmic, sort
def third_anagram?(anagram,word)
  anagram_sorted = anagram.chars.sort.join("")
  word_sorted = word.chars.sort.join("")

  anagram_sorted == word_sorted
end

p third_anagram?("gizmo", "sally")    #=> false
p third_anagram?("elvis", "lives")    #=> true

# O(n) - linear search
def fourth_anagram?(anagram, word)
  anagram_hash = Hash.new(0)
  word_hash = Hash.new(0)
  anagram.chars.each do |el|
    anagram_hash[el] += 1
  end
  word.chars.each do |el|
    word_hash[el] += 1
  end
  anagram_hash == word_hash
end

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true

# O(n) - linear search
def fifth_anagram?(anagram, word)
  anagram_hash = Hash.new(0)
  anagram.chars.each do |el|
    anagram_hash[el] += 1
  end

  word.chars.each do |el|
    anagram_hash[el] -= 1
  end

  anagram_hash.values.all? { |value| value == 0 }
end

p fifth_anagram?("gizmo", "sally")    #=> false
p fifth_anagram?("elvis", "lives")    #=> true
