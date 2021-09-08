# ==| Keychains |==

desc "remove the temporary keychain, if it exists"
def delete_temp_keychain(name)
  delete_keychain(
    name: name
  ) if File.exist? File.expand_path("~/Library/Keychains/#{name}-db")
end

desc "create the temporary keychain with name and password"
def create_temp_keychain(name, password)
  create_keychain(
    name: name,
    password: password,
    unlock: false,
    timeout: false
  )
end

desc "ensure we have a fresh, empty temporary keychain"
def ensure_temp_keychain(name, password)
  delete_temp_keychain(name)
  create_temp_keychain(name, password)
end

def keychain_init
  unless ENV['TEMP_KEYCHAIN_NAME'].nil?
    puts "keychain_init ===> ensure_temp_keychain"
    ensure_temp_keychain(
      ENV['TEMP_KEYCHAIN_NAME'], 
      ENV['TEMP_KEYCHAIN_PASSWORD']
    )
  end
end

def keychain_dispose
  unless ENV['TEMP_KEYCHAIN_NAME'].nil?
    puts "keychain_dispose ===> delete_temp_keychain"
    delete_temp_keychain(ENV['TEMP_KEYCHAIN_NAME'])
  end
end

private_lane :match_configuration do |options|
  api_key = authenticate_apple_store

  keychain_init

  sync_code_signing(
    app_identifier: [ENV['APP_IDENTIFIER']],
    profile_name: options[:name],
    type: options[:type],
    api_key: api_key,
    readonly: options[:readonly],
    verbose: true,
    force: true,
    keychain_name: ENV['TEMP_KEYCHAIN_NAME'],
    keychain_password: ENV['TEMP_KEYCHAIN_PASSWORD']
  )    
end

private_lane :generate_production_matchs do |options|
  load_env
  match_configuration(
    name: production_profile_name,
    type: "appstore",
    readonly: options[:readonly]
  )
  
  match_configuration(
    name: staging_profile_name,
    type: "adhoc",
    readonly: options[:readonly]
  )
end

private_lane :generate_development_matchs do |options|
  load_env
  match_configuration(
    name: development_profile_name,
    type: "development",
    readonly: options[:readonly]
  )
end

lane :authenticate_apple_store do
  api_key = app_store_connect_api_key(
    key_id: ENV["APP_STORE_CONNECT_KEY_ID"],
    issuer_id: ENV["APP_STORE_CONNECT_ISSUER_ID"],
    key_content: ENV["APP_STORE_CONNECT_API_KEY_B64"],
    is_key_content_base64: true,
    duration: 1200, # optional
    in_house: false
  )
  api_key
end

lane :production_profile_name do
  "#{ENV['APP_IDENTIFIER']} #{ENV['PROFILE_PRODUCTION_NAME']}";
end

lane :staging_profile_name do
  "#{ENV['APP_IDENTIFIER']} #{ENV['PROFILE_STAGING_NAME']}";
end

lane :development_profile_name do 
  "#{ENV['APP_IDENTIFIER']} #{ENV['PROFILE_DEVELOPMENT_NAME']}";
end

# Lanes for Installing Certificates
# readonly: true -> in order to not unintentionally update our certificates and provisioning profiles

lane :create_project do
  load_env
  authenticate_apple_store
  create_app_online(
    username: ENV['APPLE_ID'],
    app_identifier: ENV['APP_IDENTIFIER'],
    app_name: ENV['APP_NAME'],
    language: "English",
    app_version: "0.0.0",
    skip_itc: true,
    # team_name: ENV["TEAM_NAME"]
  )
end

lane :generate_match_dependencies do
  generate_development_matchs(readonly: false)
  generate_production_matchs(readonly: false)
end

lane :install_match_dependencies do
  generate_development_matchs(readonly: true)
  generate_production_matchs(readonly: true)
end

# Updating Certificates & Provisioning Profiles
# other engineers might need to run install_match_dependencies after you’ve done this to pull down updated certificates and provisioning profiles

lane :update_match_development_dependencies do
  generate_development_matchs(readonly: false)
end

lane :update_match_production_dependencies do
  generate_production_matchs(readonly: false)
end

desc "delete and Revoke all provisioned certificates! Caution!"
lane :revoke_nuke_certificates do
  load_env
  api_key = authenticate_apple_store
  match_nuke(type: "appstore", api_key: api_key, team_id: ENV['TEAM_IDENTIFIER'])
  match_nuke(type: "development", api_key: api_key, team_id: ENV['TEAM_IDENTIFIER'])
  match_nuke(type: "adhoc", api_key: api_key, team_id: ENV['TEAM_IDENTIFIER'])
end

# Setting up Fastlane Match

desc "installs FixCode which disables the \"Fix Issue\" button in Xcode"
private_lane :xcode do
  install_xcode_plugin(
    url: "https://github.com/fastlane/FixCode/releases/download/0.2.0/FixCode.xcplugin.zip"
  )
end

# Utils

# * Developer Portal Team ID
# https://support.customchurchapps.com/hc/en-us/articles/360038612853-Locating-your-Apple-Team-ID
# 
# * App Store Connect Team ID
# https://stackoverflow.com/questions/42960644/how-to-get-itunes-connect-team-id-and-team-name
# https://itunesconnect.apple.com/WebObjects/iTunesConnect.woa/ra/user/detail

lane :get_team_names do
    load_env
    require "spaceship" 
    clientTunes = Spaceship::Tunes.login(ENV["APPLE_ID"], ENV["FASTLANE_PASSWORD"])
    client = Spaceship::Portal.login(ENV["APPLE_ID"] ,ENV["FASTLANE_PASSWORD"])
    
    UI.message "* Developer Portal Team ID:"
    strDevPortal = "" 
    client.teams.each do |team|
        UI.message "#{team['name']} (#{team['teamId']})"
        strDevPortal << "#{team['name']} (#{team['teamId']})||"
    end

    UI.message "* App Store Connect Team ID:"
    strClientTunes = "" 
    clientTunes.teams.each do |team|
        UI.message "#{team['contentProvider']['name']} (#{team['contentProvider']['contentProviderId']})"
        strClientTunes << "#{team['contentProvider']['name']} (#{team['contentProvider']['contentProviderId']})||"
    end 
end

# lane :git_pull_match_dependencies do
#   git_pull_production
#   git_pull_development
# end
# 
# private_lane :git_pull_production do
#   match(
#     git_url: ENV["GIT_URL"],
#     git_basic_authorization: ENV["GIT_TOKEN"],
#     readonly: true,
#     type: "appstore",
#     app_identifier: [
#       ENV["APP_IDENTIFIER"]
#   ])
#   match(
#     git_url: ENV["GIT_URL"],
#     git_basic_authorization: ENV["GIT_TOKEN"],
#     readonly: true,
#     type: "adhoc",
#     app_identifier: [
#       ENV["APP_IDENTIFIER"]
#   ])
# end
# 
# private_lane :git_pull_development do
#   match(
#     git_url: ENV["GIT_URL"],
#     git_basic_authorization: ENV["GIT_TOKEN"],
#     readonly: true,
#     type: "development",
#     app_identifier: [
#       ENV["APP_IDENTIFIER"]
#   ])
# end
