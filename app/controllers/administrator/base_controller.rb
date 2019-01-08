class Administrator::BaseController < ApplicationController
  before_action :authenticate_user!
  layout "administrator"

  breadcrumb I18n.t('loaf.breadcrumbs.home'), :administrator_root_path, match: :exact

  def index
  end
end
