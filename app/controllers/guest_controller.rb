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

  private

  def idol_params
    params.require(:idol).permit!
  end

end
