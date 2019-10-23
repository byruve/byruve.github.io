#usr/bin/ruby
#_*_coding:UTF-8_*_
require_relative "Stack"
include Stack
Stack.createstack 10
puts "now put your num by 10h:"
$num_10=gets().to_i
until $num_10==0 do
	data=$num_10%8
	Stack.push data
	$num_10=$num_10/8
end 
Stack.out