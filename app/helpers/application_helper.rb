module ApplicationHelper
  def full_title page_title = ""
    base_title = t ".basic_title"
    page_title.present? ? "#{page_title} | #{base_title}" : base_title
  end

  def paginate collection, params = {}
    will_paginate collection, params.merge(
      renderer: RemoteLinkPaginationHelper::LinkRenderer)
  end

  def image_url url
    if url && url =~ URI::regexp
      respond = Net::HTTP.get_response(URI.parse(url))
      if respond.code.to_i >= 200 && res.code.to_i < 400
        url
      end
    else
      "Framgia-Logo.png"
    end
  end
end
