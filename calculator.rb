Kernel.puts("Please enter two numbers")
num1 = Kernel.gets().chomp().to_i
num2 = Kernel.gets().chomp().to_i
Kernel.puts("Please enter an operation to perform on the numbers. 1) Add, 2) Subtract, " +
            "3) Multiply, 4) Divide.")
operator = Kernel.gets().chomp()

if operator == "1"
  result = num1 + num2
elsif operator == "2"
  result = num1 - num2
elsif operator == "3"
  result = num1 * num2
elsif operator == "4"
  result = num1.to_f / num2
else
  result = nil
end

Kernel.puts("The answer is #{result}")
