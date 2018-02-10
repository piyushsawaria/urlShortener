OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '204033231621-2e4hdu5q2jlv506rj5pktttsc70phj0p.apps.googleusercontent.com', 'hqg2sUXR6Ajo1m-sF2arZKDe', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end