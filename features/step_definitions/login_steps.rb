When(/^User go to the Login page$/) do
  visit new_user_session_path
end

Then(/^User should see Social login$/) do
  expect(page).to have_content('Social Login')
end

Given(/^I am on the homepage$/) do
  visit root_path
end

When(/^I clicks on post title (.+)$/) do |post_title|
  post = Post.find_by(title: post_title)
  visit post_path(post.id)
end

Then(/^I should see Add Comments$/) do
  expect(page).to have_content('Add Comments')
end