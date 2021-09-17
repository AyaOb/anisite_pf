class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resourse)
    if admin_signed_in?
      # 管理者ログイン後
    else
      # ユーザログイン後,マイページへ遷移
      user_mypage_path
    end
  end

  def after_sign_out_path_for(resourse)
    if resourse == :admin
      # 管理者ログアウト後,ログイン画面へ遷移
      new_admin_session_path
    else
      # ユーザログアウト後,トップページへ遷移
      root_path
    end
  end
end
