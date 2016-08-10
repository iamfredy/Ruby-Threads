def show(x)
  (1..10).each do |i|
    puts "Hello #{x}"
    sleep(3)
  end  
end
def show2(x)
  (1..10).each do |i|
    puts "Hello #{x}"
    sleep(2)
  end  
end
t1=Thread.new{show(20)}
t2=Thread.new{show2(30)}
t1.join();
t2.join();
puts "End of main"