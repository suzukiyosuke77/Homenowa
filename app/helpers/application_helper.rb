module ApplicationHelper
  def bootstrap_flash_class(key)
    case key
    when 'notice'
      'primary' 
    when 'alert'
      'danger' 
    when 'info'
      'info' 
    when 'warning'
      'warning' 
    else
      'dark' 
    end
  end
end