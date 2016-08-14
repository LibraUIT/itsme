class LoggedController < ApplicationController
  before_filter :authenticate_admin_user!
  respond_to :js, :html
  layout false
  skip_before_filter :verify_authenticity_token
  before_action :set_idol, only: [:edit, :update, :destroy]
  before_action :current_banner, only: [:edit_banner, :update_banner, :destroy_banner]

  def index

  end

  def create
    @idol = Idol.create(idol_params)
    if @idol.save
      flash[:notice] = 'Idol was successsfully created !'
      redirect_to admin_idol_url
    else
      render 'create'
    end
  end

  def edit
  end

  def update
    @idol.update(idol_params)
    if @idol.save
      flash[:notice] = 'Idol was successsfully updated !'
      redirect_to admin_idol_url
    else
      render 'create'
    end
  end

  def destroy
    @idol.destroy
    flash[:notice] = 'Idol was successsfully deleted !'
    render json: true
  end

  def banner
    @banner = Banner.create(banner_params)
    if @banner.save
      flash[:notice] = 'Banner was successsfully created !'
      redirect_to admin_banners_url
    else
      render 'banner'
    end
  end

  def edit_banner
  end

  def update_banner
    @banner.update(banner_params)
    if @banner.save
      flash[:notice] = 'Banner was successsfully updated !'
      redirect_to admin_banners_url
    else
      render 'edit_banner'
    end
  end

  def destroy_banner
    @banner.destroy
    flash[:notice] = 'Banner was successsfully deleted !'
    render json: true
  end

  private

  def idol_params
    params.require(:idol).permit!
  end

  def set_idol
    @idol = Idol.find(params[:id])
  end

  def banner_params
    params.require(:banner).permit!
  end

  def current_banner
    @banner = Banner.find(params[:id])
  end
end
