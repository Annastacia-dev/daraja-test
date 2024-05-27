module ApplicationHelper
  def products
    [
      { title: 'Getting started', description: "Setting up your daraja account", icon: "fa-solid fa-arrow-right-to-bracket", path: 'getting_started'},
      { title: 'Authorization', description: "Gives you a time bound access token to call allowed APIs.", icon: "fa-solid fa-key", path: 'authorization'},
      { title: 'M-pesa Express(STK Push)', description: "Merchant initiated online payments", icon: "fa-solid fa-mobile", path: 'mpesa_express'},
    ]
  end

  def bottom_links
    [
      {title: 'getting started', path: 'getting_started'},
      {title: 'authorization', path: 'authorization'},
      {title: 'M-pesa express', path: 'mpesa_express'}
    ]
  end

  def notification_class(type)
    case type
    when 'alert'
      'border-red-500 bg-red-50 text-red-500'
    when 'notice'
      'border-blue-500 bg-blue-50 text-blue-500'
    when 'success'
      'border-green-500 bg-green-50 text-green-500'
    when 'error'
      'border-red-500 bg-red-50 text-red-500'
    when 'warning'
      'border-yellow-500 bg-yellow-50 text-yellow-500'
    when 'info'
      'border-blue-500 bg-blue-50 text-blue-500'
    else
      'border-gray-500 bg-gray-50 text-gray-500'
    end
  end

  def notification_icon(type)
    case type
    when 'alert'
      'fa-solid fa-circle-xmark'
    when 'notice'
      'fa-solid fa-info-circle'
    when 'success'
      'fa-solid fa-check-circle'
    when 'error'
      'fa-solid fa-exclamation-triangle'
    when 'warning'
      'fa-solid fa-circle-exclamation'
    when 'info'
      'fa-solid fa-circle-info'
    else
      'fa-solid fa-circle-info'
    end
  end

  def progress_bar_background(type)
    case type
    when 'alert'
      'bg-red-500'
    when 'notice'
      'bg-blue-500'
    when 'success'
      'bg-green-500'
    when 'error'
      'bg-red-500'
    when 'warning'
      'bg-yellow-500'
    when 'info'
      'bg-blue-500'
    else
      'bg-gray-500'
    end
  end
end