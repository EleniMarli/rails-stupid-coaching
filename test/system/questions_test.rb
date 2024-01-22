require 'application_system_test_case'

class QuestionsTest < ApplicationSystemTestCase
  test 'visiting /ask renders the form' do
    visit ask_url
    assert_selector 'p', text: 'Ask your coach anything'
  end

  test 'saying Hello yields a grumpy response from the coach' do
    visit ask_url
    fill_in 'question', with: 'Hello'
    click_on 'Ask'

    assert_text "I don't care, get dressed and go to work!"
  end

  test 'asking Who? yields a silly question response from the coach' do
    visit ask_url
    fill_in 'question', with: 'Who?'
    click_on 'Ask'

    assert_text 'Silly question, get dressed and go to work!'
    take_screenshot
  end

  test 'visiting /answer renders the link' do
    visit answer_url
    assert_selector 'a', text: 'Ask a new question'
  end

  test 'saying Hello gets Hello printed on /answer' do
    visit ask_url
    fill_in 'question', with: 'Hello'
    click_on 'Ask'

    assert_text 'Hello'
  end
end
