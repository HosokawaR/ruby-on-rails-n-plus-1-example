class Mouse < ApplicationRecord
  has_many :baby_mouses, dependent: :destroy
end
