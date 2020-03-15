############################################################
#
#  Name:         Jeremy Hastings
#  Assignment:   Extra Credit #3 - Acronym
#  Date:         November 16th, 2018
#  Class:        CIS 282 - RUBY I
#  Description:  Write a method called "acronym" which
#  accepts any sequence of words separated by one or more
#  spaces and returns the acronym
#
############################################################

def acronym(string_of_words)

  acronym = ""

  acronym_array = string_of_words.split( ' ' )

  acronym_array.each do | string |
    acronym = acronym + string.slice(0)
  end

  return acronym.upcase
end

print "Please enter the words you would like an acronym for: "
sentence = gets.chomp

puts acronym(sentence)