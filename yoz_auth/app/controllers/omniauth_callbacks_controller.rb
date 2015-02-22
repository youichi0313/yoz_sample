class OmniauthCallbacksController < ApplicationController 
	def twitter
		user = User.from_omniauth(request.env["omniauth.auth"])

		if user.persisted?
			flash[:notice] = "ログインできた"
			#Twitter.configure do |config|
     		#config.consumer_key = 'cxD22sxkxLBWINIPUPfg8ugpv'
     		#config.consumer_secret = 'wPf4gm71hhexHbeZlAnzSqvcIMq6uknrxN6fDlZpdI4d8AFDcX'
     		#config.oauth_token = '2418762361-BgqwcNIBYZkxjvVSRWmzE8PNil6YWov9TdL8sWV'
     		#config.oauth_token_secret = 'C03FxA3TablGhMLsFK6wMjAkg0bhiYbIEnFpm9WPbGLut'
        	#end

        	#@timeline = Twitter.home_timeline
			sign_in_and_redirect(user)
		else
			session["devise.user_attributes"] = user.attributes #モデルの全てのカラムと属性を取得する
      		redirect_to new_user_registration_url #_pathと書いても一緒だと思

		end

	end
end
