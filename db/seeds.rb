Label.create([
    { name: 'ドラム' },
    { name: '上ネタ' },
    { name: 'ベース'},
    { name: 'アレンジメント'},
    { name: 'サウンドチョイス'},
    { name: 'ミキシング'}
    ])

Category.create([
    { name: 'Hiphop' },
    { name: 'R&B' },
    { name: 'techno'}
    ])

5.times do |n|
    User.create(
        name: "User#{n}",
        email: Faker::Internet.email,
        password: Faker::Internet.password(min_length: 6),
        )
end

user = User.create(name: "TestUser",email: Faker::Internet.email, password: Faker::Internet.password(min_length: 6),)

5.times do |n|
    Beat.create(
        beat_title: "beat#{n}",
        beat_time: 10,
        user_id: user.id,
        )
end
    

5.times do |n|
    Task.create(
        task_title: "task#{n}",
        due_date: "Wed, 29 Jun 2022 00:00:00 UTC +00:00",
        user_id: user.id,
        )
end

5.times do |n|
    Note.create(
        note_title: "note#{n}",
        text: "note#{n}",
        user_id: user.id,
        )
end

