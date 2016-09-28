class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   has_many :posts
   has_many :comments
   has_attachment :avatar
   after_create :send_welcome_email
   acts_as_voter

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end
end
