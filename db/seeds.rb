# encoding: utf-8
User.create! name: "Example User",
  email: "example@railstutorial.org",
  password: "foobar",
  password_confirmation: "foobar",
  admin: true

50.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create! name: name,
    email: email,
    password: password,
    password_confirmation: password
end

Category.create! name: "Basic", description: "Basic japanese words"
Category.create! name: "Advance"

Word.create! japanese: "きれい", vietnamese: "đẹp",
  category: Category.first, sample_answers: "xấu; đẹp; sai; đúng"
Word.create! japanese: "わるい", vietnamese: "xấu",
  category: Category.first, sample_answers: "xấu; tốt; sai; đúng"
500.times do |n|
  japanese = "basic-jp-#{n}"
  vietnamese = "basic-vn-#{n}"
  sample_answers = "ans-1; ans-2; ans-3; ans-4; basic-vn-#{n}"
  Word.create! japanese: japanese, vietnamese: vietnamese,
    category: Category.first, sample_answers: sample_answers
end

100.times do |n|
  japanese = "advance-jp-#{n}"
  vietnamese = "advance-vn-#{n}"
  sample_answers = "ans-1; ans-2; ans-3; ans-4; advance-vn-#{n}"
  Word.create! japanese: japanese, vietnamese: vietnamese,
    category: Category.second, sample_answers: sample_answers
end

users = User.all
category = Category.first
users.each do |user|
  lesson = Lesson.create user: user, category: category, word_number: 10
  Word.unlearned_by(user).take(20).each do |word|
    Result.create lesson: lesson, word: word, answer: word.vietnamese, correct: true
  end
end

user  = users.first
following = users[2..50]
followers = users[3..40]
following.each {|followed| user.follow followed}
followers.each {|follower| follower.follow user}
