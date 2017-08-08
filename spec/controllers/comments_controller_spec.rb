require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  it "is not valid without body" do
    comment = Comment.new
    expect(comment).not_to be_valid
  end

  it "belongs to atleast one post" do
    comment = Comment.reflect_on_association(:post)
    expect(comment.macro).to eq(:belongs_to)
  end
end