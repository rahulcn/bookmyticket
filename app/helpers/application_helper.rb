module ApplicationHelper
	def avatar_url(user)
		default_url = "http://www.gravatar.com/avatar/f04d45c545707636618d96ee78c2997c.png"
		gravatar_id = Digest::MD5::hexdigest(user.email).downcase
		"http://gravatar.com/avatar/#{gravatar_id}.png?s=80&d=#{CGI.escape(default_url)}"
	end
end
