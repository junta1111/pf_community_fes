# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create(email:'a@a', password:'123456')

com_range = (1..20)

com_range.each do |n|
  Community.create!(
    fes_name: "festa#{n}",
    venue: %w(北海道  大阪府 東京都 香川県 広島県 福岡県 佐賀県).sample,
    venue_month: (1..12).to_a.sample,
    venue_year: (2021..2023).to_a.sample
    )
end

(1..10).each do |n|
  user = User.create!(
      email: "user#{n}@test.com",
      password: "password",
      last_name: "user#{n}",
      first_name: "name",
      last_name_kana: "user#{n}",
      first_name_kana: "name"
    )
  (0..3).to_a.sample.times do |nn|
    user.favorite_events.create!(
      event_name: "fes#{n}-#{nn}",
    )
  end
  (0..10).to_a.sample.times do |nn|
    user.comments.create!(
      community_id: com_range.to_a.sample,
      comment: "comment" * (1..5).to_a.sample
    )
  end
end

comment_ids = Comment.pluck(:id)
User.all.each do |user|
  (1..(comment_ids.size / 2)).each.with_index(1) do |n, i|
    user.goods.create!(
      comment_id: comment_ids.sample,
      created_at: Time.zone.now.ago((1..3).to_a.sample.day).since(i.minute)
    )
  end
end
