module ContentHelper

  def content(*args)
    Content.from_slug(*args).parsed_text
  end
  alias :c :content

  def raw_content(*args)
    Content.from_slug(*args).raw_text
  end
  alias :rc :raw_content
end
