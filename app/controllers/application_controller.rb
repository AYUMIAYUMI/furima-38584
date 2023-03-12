class ApplicationController < ActionController::Base
  before_action :authenticate_user!  # ログインしていないときは最初にリグイン画面が表示されるメソッド
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  def create
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end

  end
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,
                                        keys: [:nick_name, :first_name_kannji, :second_name_kannji, :first_name_kana,
                                               :second_name_kana, :date_birth])
  end

end
