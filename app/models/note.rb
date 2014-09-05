class Note < ActiveRecord::Base


    #attr_accessible :user_id, :subject, :content
	belongs_to :user

	validates :content , presence: true,
	                     length: {minimum: 10}
	validates :subject, presence: true,
	                     length: {minimum: 5}

validates :user_id, presence: true


end
