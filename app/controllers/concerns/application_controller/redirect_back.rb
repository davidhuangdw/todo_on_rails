class ApplicationController
  module RedirectBack
    def store_location(location=request.referer)
      session[:return_to] = location
    end
    def redirect_back_or_default(default, *args)
      redirect_to(session.delete(:return_to) || default, *args)
    end
  end
end