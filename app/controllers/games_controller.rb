require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:user_answer]}"
    json_words = JSON.parse(URI.open(url).read)

    # initialize variable for checking if all the letters in user_answer
    # are allowed
    @character_match = true

    # we are going to determine the value of character_match
    # by using a loop and checking every individual character
    params[:user_answer].each_char do |character|
      @character_match = false unless params[:letters_choice].include?(character)
    end
    @is_english_word = json_words["found"]
  end
end
