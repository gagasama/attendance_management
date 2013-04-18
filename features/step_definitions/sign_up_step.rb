# -*- encoding: utf-8 -*-
前提(/^Userテーブルにemail => 'm\-nakayama@vyw\.jpが存在する'$/) do
  FactoryGirl.create(:user)
end

もし(/^同じメアドでサインアップすると$/) do
  visit 'user/show'
end

ならば(/^\/user\/showに移動することができる。$/) do
  pending # express the regexp above with the code you wish you had
end

