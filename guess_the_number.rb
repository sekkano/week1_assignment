level_selected = 3000
random_number = 0
guess_counter = 1
player_guess = ""
continue_play = true
continue_game = ""

def input_validation(user_input)
	user_check = user_input
	if user_input.to_i.to_s == user_check
		true
	else
		false
	end	
end

while(continue_play) do

	puts "Welcome to Guess the Number!"
	puts "Please pick your difficulty."
	
	puts "1.) Easy"
	puts "2.) Medium"
	puts "3.) Hard"
	
	while(continue_play) do
		level_selected = gets.chop.to_i
		
		if input_validation(level_selected) || level_selected.between?(1, 3)
			continue_play = false
		else
			puts "Please enter a numeric number or a number between 1 and 3"
		end
	end
	
	continue_play = true
	
	case level_selected
		when 1
			random_number = rand(1..10)
		when 2
			random_number = rand(1..100)
		when 3
			random_number = rand(1..1000)
	end
	
	puts "Random number is selected."
	puts "Please guess a number."
	
	while(continue_play) do
		
		while(continue_play) do
		player_guess = gets.chop
		
			if input_validation(player_guess)
				continue_play = false
				player_guess = player_guess.to_i
			else
				puts "Please enter a numeric number."
				puts continue_play
			end
		end
		continue_play = true
		
		if player_guess > random_number
			guess_counter += 1
			puts "Too High."
		elsif player_guess < random_number
			guess_counter += 1
			puts "Too Low."
		else
			puts "You got the secret number in #{guess_counter} tries."
			continue_play = false
		end	
	end
	
	continue_play = true
	
	case guess_counter
		when 1
			puts ""
			puts "You're a mind reader!"
		when 2..4
			puts ""
			puts "Most Impressive"
		when 5..6
			puts ""
			puts "You can do better than that."
		else
			puts ""
			puts "Better luck next time."
	end
	
	while (continue_play) do
		puts ""
		puts "Would you like to play again? (y / n)"
		continue_game = gets.chop
		
		if input_validation(continue_game) == false && continue_game == "n"
			continue_play = false
		elsif continue_game == "y"
			guess_counter = 1
			break
		end
	end
	
end
