# language: ja
フィーチャ: サインアップ
  Redmineに登録されているEmailでサインアップすると
　サインアップすることができる
　
  シナリオ: Redmineに登録されているEmailでサインアップすると
　　　　　　サインアップすることができる
    前提 Userテーブルにemail => 'm-nakayama@vyw.jpが存在する'
    かつ ログインしている
    もし 同じメアドでサインアップすると
    ならば /user/showに移動することができる。
