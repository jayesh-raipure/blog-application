class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :author, polymorphic: true
  validates :body, presence: true
end
