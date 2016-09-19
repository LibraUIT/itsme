class CreateIdolInfo < ActiveRecord::Migration
  def change
    create_table :idol_infos do |t|
      t.string :fullname
      t.string :gender
      t.string :itsme_nickname
      t.string :itsme_id
      t.string :email
      t.string :identification
      t.string :address
      t.string :phone
      t.date :dob
      t.string :facebook
      t.integer :fb_follwers_number
      t.string :zalo
      t.string :instagram
      t.string :others
      t.string :os
      t.string :cellphone_model
      t.string :time_of_start_streaming
      t.string :time_of_end_streaming
      t.string :content_of_streaming
      t.string :nextwork_for_streaming
      t.string :nextwork_speed
      t.boolean :update_avatar
      t.boolean :good_lightening
      t.date :getting_start
      t.string :payment_method
      t.string :account_holder
      t.string :bankname
      t.string :account_number
      t.string :routing_number
      t.string :bank_address
      t.string :swift_code
    end
  end
end
