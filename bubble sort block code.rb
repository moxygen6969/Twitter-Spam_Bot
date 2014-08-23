#!/usr/bin/env ruby

unsorted_array=[26,13,178,12,101,2,5,0,5,2,1.5]
def bubble_sort(low_high)
     temp=0
      0.upto(low_high.length-1) do |x|
           (x+1).upto(low_high.length-1) do |y|
               puts "#{low_high[x]},#{low_high[y]}"
               if low_high[x]>low_high[y]
                   temp=low_high[x]
                   low_high[x]=low_high[y]
                   low_high[y]=temp
               end
           end
       end
      print low_high
end
bubble_sort(unsorted_array)


def bubble_sort_by(word_size)
  temp=""
 0.upto(word_size.length-1) do |x|
    (x+1).upto(word_size.length-1) do |y|
      if yield(word_size[x],word_size[y])<0
          temp=word_size[x]
          word_size[x]=word_size[y]
          word_size[y]=temp
      end
    end
  end
  puts word_size
end


bubble_sort_by(["hello","hi","hey"]) do |left,right|
    right.length - left.length
end 

bubble_sort_by(["hello","hi","hey","i"]) do |left,right|
    left.length - right.length 
end