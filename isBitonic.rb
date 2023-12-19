# *Pseudo-code thoughts*
# if x >= previous, increasing  true 
# if x is not >= previous, decreasing true, increasing false
# if we are decreasing and increasing was previously true 
# bitonic is true 
# if bitonic is true and we increase again, bitonic is false, fail
# if increasing is true and decreasing is never true, false
# set the highest only in the increasing section, check x >= prev

# Define a function that determines if an array of numbers is a Bitonic Sequence
# A Bitonic sequence is a sequence of numbers in which the #s are in
# increasing order, and after a certain point they start decreasing.
# Extra credit to print the peak number in the sequence.

def isBitonic(arr)
    bitonic = false
    failed = false
    highest = nil
    previous = nil
    increasing = nil
    decreasing = nil
  
    arr.each do |x|
      # puts "x is #{x}"
      # either the start of the array, or x is increasing
      if previous.nil? 
        # p "first value"
        highest = x
  
      elsif x >= previous   
        increasing = true
        # p "increasing"
        highest = x > highest ? x : highest
        if bitonic 
          # p "we increased again after hitting bitonic, fail"
          bitonic = false
          failed = true
        end
  
      else
      # x is decreasing
        # p "decreasing"
  
        # check if we were increasing previously 
        if increasing
          bitonic = true 
          # p "bitonic now #{bitonic}" 
  
        # decreasing before we've gotten bitonic is false bitonic 
        elsif !bitonic 
          # p "decreasing before we've reached bitonic is fail"
          bitonic = false
          failed = true
        end
  
        decreasing = true
        increasing = false
  
      end
  
      # set x for next x+1 comparison 
      previous = x
    end
    p "highest is #{highest}"
    p bitonic & !failed
end


# Samples
isBitonic([3,2,10,2,3,2]) # false
isBitonic([1,20,1]) # true
isBitonic([-1,2,1]) # true
isBitonic([-1,2,23,1, -5]) # true 
isBitonic([3,4,5,50,5,2,1]) # true
isBitonic([1,2,3]) # false 
isBitonic([1,2,3,2]) # true
isBitonic([0,-1,-3,0,1,2,3,2,1]) # false

