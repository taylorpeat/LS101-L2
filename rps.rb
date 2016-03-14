def prompt(message)
  Kernel.puts("=> #{message}")
end

def player_wins?(user_choice, computer_choice)
  case user_choice
  when computer_choice then :tie
  when "Rock"     then computer_choice == "Scissors"
  when "Paper"    then computer_choice == "Rock"
  when "Scissors" then computer_choice == "Paper"
  end
end

def display_winning_message(player_won, user_choice, computer_choice)
  if player_won == :tie
    prompt("It's a tie!")
  else
    winning_choice = player_won ? user_choice : computer_choice
    prompt(winning_phrase(winning_choice))
    prompt(player_won ? "You won!" : "You lost!")
  end
end

def winning_phrase(type)
  case type
  when "Rock"     then "Rock smashes Scissors!"
  when "Scissors" then "Scissors cuts Paper!"
  when "Paper"    then "Paper wraps Rock!"
  end
end

CHOICES = %w(Rock Paper Scissors)

prompt("Play Rock Paper Scissors!")

loop do
  prompt("Choose one: (R/P/S)")
  user_choice = case Kernel.gets().chomp().downcase()
                when "r" then "Rock"
                when "p" then "Paper"
                when "s" then "Scissors"
                end
  next unless CHOICES.include?(user_choice)
  computer_choice = CHOICES.sample()

  prompt("The computer chose #{computer_choice}")
  game_result = player_wins?(user_choice, computer_choice)
  display_winning_message(game_result, user_choice, computer_choice)

  prompt("Play again? (y/n)")
  break unless Kernel.gets().chomp().downcase() == "y"
end

prompt("Good bye!")