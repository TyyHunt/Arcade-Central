Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '910e7773399ca1fd6cfd', 'ff5289463ef13adcb24b210a6e9cd2a7abe5869b'
end
# Rails.application.secrets.github_client_id, Rails.application.secrets.github_client_secret