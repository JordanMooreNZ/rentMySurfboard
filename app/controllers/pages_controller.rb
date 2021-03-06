class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]

  def home
    @beaches = Beach.all
    params[:filters] ||= {date: Date.today}
  end
end
