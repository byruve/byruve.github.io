module Stack
	$top=0
	$out=""
		def self.length
			return $stack.length
		end
		def self.createstack length
		    $stack=Array.new(length)
		    $base=$stack.length
		end
		def self.push data
			puts "erro,you must creat stack." if $stack.length==0
			$stack[$base-$top]=data
			$top+=1
			puts "erro,stack full." if $top>$stack.length
			$stack.each do  |element|
				puts "_|___"+element.to_s+"___|_"
			end
			puts "\n"
		end
		def self.out
			if $stack.length==0
			 	puts "no stack"
			else 
				$stack.each do  |e|
					puts e
				end
			end
		end
end