module ApplicationHelper
  def products
    [
      { title: 'Authorization', description: "Gives you a time bound access token to call allowed APIs.", icon: "fa-solid fa-key", path: 'authorization'},
      { title: 'M-pesa Express(STK Push)', description: "Merchant initiated online payments", icon: "fa-solid fa-mobile", path: 'mpesa_express'},
    ]
  end
end