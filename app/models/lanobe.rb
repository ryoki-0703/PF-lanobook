class Lanobe < ApplicationRecord

  belongs_to :user
  attachment :image
end
