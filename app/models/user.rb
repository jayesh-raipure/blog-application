class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :comments, as: :author, dependent: :destroy
  has_many :posts, -> { order "created_at DESC"}, dependent: :destroy, :foreign_key => 'author_id'
  validates :firstname, :lastname, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  #has_secure_passworduser
end