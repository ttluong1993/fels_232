module ApplicationHelper
  def full_title page_title = ""
    base_title = t ".basic_title"
    page_title.present? ? "#{page_title} | #{base_title}" : base_title
  end
end
