class Favorite < ApplicationRecord
  
  belong_to :user
  belongs_to :post_image
  
end
