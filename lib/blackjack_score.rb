# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

def blackjack_score(hand)
  score = 0
  hand.each do |card|
    #if !VALID_CARDS.include?(card)
    #  raise ArgumentError "#{card} is not a valid card."
    #end 
    if card.class == Integer 
      score += card.to_i
    elsif card == 'Jack' || card == 'Queen' || card == 'King'
      score += 10
    elsif card == 'Ace' && score < 11
      score += 11
    else 
      score += 1
    end 
  end
  return score 
end 
