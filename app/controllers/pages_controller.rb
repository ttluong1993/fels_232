class PagesController < ApplicationController
  def show
    if valid_page?
      if logged_in?
        @user = current_user
        @lessons = current_user.feeds.paginate page: params[:page],
          per_page: Settings.lessons.per_page
      end
      render template: "pages/#{params[:static_page]}"
    else
      render file: "public/404.html", status: :not_found
    end
  end

  private
  def valid_page?
    File.exist? Pathname.new Rails.root + "app/views/pages/#{params[:static_page]}.html.erb"
  end
end
