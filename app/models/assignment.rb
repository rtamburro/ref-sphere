class Assignment < ApplicationRecord
    belongs_to :game
    

    belongs_to :center_referee, class_name: 'User', optional: true
    belongs_to :assistant_referee_1, class_name: 'User', optional: true
    belongs_to :assistant_referee_2, class_name: 'User', optional: true
    belongs_to :fourth_official, class_name: 'User', optional: true

    accepts_nested_attributes_for :game    

    
    # def users
    #     User.where(id: [center_referee_id, assistant_referee_1_id, assistant_referee_2_id]).map { |user| user.name}
    # end

    def center
        User.where(id: center_referee_id).map { |user| user.name }
    end
    
    def ar1
        User.where(id: assistant_referee_1_id).map { |user| user.name }
    end
    
    def ar2
        User.where(id: assistant_referee_2_id).map { |user| user.name }
    end





end
