
table_names = %w(event_genres members)
table_names.each do |table_name|
  path = Rails.root.join("db/seeds", Rails.env, table_name + ".rb")
  if File.exist?(path)
    puts "Creating #{table_name}..."
    require path
  end
end


Admin.create!(
    email: "admins@example.com",
    password: "admins",
    password_confirmation: "admins"
  )