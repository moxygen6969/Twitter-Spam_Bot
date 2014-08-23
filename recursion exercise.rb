#!/usr/bin/env ruby
def merge(left, right)  
  sorted = []
 
  until left.empty? or right.empty?  
    if left.first <= right.first  
      sorted << left.shift  
    else  
      sorted << right.shift  
    end  
  end
  
sorted.concat(left).concat(right)  
end

def mergesort(list)  
  return list if list.size <= 1  
  mid = list.size / 2  
  left  = list[0, mid]
 
  right = list[mid, list.size]
  puts
  
  merge(mergesort(left), mergesort(right))  
end  
# print mergesort([9,8,7,6,5,4,3,2,1])

binary_search=[]
0.upto(20) {|x| binary_search << fib(x)}
print binary_search
puts


def binary_searching(key,list)
  if list[-1] <= list[0]
   return puts "Not Found"
  else
    mid = list.size/2
    if list[mid] < key
     binary_searching(key,list[mid..-1])
    elsif list[mid] > key
     binary_searching(key,list[0..mid-1])
    else
     return puts list[mid]
    end
  end
end

binary_searching(112,binary_search)


def factorial(n)
  puts n
  return 1 if n==1
 factorial(n-1) * n
end
#puts factorial(70)


def palindrome(string)
return true if string.length == 0 || string.length == 1
  if string[0]==string[-1]
    palindrome(string[1..-2])
  else
    return false
  end
end

def fib(n)
 if n == 0
  0
elsif n == 1
  1
else
  fib(n-1) + fib(n-2)
 end
end

#puts fib(6)
def flatten(array, result = [])
  array.each do |element|
    if element.kind_of?(Array)
      flatten(element, result)
    else
      result << element
    end
  end
  result
end
#print flatten([1,2,3,[4,5,6,7,8,[8.5,[9,10,6,[1,2,3]]]],9])


def append(ary,n)
  return ary if n < 0
  ary << n
  append(ary,n-1)
end
#print append([],10)


def reverse_append(ary,n)
  
  return ary if n<0
  reverse_append(ary,n-1)
  print ary << n
  puts
  ary
end
#print reverse_append([],20)
#[0,1,1,2,3,5,8]
#ary=[0,1]
#0.upto(5) do |x|
#  ary[x+2]=ary[x+1]+ary[x]
#end
#puts ary

def fib(n)
   n <= 1 ? n :  fib( n - 1 ) + fib( n - 2 ) 
end


def fib2(n,x,ary)
 return ary if n==0
  x=ary[-2]+ary[-1]
  ary << x
 fib2(n-1,x,ary)
end
#puts fib2(60,0,[0,1])
ary_1=[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]
rand_arr=ary_1.shuffle

def merge_array(temp_ary)
print temp_ary
end

def divide_array(ary,temp_ary,n)
 return merge_array(temp_ary) if n==ary.length-1
temp_ary[n]=[ary[n]]
divide_array(ary,temp_ary,n+1)
end


#print divide_array(rand_arr,[],0)



end_of_program=gets.chomp