module ApplicationHelper
  def bootstrap_class_for flash_type
    { success: 'alert-success', error: 'alert-danger', info: 'alert-info'}[flash_type.to_sym]
  end

  def flash_messages(opts = {})
    flash.map do |msg_type, message|
      content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
        content_tag(:button, 'x'.html_safe, class: 'close', data: {dismiss: 'alert'}) + message
      end
    end.join.html_safe
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end
end
