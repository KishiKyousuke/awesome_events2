Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.development? || Rails.env.test?
    provider :github, "321fcf6385a1f138b750", "b3c9d0939fd8c49b501339940a4b10da6e8bddae"
  else
    provider :github,
             Rails.application.credentials.github[:client_id],
             Rails.application.credentials.github[:client_secret]
  end
end
