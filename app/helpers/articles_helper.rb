module ArticlesHelper
  def comment_author(comment)
    user_signed_in? && current_user.id == comment.user_id
  end
  def article_author(article)
    user_signed_in? && current_user.id == article.user_id
  end
end
