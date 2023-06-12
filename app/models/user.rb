class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :employee
  has_and_belongs_to_many :events, join_table: "events_users", foreign_key: "events_id", dependent: :destroy

  after_create :registeration_mailer

  def registeration_mailer
    RegisterationMailerJob.set(wait: 5.minutes).perform_later self
  end
end
