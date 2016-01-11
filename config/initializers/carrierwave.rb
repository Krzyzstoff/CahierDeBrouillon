CarrierWave.configure do |config|
config.cache_dir = "#{Rails.root}/tmp/uploads"
	
  config.ftp_host = "ftp.cahier.be"
  config.ftp_port = 21
  config.ftp_user = "cahier1q"
  config.ftp_passwd = "vAvEtApe%EjE"
  config.ftp_folder = "/public_html/uploads"
  config.ftp_url = "http://cahier.be/uploads"
  config.ftp_passive = false # false by default
end