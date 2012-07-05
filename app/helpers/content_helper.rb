module ContentHelper
  def content(*args)
    Content.from_slug *args
  end
  alias :c :content
end
