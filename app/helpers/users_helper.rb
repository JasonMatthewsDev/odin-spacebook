module UsersHelper
  def like_tag
    content_tag :span, " like", class: "glyphicon glyphicon-thumbs-up"
  end
  
  def unlike_tag
    content_tag :span, " unlike", class: "glyphicon glyphicon-thumbs-down"
  end
  
  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
