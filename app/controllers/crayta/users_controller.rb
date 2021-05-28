class Crayta::UsersController < ApplicationController
  before_action :set_user, only: [:games]
  
  def games
    @pagy, @games = pagy(@user.crayta_games.order(visits: :desc))
  end

  private

  def set_user
    @user = CraytaUser.find(params[:id])
  end
end
