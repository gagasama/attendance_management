Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,  
     "139636662301-cmm6rdj3bg5rmqgkbgectuuueva4sbbb.apps.googleusercontent.com",
     "cvmZew-O5U5yOxHHywv3BY3T",
     { name: "google_login", approval_prompt: "" }
end
