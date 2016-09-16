class CreateVjs < ActiveRecord::Migration
  def change
    create_table :vjs do |t|
      t.string :name
      t.integer :gender
      t.string :nick_name
      t.string :email
      t.integer :identification
      t.text  :home_address
      t.string :phone
      t.date :birthday
      t.string :facebook
      t.integer :fan_number
      t.string :instagram
      t.string :zalo
      t.string :youtube_snapchat
      t.string :cellphone_system
      t.string :cellphone_brand
      t.datetime :time_start_broadcast
      t.datetime :time_end_broadcast
      t.string :content
      t.string :network
      t.string :upload_speed
      t.boolean :change_avatar
      t.boolean :light
      t.date :effective_date
      t.timestamps null: false
      t.string :payment_method
      t.string :account_holder
      t.string :bank_name
      t.string :account_number
      t.string :routing_number
      t.text :bank_address
      t.string :swift_code
    end
  end
end
