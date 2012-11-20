require 'switch_user/provider/base'

module SwitchUser
  module Provider
    class Devise < Base
      DEFAULT_SCOPE = SwitchUser.default_scope || :user

      def initialize(controller)
        @controller = controller
        @warden = @controller.warden
      end

      def login(user, scope = DEFAULT_SCOPE)
        @warden.set_user(user, :scope => scope)
      end

      def logout(scope = DEFAULT_SCOPE)
        @warden.logout(scope)
      end

      def current_user(scope = DEFAULT_SCOPE)
        @controller.send("current_#{scope}")
      end
    end
  end
end
