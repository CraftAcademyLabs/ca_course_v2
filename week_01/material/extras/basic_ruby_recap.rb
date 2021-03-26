# loop, hash?, conditional, argument

def check_sum(num)
 sum = 0
 for i in 1..num
  sum += i
 end

 if sum < 10
  puts "Total sum: #{sum}. Unfortunately below 10, you fail!"
 else
  puts "Total sum: #{sum}. You passed!"
 end
end

check_sum(3)
# should output: Total sum: 6. Unfortunately below 10, you fail!
check_sum(8)
# should output: Total sum: 36. You passed!