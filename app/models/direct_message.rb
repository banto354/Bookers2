class DirectMessage < ApplicationRecord
    belongs_to :sender,  class_name: "User"
    belongs_to :receiver, class_name: "User" 
    
    validates :comment, presence: true, length: { maximum: 140 }
end
