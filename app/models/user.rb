class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # validates :password, length: {minimum: 8, maximum: 50}

  after_create :assign_default_role
  def assign_default_role
    self.add_role(:user) if self.roles.blank?
  end
end
