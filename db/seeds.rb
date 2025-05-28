# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


10.times do |i|
  User.create!(
    email: "Minion_#{i+100}@miuandes.cl",
    first_name: "Minion#{i+100}",
    last_name: "Gru",
    password: "123456",
    password_confirmation: "123456"
  )
end


10.times do |i|
    if i != 9
      Chat.create!(
        sender_id: i + 1,
        receiver_id: i + 2
      )
    else
        Chat.create!(
        sender_id: i+1,
        receiver_id: 1
      )
    end
end
  
10.times do |i|
    Message.create!(
        chat_id: i + 1,
        user_id: i + 1,
        body: "Asking for #{(i+1)*(i+2)} bananas!!"
    )
end