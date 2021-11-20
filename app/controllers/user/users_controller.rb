class User::UsersController < ApplicationController
    before_action :authenticate_user!
    def index
        
        redirect_to edit_user_users_path(current_user) unless current_user.name
        @user = User.find(current_user.id)

        ApplicationMailer.welcome_email(@user).deliver

        @user.update(code: SecureRandom.hex)
        @posts = Post.where(user_id: current_user.id)
        qrcode = RQRCode::QRCode.new("#{request.host}/login-qr/#{@user.code}")
        @svg = qrcode.as_svg(
            offset: 0,
            color: '000',
            shape_rendering: 'crispEdges',
            module_size: 6,
            standalone: true
        )
        @process = Complete.where(user_id: current_user.id)

    end

    def edit
        @user = User.find(current_user.id)
    end

    def create
        @user = User.find(current_user.id)
        @user.update(user_params)
        @posts = Post.where(user_id: current_user.id)
        @process = Complete.where(user_id: current_user.id)
        render :index
    end

    private

    def user_params
        params.require(:user).permit(
            :name,
            :image,
            :id
        )
    end

end
