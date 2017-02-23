module ApplicationHelper
  def full_title page_title = ""
    base_title = t ".basic_title"
    page_title.present? ? "#{page_title} | #{base_title}" : base_title
  end

  def paginate collection, params = {}
    will_paginate collection, params.merge(
      renderer: RemoteLinkPaginationHelper::LinkRenderer)
  end

  def categories_for_select
    Category.all.collect{|c| [c.name, c.id]}
  end
end
