class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :employee, dependent: :destroy
  has_and_belongs_to_many :events, dependent: :destroy

  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }

  after_create :registeration_mailer, :generate_employee

  private

  def registeration_mailer
    RegisterationMailerJob.set(wait: 1.minutes).perform_later self
  end

  def generate_employee
    GenerateEmployeeJob.perform_later self
  end
end
