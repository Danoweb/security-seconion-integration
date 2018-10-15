class UsersController < ApplicationController
  def model
    User
  end

  def attr_accessible
    [ :email, :state, :created_at ]
  end

  def params_accessible
    params.permit(:email, :password, :password_confirmation)
  end
end
