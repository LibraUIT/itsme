class LoggedController < ApplicationController

  before_action :authenticate_admin_user!, except: [:profile, :update_profile, :new_password, :update_password]
  before_action :authenticate_user!, only: [:profile, :update_profile, :new_password, :update_password]
  respond_to :js, :html
  layout false
  skip_before_action :verify_authenticity_token
  before_action :set_idol, only: [:edit, :update, :destroy]
  before_action :current_banner, only: [:edit_banner, :update_banner, :destroy_banner]
  before_action :set_rank, only: [:edit_rank, :update_rank, :destroy_rank]
  before_action :set_manager, only: [:edit_manager, :update_manager, :destroy_manager]

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

  def rank
    @rank = Rank.create(rank_params)
    if @rank.save
      flash[:notice] = 'Rank was successsfully created !'
      render json: true
    else
      render 'rank'
    end
  end

  def destroy_rank
    @rank.destroy
    flash[:notice] = 'Rank was successsfully deleted !'
    render json: true
  end

  def edit_rank
  end

  def update_rank
    @rank.update(rank_params)
    if @rank.save
      flash[:notice] = 'Rank was successsfully updated !'
      render json: true
    else
      render 'edit_rank'
    end
  end

  def manager
    @manager = Manager.create(manager_params)
    if @manager.save
      flash[:notice] = 'Manager was successsfully created !'
      redirect_to admin_managers_url
    else
      render 'manager'
    end
  end

  def destroy_manager
    @manager.destroy
    flash[:notice] = 'Manager was successsfully deleted !'
    render json: true
  end

  def edit_manager
  end

  def update_manager
    @manager.update(manager_params)
    if @manager.save
      flash[:notice] = 'Manager was successsfully updated !'
      redirect_to admin_managers_url
    else
      render 'edit_manager'
    end
  end

  def profile
    @idol = current_user.idol
    render layout: 'application'
  end

  def update_profile
    @idol = current_user.idol
    @idol.update(idol_params)
    if @idol.save
      flash[:notice] = 'Idol was successsfully updated !'
      redirect_to profile_logged_index_url
    else
      render :profile, layout: 'application'
    end
  end

  def new_password
    @user = current_user
    render layout: 'application'
  end

  def update_password
    @user = current_user
    respond_to do |format|
      if @user.update_with_password(user_params)
        sign_in @user, bypass: true
        format.html { redirect_to new_password_logged_index_path, notice: 'Password was successfully updated.' }
        format.json { render :new_password, layout: 'application', status: :created, location: @user }
      else
        format.html { render :new_password, layout: 'application' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
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

  def rank_params
    params.require(:rank).permit!
  end

  def set_rank
    @rank = Rank.find(params[:id])
  end

  def set_manager
    @manager = Manager.find(params[:id])
  end

  def manager_params
    params.require(:manager).permit!
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :current_password)
  end

end
