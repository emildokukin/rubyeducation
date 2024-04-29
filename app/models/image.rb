class Image < ApplicationRecord
  scope :theme_images, lambda { |theme_id|
    select('id', 'name', 'file', 'ave_value').where(theme_id:)
  }
end
