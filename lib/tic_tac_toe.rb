require 'pry'

class TicTacToe

    WIN_COMBINATIONS = [
        [0,1,2],[0,4,8],
        [0,3,6],[3,4,5],
        [6,7,8],[1,4,7],
        [2,5,8],[2,4,6]
    ]

    def initialize
        @board = Array.new(9, " ")
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        index = input.to_i - 1
    end 
    def move(index,token = "X")
        @board[index] = token
    end
    def position_taken?(index)
        @board[index] != " "
    end
    def valid_move?(index)
        !position_taken?(index) && index.between?(0, 8)
    end
    def turn_count
        @board.length - @board.count(" ")
    end
    def current_player
        moves = @board.size - @board.count(" ")
        moves % 2 == 0 ? "X" : "O"
    end
    def turn
        index = input_to_index(gets.chomp)    
        if valid_move?(index)
            move(index, current_player)
        else
            turn
        end
        display_board
    end
    def won?
        
        WIN_COMBINATIONS.any? do |winners|
            
            if position_taken?(winners[0]) && @board[winners[0]] == @board[winners[1]] && @board[winners[1]] == @board[winners[2]]
                return winners
            else
                false
            end
        end
    end
    def full?
        @board.all? do |places|
            places != " "
        end
    end
    def draw?
        full? && !won?
    end
    def over?
       won? || draw?
    end
    def winner
        if winners = won?
            @board[winners[0]]
        end
    end
    def play
        turn until over?
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end
end