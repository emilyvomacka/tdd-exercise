require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/blackjack_score'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Blackjack Score' do
  it 'can calculate the score for a pair of number cards' do
    
    # Arrange
    hand = [3, 4]
    
    # Act
    score = blackjack_score(hand)
    
    # Assert
    expect(score).must_equal 7
  end
  
  it 'facecards have values calculated correctly' do
    # Arrange
    hand = ['Queen', 'King']
    
    # Act
    score = blackjack_score(hand)
    
    # Assert
    expect(score).must_equal 20
  end
  
  it 'calculates aces as 11 where it does not go over 21' do
    # Arrange
    hand = [3, 'Ace']
    
    # Act
    score = blackjack_score(hand)
    
    # Assert
    expect(score).must_equal 14
  end
  
  it 'calculates aces as 1, if an 11 would cause the score to go over 21' do
    # Arrange
    hand = ['Queen', 'King', 'Ace']
    
    # Act
    score = blackjack_score(hand)
    
    # Assert
    expect(score).must_equal 21
  end
  
  it 'raises an ArgumentError for invalid cards' do
    #Arrange
    hand = ['sparkle']
    
    #Act/Assert
    expect {
    blackjack_score(hand)
  }.must_raise ArgumentError
end

it 'raises an ArgumentError for scores over 21' do
  # Arrange
  hand = ['Queen', 'King', '10']
  
  #Act/Assert
  expect {
  blackjack_score(hand)
}.must_raise ArgumentError
end
end 