require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  it 'is not valid without title and content' do
    post = Post.new
    expect(post).not_to be_valid
  end

  it 'can have many comments' do
    post = Post.reflect_on_association(:comments)
    expect(post.macro).to eq(:has_many)
  end

  it 'destroys dependent comments' do
    post = FactoryGirl.create(:post)
    comment = FactoryGirl.create(:comment)
    post.comments << comment
    expect { post.destroy }.to change { Comment.count }.by(-1)
  end
end