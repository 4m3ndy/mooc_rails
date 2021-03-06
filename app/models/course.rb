class Course < ActiveRecord::Base
  belongs_to :user
  has_many :lectures
  mount_uploader :image, ImageUploader

  validates :user_id, :presence =>true
  validates :title, :presence =>true
  validates :description, :presence =>true

end
