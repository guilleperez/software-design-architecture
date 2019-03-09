require 'sinatra'

set :bind, "0.0.0.0"

DEFEAT = {rock: :scissors, paper: :rock, scissors: :paper}
OPTIONS = DEFEAT.keys


before do
    content_type :txt
end

get '/play/:element' do
    user_plays = params[:element].to_sym
    if !OPTIONS.include? (user_plays)
        halt 403, "Ilegal Move, use #{OPTIONS}\n" #Forbidden Error
    end
    
    computer_play = OPTIONS.sample #sample(n) -> n different random values
    if user_plays == computer_play
        "YOU TIE!\n"
    elsif computer_play == DEFEAT[user_plays]
        "YOU WON! #{user_plays} defeats #{computer_play}\n"
    else
         "YOU LOST! #{user_plays} is defeated by #{computer_play}\n"
    end
        
end

