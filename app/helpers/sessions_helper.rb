module SessionsHelper
  # Logs in the given user.
  #dùng lưu cookies tạm thời trên trang web chứa id người dùng
  #cho phép người dùng duy trì đăng nhập liên tục không cần đăng nhập lại mỗi khi reset trang
  #và hết hạn khi đóng tab
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
  #lưu id session tạm thời duy trì liên tục khi bạn đăng nhập.
  #tìm giá user tưng ứng trong data với session id
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    current.present?
  end
  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
