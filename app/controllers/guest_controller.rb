class GuestController < ApplicationController

  def new
    @idol = Idol.new
  end

  def create
    @idol = Idol.new(idol_params.merge(approved: false))
    respond_to do |format|
      if verify_recaptcha(model: @idol) && @idol.save
        user = User.create(username: @idol.itsme_id.to_s,
                           email: "#{@idol.id}idol-#{@idol.itsme_id}@itsme.sg",
                           password: '12345678',
                           idol_id: @idol.id)
        user.save!
        format.html { redirect_to new_guest_path, notice: "Thank You ! Idol was successfully submited. Approve or deny submission request by administrator. You can login with : #{@idol.itsme_id} / 12345678 " }
        format.json { render :show, status: :created, location: @idol }
      else
        format.html { render :new }
        format.json { render json: @idol.errors, status: :unprocessable_entity }
      end
    end
  end

  def register
    @idol_info = IdolInfo.new
  end

  def action
    @idol_info = IdolInfo.create(idol_info_params)
    respond_to do |format|
      if @idol_info.save
        format.html { redirect_to register_guest_index_path, notice: 'Thank You ! Your information was successfully submited. Approve or deny submission request by administrator.' }
        format.json { render :show, status: :created, location: @idol_info }
      else
        format.html { render :register }
        format.json { render json: @idol_info.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def idol_params
    params.require(:idol).permit!
  end

  def idol_info_params
    params.require(:idol_info).permit!
  end

end
