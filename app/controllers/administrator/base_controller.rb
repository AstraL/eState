class Administrator::BaseController < ApplicationController
  before_action :authenticate_user!
  layout "administrator"

  def index
  end
end
