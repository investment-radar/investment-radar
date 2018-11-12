Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    'O0ZJWdZlS5VKvKYAd1u3WRgV9DPXULgT',
    'k_QX5E3PPZx7GHHGwWKqc2pCCX6Cn91PPHQWD_aHvhBxcaajr2kCf39TLp65Hv6F',
    'investment-radar.auth0.com',
    callback_path: '/auth/oauth2/callback',
    authorize_params: {
      scope: 'openid profile'
    }
  )
end
