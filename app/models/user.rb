class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :courses
  has_many :lectures
  has_many :comments

  mount_uploader :image, ImageUploader

  acts_as_voter

  validates_processing_of :image
  validate :image_size_validation

  private
  def image_size_validation
    errors[:image] << "Should be less than 500KB" if image.size > 0.5.megabytes
  end
end
