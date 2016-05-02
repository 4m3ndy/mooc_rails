class Lecture < ActiveRecord::Base
  belongs_to :course
  belongs_to :user

  mount_uploader :attachment, AttachmentUploader

end
