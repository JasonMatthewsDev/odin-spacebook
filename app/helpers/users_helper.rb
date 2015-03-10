module UsersHelper
  def like_tag
    content_tag :span, " like", class: "glyphicon glyphicon-thumbs-up"
  end
  
  def unlike_tag
    content_tag :span, " unlike", class: "glyphicon glyphicon-thumbs-down"
  end
end
