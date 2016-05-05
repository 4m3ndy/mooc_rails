class Lecture < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  has_many :comments

  mount_uploader :attachment, AttachmentUploader
  acts_as_votable

  validates :content, :presence =>true
  validates :title, :presence =>true
  validates :course_id, :presence =>true
  validates :user_id, :presence =>true

end
