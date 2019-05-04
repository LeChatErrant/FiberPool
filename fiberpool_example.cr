require "./src/async.cr"

def print_numbers_and_say_hello(x : Int32, y : Int32)
  sleep 1.seconds
  puts x
  sleep 3.seconds
  puts y
  "hello"
end

include Async

# Create a new fiber pool, with 2 fibers
fiber_pool = FiberPool.new(2)
# fiber_pool.verbose_level = Logger::DEBUG

# Adding job using an already defined function
print_numbers_and_say_hello_proc = ->print_numbers_and_say_hello(Int32, Int32)
fiber_pool.push(print_numbers_and_say_hello_proc, 1, 2)
# Or simply
fiber_pool.push(->print_numbers_and_say_hello(Int32, Int32), 1, 2)

# Adding job using block (bracket notation)
fiber_pool.push(->(i : Int32) { puts i }, 12)

# Adding job using block (do/end notation)
fiber_pool.push(->do
  puts "hello"
end)

# Waiting for all jobs to finish
fiber_pool.finish