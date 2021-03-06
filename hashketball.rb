# Write your code below game_hash
require 'pry'
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here

def num_points_scored(player)
  game = game_hash
  individual_stats = get_player(player)
  return individual_stats[:points]
end

def shoe_size(player)
  individual_stats = get_player(player)
  return individual_stats[:shoe]  
end

def get_player(player)
  game_hash.each_value do |team|
     players = team[:players]
     players.each do |individual| 
       if individual[:player_name] == player
         return individual
       end
      end
  end
end

def team_colors(team)
  game_hash.each_value do |where|
    if where[:team_name] == team
      return where[:colors]
    end
  end
end

def team_names
  teams =[]
  game_hash.each_value do |team|
    teams << team[:team_name]
  end
  teams
end

def player_numbers(team)
  numbers = []
  game_hash.each_value do |where|
    if where[:team_name] == team
      where[:players].each do |player|
        numbers << player[:number]
      end
    end
  end
  numbers
end

def player_stats(player)
  get_player(player)
end

def big_shoe_rebounds
  biggest_shoe = 0
  winner = nil
  game_hash.each_value do |team|
     players = team[:players]
     players.each do |individual| 
       if individual[:shoe] > biggest_shoe
         biggest_shoe = individual[:shoe]
         winner = individual
       end
      end
  end
  winner[:rebounds]
end

def most_points_scored
  most_points = 0
  winner = nil
  game_hash.each_value do |team|
     players = team[:players]
     players.each do |individual| 
       if individual[:points] > most_points
         most_points = individual[:points]
         winner = individual
       end
      end
  end
  winner[:player_name]
end

def most_of(stat)
  most = 0
  winner = nil
  game_hash.each_value do |team|
     players = team[:players]
     players.each do |individual| 
       if individual[stat] > most
         most = individual[stat]
         winner = individual
       end
      end
  end
  winner[:player_name]
end

def winning_team
  scores = []
  game_hash.each_value do |team|
    sum = 0
     players = team[:players]
     players.each do |individual| 
       sum += individual[:points]
       
    end
    scores.push("#{team[:team_name]}: #{sum}")
  end
  scores
end

def player_with_longest_name
  most = 0
  winner = nil
  game_hash.each_value do |team|
     players = team[:players]
     players.each do |individual| 
       if individual[:player_name].length > most
         most = individual[:player_name].length
         winner = individual
       end
      end
  end
  winner[:player_name]
end

def long_name_steals_a_ton?
  player_with_longest_name == most_of(:steals)
end