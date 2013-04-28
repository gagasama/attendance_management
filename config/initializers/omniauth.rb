Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.production?
    provider :google_oauth2,  
      "139636662301-3m61n5v8f06teis4gnlvdgdmrfn70nuv.apps.googleusercontent.com",
      "hkim5qH4lUMJPvqyM5YKt3jV",
      { name: "google_login", approval_prompt: "" }
  else  
    provider :google_oauth2,  
      "139636662301-cmm6rdj3bg5rmqgkbgectuuueva4sbbb.apps.googleusercontent.com",
      "cvmZew-O5U5yOxHHywv3BY3T",
      { name: "google_login", approval_prompt: "" }
  end
end
