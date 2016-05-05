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

  validates :name, :presence =>true
  validates :status, :presence =>true
  validates :gender, :presence =>true
  validates :date_of_birth, :presence =>true

  private
  def image_size_validation
    errors[:image] << "Should be less than 2MB" if image.size > 2.megabytes
  end
end
