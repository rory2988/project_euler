# Highly divisible triangular number
# The sequence of triangle numbers is generated by adding the natural numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:

# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

# Let us list the divisors of the first seven triangle numbers:

#  1: 1
#  3: 1,3
#  6: 1,2,3,6
# 10: 1,2,5,10
# 15: 1,3,5,15
# 21: 1,3,7,21
# 28: 1,2,4,7,14,28
# We can see that 28 is the first triangle number to have over five divisors.

# What is the value of the first triangle number to have over five hundred divisors?


#the nth triangle number is the sum of the 0th-nth natural numbers
#the 6th triangle number = natural number[6]+natural number[5]+natural number[4]+natural number[3]+natural number[2]+natural number[1]+natural number[0]

def nth_triangle_number(n_index)
  natural_numbers = (1..1_000_000_000).to_a
  indices = (0..n_index).to_a
  to_add_up = []
  indices.each{|index| to_add_up.push(natural_numbers[index])}
  to_add_up.inject{|sum,x|sum+x}
end

def triangle_numbers(limit_index)
#list all the triangle numbers below the limit
#start with 0
#for 0..limit, run nth_triangle_number and push to array of triangle_numbers
  indices = (0..limit_index).to_a
  triangle_nums = []
  indices.each{|e|triangle_nums << nth_triangle_number(e)}
  triangle_nums.to_a
end

def divisors_of(number)
  divisors = 0
  n = 1
  while n <= number
    if number % n == 0
      divisors += 1
    end
    n += 1
  end
  divisors
end

#if range ends at 100,000,000
range = triangle_numbers(100_000_000)
#start at the last number
counter = range.length

if divisors_of(range[counter]) > 500
  puts "Done.  The triangle number with >500 divisors is #{range[counter]}."
else
  counter -= 1
end
