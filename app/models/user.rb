class User < ActiveRecord::Bases 
	has_many :post # replies or posts to forums/submissions. ex: "okay, story time! So last year..."
	# has_many :submissions # for things like cat picture links, TIL, etc.
	# has_many :pms #sending private messages 

end
