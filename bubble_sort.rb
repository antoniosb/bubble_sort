class BubbleSort
  
  def bubble_sort ary
    bubble_sort_by ary do |left, right|
      right - left
    end
  end

  def bubble_sort_by ary
    raise ArgumentError unless ary.is_a? Array
    swap = true
    while swap
      swap = false
      (ary.length-1).times do |index|
        result = yield(ary[index], ary[index+1])
        if result.is_a?(Fixnum) && result < 0
          ary[index+1], ary[index] = ary[index], ary[index+1]
          swap = true
        end
      end
    end
    ary    
  end

end