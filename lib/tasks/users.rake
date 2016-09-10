namespace :users do
  desc 'Update user account for Idol'
  task update: :environment do
    create_users_from_idol
  end

  def create_users_from_idol
    puts 'create users from idol...'
    Idol.all.each_with_index do |idol, index|
      next if idol.itsme_id.blank?
      user = User.create(username: idol.itsme_id.to_s,
                         email: "idol-#{Time.now.strftime('%Y%m%d%H%i%s')}-#{idol.itsme_id}@itsme.sg",
                         password: '12345678',
                         idol_id: idol.id)
      user.save!
    end
  end
end
