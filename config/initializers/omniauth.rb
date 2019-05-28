Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '910e7773399ca1fd6cfd', 'fcc3f2a36f55404308f21ffdd3b5646aa4d94c4a'
end