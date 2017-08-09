require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  it 'is not valid without Email and Password' do
    user = User.new
    expect(user).not_to be_valid
  end

  it 'can have many comments' do
    comment = User.reflect_on_association(:comments)
    expect(comment.macro).to eq(:has_many)
  end

  it 'can have many posts' do
    post = User.reflect_on_association(:posts)
    expect(post.macro).to eq(:has_many)
  end

  it 'destroys dependent posts and comments' do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post)
    user.posts << post
    comment = FactoryGirl.create(:comment)
    post.comments << comment
    expect { user.destroy }.to change { Post.count && Comment.count }.by(-1)
  end
end