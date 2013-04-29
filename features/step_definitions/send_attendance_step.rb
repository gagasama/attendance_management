# -*- encoding: utf-8 -*-
#conding utf-8
Before("@clock_in") do
  OmniAuth.config.test_mode = true
end 
After("@clock_in")do
  OmniAuth.config.test_mode = false
  Rails.logger.debug "end!!!!!!!!"
end


前提(/^アカウントが存在する$/) do
  OmniAuth.config.test_mode = true
  visit "/"
  OmniAuth.config.mock_auth[:google_login] = {
    "provider" => "google_login",
    "uid" => "114534572318423517627",
    "credentials" =>{
                     :access_token => "ya29.AHES6ZT8kzENbhWwkt1jidp_WkEzSO0MiNjN7R66cA1Ufh...",
                     :refresh_token => "",
                     :expires_at => ""
                   }, 
   "info" => {:name => "中山　真琴", :email => "makoto0306@gmail.com"}
  }
  click_link ("Sign in with Google")
  page.should have_selector("#clock_in_button")
end

前提(/^ログインしている$/) do
end

もし(/^出勤時間送信ボタンを押す$/) do
  click_button "出勤時間送信"
end

ならば(/^出勤時間送信ボタンが消える$/) do
end

ならば(/^送信した時間が表示される$/) do
  page.should have_content
end

