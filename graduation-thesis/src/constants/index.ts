export const API_BASE_URL = 'http://localhost:8080'

export const ACCESS_TOKEN = 'accessToken'
export const AUTHENTICATED = 'authenticated'
export const CURRENT_USER = 'currentUser'

export const OAUTH2_REDIRECT_URI = 'http://localhost:5173/oauth2/redirect'
export const GOOGLE_AUTH_URL =
  API_BASE_URL + '/oauth2/authorize/google?redirect_uri=' + OAUTH2_REDIRECT_URI
export const FACEBOOK_AUTH_URL =
  API_BASE_URL +
  '/oauth2/authorize/facebook?redirect_uri=' +
  OAUTH2_REDIRECT_URI
export const TWITTER_AUTH_URL =
  API_BASE_URL + '/oauth2/authorize/twitter?redirect_uri=' + OAUTH2_REDIRECT_URI
  export const PROVIDER_TYPE = {
    GOOGLE: 'GOOGLE',
    TWITTER: 'TWITTER',
    FACEBOOK: 'FACEBOOK',
    LOCAL: 'LOCAL'
  }