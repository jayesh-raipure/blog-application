class SocialLogin < ActiveRecord::Base
  has_many :comments, as: :author, dependent: :destroy
  def self.from_omniauth(auth)
    find_by(provider: auth.provider, uid: auth.uid) || create_user_from_omniauth(auth)
  end

  def self.create_user_from_omniauth(auth)
    user = SocialLogin.new(
      provider: auth.provider, 
      uid: auth.uid,
      firstname: auth.info.name,
      email: auth.info.email
    )
    user.save!   
    user
  end
end