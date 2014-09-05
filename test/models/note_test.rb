require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  test "that note requires content" do 
  	note = Note.new
  	assert !note.save
  	assert !note.errors[:content].empty?
  end

  test "that note requres subject" do 
  	note = Note.new 
  	assert !note.save
  	assert !note.errors[:subject].empty?
  end


  test " that note content must be atleast 10 letters " do 
  	note = Note.new 
  	note.content = "ruby"
  	assert !note.save
  	assert !note.errors[:content].empty?
  end

  test " that note subject must be atleast 5 letters " do 
  	note = Note.new 
  	note.subject= "hi"
  	assert !note.save
  	assert !note.errors[:subject].empty?
  end


  test "that note has a user_id" do 
  	note = Note.new 
  	note.content = "Hello"
  	assert !note.save
  	assert !note.errors[:user_id].empty?
  end

end
