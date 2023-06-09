class Group < ApplicationRecord
    has_many :group_users, dependent: :destroy
    has_many :events, dependent: :destroy
    
    has_one_attached :group_image
    
    def get_group_image(width, height)
        unless group_image.attached?
          file_path = Rails.root.join('app/assets/images/no_image.jpg')
          group_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
        end
        group_image.variant(resize_to_limit: [width, height]).processed
    end
    
    def is_group_user(group_id, user_id)
        Group_user.where(group_id: group_id, user_id: user_id).exists?
    end
end
