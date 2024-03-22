class PagesController < ApplicationController
  before_action :authenticate_user!
  def home
    @user = User.last.decorate
  end
end
