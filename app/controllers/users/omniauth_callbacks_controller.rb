class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    # before_action :set_test
    #
    # def set_test
    #     OmniAuth.config.test_mode = true
    #
    #     request.env['devise.mapping'] = Devise.mappings[:user] # If using Devise
    #
    #     OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({ provider: 'github', uid: '123545', info: { name: 'Bruncky', email: 'bruncky@gmail.com' } })
    #     request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
    # end

    def github
        @user = User.from_omniauth(request.env['omniauth.auth'])

        if @user.persisted?
            sign_in_and_redirect @user, event: :authentication
            set_flash_message(:notice, :success, kind: 'GitHub') if is_navigational_format?
        else
            session['devise.github_data'] = request.env['omniauth.auth']
            redirect_to projects_path
        end
    end

    def failure
        redirect_to root_path
    end
end
