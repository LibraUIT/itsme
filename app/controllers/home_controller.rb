class HomeController < ApplicationController
  def index
    @idols = Idol.all.order('updated_at desc').page(params[:page]).per(18)
  end
end
