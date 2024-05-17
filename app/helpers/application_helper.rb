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
end