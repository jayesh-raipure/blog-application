class User < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :posts, -> { order "created_at DESC"}, dependent: :destroy, :foreign_key => 'author_id'
  validates :firstname, :lastname, :emailid, presence: true
  validates :emailid, uniqueness: true
  validates_format_of :emailid, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  has_secure_password

  def self.sign_in_from_omniauth(auth)
    find_by( id: auth['uid']) || create_user_from_omniauth(auth)
  end

  def self.create_user_from_omniauth(auth)
    create(
      firstname: auth['info']['first_name'],
      lastname: auth['info']['last_name'],
      emailid: auth['info']['email'],
    )
  end
end
