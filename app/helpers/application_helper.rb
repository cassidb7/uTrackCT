module ApplicationHelper
  # Render the flash messages
  def flashes
    flash_messages = []
    flash.each do |type, message|
      # Skip empty messages
      next if message.blank?

      type = type.to_sym
      type = :success if type == :notice
      type = :warning if type == :alert
      type = :danger  if type == :error
      type = :info if type == :video_messages

      Array(message).each do |msg|
        flash_messages << sys_alert(msg, type) if msg
      end
    end
    flash_messages.join("\n").html_safe
  end

  def sys_alert(text, type = :info)
    sys_alert_types.index(type).inspect
    close = '<button type="button" class="close" data-dismiss="alert">&times;</button>'
    style = sys_alert_types.index(type) ? " alert-#{type}" : ''

    "<div class=\"alert#{style}\">#{close}#{text}</div>".html_safe
  end

  def sys_alert_types
    [:danger, :warning, :success, :info]
  end

end
