class Game < ApplicationRecord
    has_one :assignment
    has_many :users, through: :assignment

    after_create :create_assignment    

    def create_assignment
    Assignment.create!(game_id: id)
    end

    def teams
        teams = "#{home_team} vs #{away_team}"
    end
end
