class IdolsController < ApplicationController

  before_action :current_idol
  def show
  end

  private

  def current_idol
    @idol = Idol.find(params[:id])
  end

end
