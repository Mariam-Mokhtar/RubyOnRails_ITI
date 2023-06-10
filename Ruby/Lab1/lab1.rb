## 1

# def print_str(str,n)
#     if n < 0
#         print "Invalid input: n should be a non-negative integer."
#     end
#     for num in 0..n do
#         puts "a"*num
#     end
# end
# print_str("a",5)

## 2
# def check_str(str)
#     if str =~ /^if/ #(=~) operator to match the regular expression
#       return true
#     else
#       return false
#     end
#   end
  
# puts check_str("ifxyz")
# puts check_str("xyz")

##3
# def new_str(str)
#     temp = str[-1]
#     str[-1] = str[0]
#     str[0] = temp
#     return str
# end
# puts new_str("java") 
# puts new_str("PYTHON") 

##4
# def add_last_char(str)
#     if str.length >= 1
#       last_char = str[-1]
#       return last_char + str + last_char
#     else
#       return "Invalid input: The length of the given str must be 1 or more."
#     end
# end
# puts add_last_char("Java")

##5
# def leap_year(year)
#     (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
# end
# puts leap_year(2024)
# puts leap_year(2000)
# puts leap_year(2013)

##6
# def rotate_left(arr)
#     rotated_arr = arr[1..-1] + [arr[0]]
#     return rotated_arr
# end
  
# print rotate_left([1, 2, 3, 4, 5])


##7
# def sum_except_num_17(arr)
#     sum = 0
#     skip = false
  
#     arr.each do |num|
#       if num == 17
#         skip = true
#       elsif !skip
#         sum += num
#       else
#         skip = false
#       end
#     end

#     return sum
# end
# puts sum_except_num_17([3, 5, 17, 6])

#-------------------------Bonus------------------------ 

## Two Sum 
# def two_sum(nums, target)
#     hash = {}
#      nums.each_with_index do |number, index|
#          if hash[target - number]
#              return [hash[target - number], index]
#          else
#              hash[number] = index
#          end
#      end
#  end


##Balanced Brackets
# def isBalanced(s)
#     stack = []
    
#       if s.length % 2 != 0
#         return "NO"
#       end
    
#       s.each_char do |char|
#         case char
#         when "("
#           stack.push(")")
#         when "["
#           stack.push("]")
#         when "{"
#           stack.push("}")
#         else
#           top_elem = stack.pop()
#           if char != top_elem
#             return "NO"
#           end
#         end
#       end
    
#       if(stack.length == 0)
#       return "YES"
#       else 
#         return "NO"
#       end
    
# end


## Count Common Words With One Occurrence

# def count_words(words1, words2)
#     map1 = Hash.new(0)
#     map2 = Hash.new(0)
#     sum = 0
  
#     words1.each { |word| map1[word] += 1 }
#     words2.each { |word| map2[word] += 1 }
  
#     words1.each do |word|
#       if map1[word] == 1 && map2[word] == 1
#         sum += 1
#       end
#     end

#     return sum
#   end