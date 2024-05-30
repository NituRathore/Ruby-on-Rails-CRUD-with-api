class ArticlePresenter
  def initialize(article)
    @article = article
  end

  def as_json(*)
    {
      id: @article.id,
      title: @article.title,
      content: @article.content,
      author: @article.author,
      published_at: @article.published_at,
      image: @article.image,
      created_at: @article.created_at,
      updated_at: @article.updated_at
    }
  end
end
