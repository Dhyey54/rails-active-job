class GenerateEmployeeJob < ApplicationJob
  queue_as :default

  def perform(user)
    user.create_employee(name: user.username, email: user.email, password_digest: user.password)
  end
end
