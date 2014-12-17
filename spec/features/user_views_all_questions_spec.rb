require 'rails_helper'

feature 'User views all questions' do
  # As a user
  # I want to view recently posted questions
  # So that I can help others
  #
  # Acceptance Criteria
  #
  # - I must see the title of each question
  # - I must see questions listed in order, most recently posted first

  user = User.create!(user_name: 'Nicole')
  question = Question.create!(title: "Far far away, behind the word mountains,.", description: "A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. I am alone, and fee", user_id: user.id)
  question2 = Question.create!(title: "MORE RECENT Far far away, behind the word mountains,.", description: "A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. I am alone, and fee", user_id: user.id)


  scenario 'Sees the title of the website' do
    visit questions_path
    expect(page).to have_content 'SpaceOverflow'
  end

  scenario 'Sees the titles of each question' do
    visit questions_path
    title = question.title
    expect(page).to have_content title
  end

  scenario 'Sees the questions listed in order, most recent first' do
    visit questions_path
    expect(page).to have_content /.*#{question2.title}.*#{question.title}/
  end
end
