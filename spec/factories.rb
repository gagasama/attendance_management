# -*- coding: utf-8 -*-
FactoryGirl.define do
  factory :user do

    login "m-nakayama"
    hashed_password "405c491450520898f266ab88d7420a7af7932d28"
    firstname "真琴"
    lastname "中山"
    mail "m-nakayama@vyw.jp"
    admin false
    status 1
    last_login_on "2012-10-26 20:25:14"
    language ""
    auth_source_id nil
    created_on "2012-02-14 10:51:54"
    updated_on "2012-10-26 20:25:14"
    type "User"
    identity_url "https://www.google.com/accounts/o8/id?id=AItOawnl-8..."
    mail_notification "only_my_events"
  end
end
#<User id: 31, login: "m-nakayama", hashed_password: "405c491450520898f266ab88d7420a7af7932d28", firstname: "真琴", lastname: "中山", mail: "m-nakayama@vyw.jp", admin: false, status: 1, last_login_on: "2012-10-26 20:25:14", language: "", auth_source_id: nil, created_on: "2012-02-14 10:51:54", updated_on: "2012-10-26 20:25:14", etype: "User", identity_url: "https://www.google.com/accounts/o8/id?id=AItOawnl-8...", mail_notification: "only_my_events">
