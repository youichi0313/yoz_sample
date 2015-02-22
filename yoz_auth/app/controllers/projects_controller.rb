require 'open-uri'

class ProjectsController < ApplicationController

	before_action :set_project, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!

		@@client = Twitter::REST::Client.new do |config|
    	config.consumer_key = "cxD22sxkxLBWINIPUPfg8ugpv"
    	config.consumer_secret = "wPf4gm71hhexHbeZlAnzSqvcIMq6uknrxN6fDlZpdI4d8AFDcX"
    	config.access_token = "2418762361-BgqwcNIBYZkxjvVSRWmzE8PNil6YWov9TdL8sWV"
    	config.access_token_secret = "C03FxA3TablGhMLsFK6wMjAkg0bhiYbIEnFpm9WPbGLut"
		end

	def index
		@projects = Project.all
		#@ary = []
		#open("https://api.github.com/user?access_token=ab88e6c455bf74b94bbc47361e93d139cae76118") {|f|
  		#f.each_line {|line| @ary << line}
		#}
		@twitters = @@client.user_timeline("youichi0313")
	end

	def show
		#@project = Project.find(params[:id])
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		if @project.save
			redirect_to projects_path
		else
			render 'new' #newアクションということか
		end

	end

	def edit
		#@project = Project.find(params[:id])
	end

	def update
		#@project = Project.find(params[:id])
		if @project.update(project_params)
			redirect_to projects_path
		else
			render "edit"
		end
	end

	def destroy
		#@project = Project.find(params[:id])
		@project.destroy
		redirect_to projects_path
	end

	private
		def project_params
			params[:project].permit(:title)
		end

		def set_project
			@project = Project.find(params[:id])
		end
end
