class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_save :ensure_authentication_token
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #validates :name, presence: true
  #validates :imei, presence: true, uniqueness: true
  #validates :mobile, presence:true, uniqueness: true


  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  def self.authenticate(username,password)
    user = User.find_for_authentication(email: username)
    if user.present?
      user.valid_password?(password)? user : nil

    else
      nil

    end
  end


  private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end

end
