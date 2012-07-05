module ContentHelper
  def content(*args)
    Content.from_slug(*args).parsed_text
  end
  alias :c :content
end
