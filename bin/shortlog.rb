s = gets
a = s.split(",")
a = a.map{|line| line.strip}
b = []
a.each_with_index do |line, i|
  b[i] = line.split(' ')
end
b=b.map{|line| [line[-1], line[0]]}
b=b.map{|line| [line[0].sub("<","").sub(">",""), line[1]]}
b=b.map{|line| [line[0][0..(line[0].index('@')-1)], line[1]]}
c=b.group_by{|line| line[0]}.map{|k,v| [k, v.map{|line| line[1]}.inject(0){|sum,n| sum+n.to_i}]}
c=c.sort_by{|line| line[1]}.reverse
c.each do |line|
  puts "#{line[1]}\t#{line[0]}"
end
