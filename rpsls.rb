CHOICES = %w(Rock Paper Scissors Lizard Spock)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def player_wins?(user_choice, computer_choice)
  case user_choice
  when computer_choice then :tie
  when "Rock"          then %w(Scissors Lizard).include?(computer_choice)
  when "Paper"         then %w(Rock Spock).include?(computer_choice)
  when "Scissors"      then %w(Lizard Paper).include?(computer_choice)
  when "Lizard"        then %w(Paper Spock).include?(computer_choice)
  when "Spock"         then %w(Rock Scissors).include?(computer_choice)
  end
end

def display_winning_message(player_won, user_choice, computer_choice, score)
  if player_won == :tie
    prompt("It's a tie!")
  else
    winning_choice = player_won ? user_choice : computer_choice
    losing_choice = player_won ? computer_choice : user_choice
    prompt(winning_phrase(winning_choice, losing_choice))
    prompt(player_won ? "You won!" : "You lost!")
  end
  prompt("Current Score: Player #{score[0]} - Computer #{score[1]}")
end

def winning_phrase(winner_type, loser_type)
  case winner_type
  when "Rock"     then loser_type == "Scissors" ? "Rock smashes Scissors!" : "Rock crushes Lizard!"
  when "Scissors" then loser_type == "Paper" ? "Scissors cuts Paper!" : "Scissors decapitates Lizard!"
  when "Paper"    then loser_type == "Rock" ? "Paper wraps Rock!" : "Paper disproves Spock!"
  when "Lizard"   then loser_type == "Spock" ? "Lizard poisons Spock!" : "Lizard eats Paper!"
  when "Spock"    then loser_type == "Rock" ? "Spock vaporizes Rock!" : "Spock smashes Scissors!"
  end
end

prompt("Play Rock Paper Scissors!")
score = [0,0]

loop do
  prompt("Choose one: (R/P/S/L/SP)")
  user_choice = case Kernel.gets().chomp().downcase()
                when "r" then "Rock"
                when "p" then "Paper"
                when "s" then "Scissors"
                when "l" then "Lizard"
                when "sp" then "Spock"
                end
  next unless CHOICES.include?(user_choice)
  computer_choice = CHOICES.sample()

  prompt("The computer chose #{computer_choice}")
  game_result = player_wins?(user_choice, computer_choice)
  game_result ? score[0] += 1 : score[1] += 1 unless game_result == :tie
  display_winning_message(game_result, user_choice, computer_choice, score)

  if score[0] == 5
    prompt("You won five games! You are the victor!")
  elsif score[1] == 5
    prompt("The computer won five games. You lose.")
  else
    prompt("Play again? (y/n)")
    next if Kernel.gets().chomp().downcase() == "y"
  end
  break
end

prompt("Good bye!")