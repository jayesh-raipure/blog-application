class SocialLogin < ActiveRecord::Base
  has_many :comments, as: :author, dependent: :destroy
  def self.from_omniauth(auth)
    user = find_by(provider: auth.provider, uid: auth.uid) || create_user_from_omniauth(auth)
    # Update image
    unless find_by(image: auth.info.image)
      user.image = auth.info.image
      user.save!
    end
    user
  end

  def self.create_user_from_omniauth(auth)
    user = SocialLogin.new(
      provider: auth.provider, 
      uid: auth.uid,
      firstname: auth.info.name,
      email: auth.info.email,
      image: auth.info.image
    )
    user.save!   
    user
  end
end