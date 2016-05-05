class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :lecture

  validates :user_id, :presence =>true
  validates :comment, :presence =>true
  validates :lecture_id, :presence =>true

end
