require 'rails_helper'

feature 'User posts a question' do
  # As a user
  # I want to post a question
  # So that I can receive help from others
  #
  # Acceptance Criteria
  #
  # - I must provide a title that is at least 40 characters long
  # - I must provide a description that is at least 150 characters long
  # - I must be presented with errors if I fill out the form incorrectly
  User.create(user_name: "Bob")
  title = "Sed ut perspiciatis unde omnis iste natus"
  description = "Li Europan lingues es membres del sam familie. Lor separat existentie es un myth. Por scientie, musica, sport etc, litot Europa usa li sam vocabular. L"

  scenario 'With valid attributes' do
    visit questions_path
    click_on 'New Question'

    fill_in "Title", with: title
    fill_in "Description", with: description

    click_on 'Create Question'

    expect(page).to have_content "Question was successfully created."
    expect(page).to have_content title
  end

  scenario 'With no attributes' do
    visit new_question_path

    click_on 'Create Question'

    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Description can't be blank"
    expect(page).not_to have_content "User can't be blank"
  end

  scenario 'With attributes that are too short' do
    visit new_question_path

    fill_in "Title", with: "errah"
    fill_in "Description", with: "errah"

    click_on 'Create Question'

    expect(page).to have_content "Title is too short"
    expect(page).to have_content "Description is too short"
  end

end
