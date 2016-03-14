def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num != 0
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

num1 = 0
num2 = 0
operator = 0
name = ""
operator_prompt = <<-MSG
Please enter an operation to perform on the numbers.
    1) Add
    2) Subtract
    3) Multiply
    4) Divide.
MSG

prompt("Welcome to Calculator! Enter your name:")

loop do
  name = Kernel.gets().chomp()

  break unless name == ''
  prompt("Please enter a valid name")
end

loop do # main loop
  loop do
    prompt("Please enter the first number")
    num1 = Kernel.gets().chomp().to_i

    break if valid_number?(num1)
    prompt("That is not a valid number. Please try again.")
  end

  loop do
    prompt("Please enter the second number")
    num2 = Kernel.gets().chomp().to_i

    break if valid_number?(num1)
    prompt("That is not a valid number. Please try again.")
  end

  prompt(operator_prompt)

  loop do
    operator = Kernel.gets().chomp()

    break if %w(1 2 3 4).include?(operator)
    prompt("Select a number between 1 and 4.")
  end

  result = case operator
           when '1'
             num1 + num2
           when '2'
             num1 - num2
           when '3'
             num1 * num2
           when '4'
             num1.to_f / num2
           end

  prompt("#{operation_to_message(operator)} the two numbers...")
  sleep 1

  prompt("The answer is #{result}")

  prompt("Would you like to perform another calculation? y/n")
  continue = Kernel.gets().chomp()
  break unless continue == 'y'
end
