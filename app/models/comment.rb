class Comment < ApplicationRecord
  belongs_to :user,  dependent: :destroy
  belongs_to :tweet, dependent: :destroy
end
