class User < ApplicationRecord
  has_secure_password
  has_many :events, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def self.from_omniauth(auth)
    # Check out the Auth Hash function at https://github.com/mkdynamic/omniauth-facebook#auth-hash
    # and figure out how to get email for this user.
    # Note that Facebook sometimes does not return email,
    # in that case you can use facebook-id@facebook.com as a workaround
    email = auth[:info][:email] || "#{auth[:uid]}@facebook.com"
    name = auth[:info][:name] || "Username"
    user = where(email: email).first_or_initialize
    # Set other properties on user here. Just generate a random password. User does not have to use it.
    # You may want to call user.save! to figure out why user can't save
    user.name = name
    user.email = email
    user.password = SecureRandom.base64(10)
    # Finally, return user
    user.save! && user
  end
end
