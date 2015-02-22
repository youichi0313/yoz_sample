class Project < ActiveRecord::Base
	has_many :tasks

	validates :title, 
	presence: {message: "入力して下さい"},
	length: {minimum: 3, message: "文字列の長さが短すぎです"}
end
