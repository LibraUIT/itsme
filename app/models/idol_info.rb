class IdolInfo < ActiveRecord::Base

  attr_accessor :accept

  validates :fullname, presence: true
  validates :gender, presence: true
  validates :itsme_nickname, presence: true
  validates :itsme_id, presence: true, uniqueness: true
  validates :email, presence: true
  validates :identification, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  validates :dob, presence: true
  validates :facebook, presence: true
  validates :fb_follwers_number, presence: true
  validates :zalo, presence: true
  validates :os, presence: true
  validates :cellphone_model, presence: true
  validates :time_of_start_streaming, presence: true
  validates :time_of_end_streaming, presence: true
  validates :content_of_streaming, presence: true
  validates :nextwork_for_streaming, presence: true
  validates :nextwork_speed, presence: true
  validates :update_avatar, presence: true
  validates :good_lightening, presence: true
  validates :getting_start, presence: true
  validates :payment_method, presence: true
  validates :account_holder, presence: true
  validates :bankname, presence: true
  validates :account_number, presence: true
  validates :bank_address, presence: true

  default_scope { order(id: :desc) }

end
