module ApplicationHelper
	def avatar_url(user, opt = {})
		default_url = "http://www.gravatar.com/avatar/f04d45c545707636618d96ee78c2997c.png"
		options = {size: 80, d: CGI.escape(default_url)}
		options.merge!(opt)
		gravatar_id = Digest::MD5::hexdigest(user.email).downcase
		"http://gravatar.com/avatar/#{gravatar_id}.png?s=#{options[:size]}&d=#{options[:d]}"
	end
end
