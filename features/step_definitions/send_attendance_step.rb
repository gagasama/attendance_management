# -*- encoding: utf-8 -*-
#conding utf-8
Before("@clock_in,@clock_out") do
  Rails.logger.debug "begin!!!!!"
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
end 

After("@clock_in,@clock_out")do
  OmniAuth.config.test_mode = false
  Rails.logger.debug "end!!!!!!!!"
end


前提(/^ログインしている$/) do
  page.should have_content('Signed in!')
end

前提(/^出勤時間送信ボタンが表示されている$/) do
  page.should have_content('出勤時間送信')
end

もし(/^出勤時間送信ボタンを押す$/) do
  click_button "出勤時間送信".tap{@after_click_time = Time.now}
end

ならば(/^出勤時間送信ボタンが消える$/) do
  page.should_not have_content('出勤時間送信') 
end

ならば(/^送信した時間が表示される$/) do
  page.should have_content("#{@after_click_time.hour}時#{@after_click_time.min}分#{@after_click_time.sec}秒")
  page.save_screenshot('clock_in.png')
end

前提(/^退勤時間送信ボタンが表示されている$/) do
  page.save_screenshot('clock_out.png')
  page.should have_selector('#clock_out_button')  
end

もし(/^退勤時間送信ボタンを押す$/) do
  click_button "退勤時間送信".tap{@after_click_time = Time.now}
end

ならば(/^退勤時間送信ボタンが消える$/) do
  page.should_not have_content('退勤時間送信') 
end
