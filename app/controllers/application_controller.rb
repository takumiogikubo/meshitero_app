class ApplicationController < ActionController::Base

  before_action :authenticate_user!, except: [:top]

  # devise利用の機能（ユーザ登録、ログイン認証など）が使われる前にconfigure_permitted_parametersメソッドが実行されます
  before_action :configure_permitted_parameters, if: :devise_controller?

  # サインイン後の遷移先を設定。初期設定がroot_pathのためabout_pathへ変更
  def after_sign_in_path_for(resource)
    post_images_path
  end

  # サインアウト後の遷移先を設定。初期設定がroot_pathのためabout_pathへ変更
  def after_sign_out_path_for(resource)
    about_path
  end

  protected

  def configure_permitted_parameters
    # ユーザー登録（sign_up）の際に、ユーザー名（name）のデータ操作を許可している
    devise_parameter_sanitizer.permit(:sign_up,keys: [:name])
  end

end
