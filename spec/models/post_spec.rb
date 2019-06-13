require 'rails_helper'

RSpec.describe Post, type: :model do
  
  let(:file) { fixture_file_upload(Rails.root.join('public', 'cat.png'), 'image/png') }

  it "is valid with valid attributes" do
    post = Post.new(title: "test")
    post.image.attach(file)
    expect(post.valid?).to be_truthy
  end
  
  it "is not valid without an image" do
    post = Post.new(title: "test")
    post.valid?
    expect(post.errors.messages[:image]).to include("can't be blank")
  end
  
  it "is not valid without a title" do
    post = Post.new
    post.image.attach(file)
    post.valid?
    expect(post.errors.messages[:title]).to include("can't be blank")
  end  
  
end
