class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user, :foreign_key => 'author_id'
  validates :title, :content, presence: true
end
