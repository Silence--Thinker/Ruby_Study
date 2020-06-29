module Fastlane
  module Actions
    module SharedValues
      RET_PODLINT_CUSTOM_VALUE = :RET_PODLINT_CUSTOM_VALUE
    end

    class RetPodlintAction < Action
      def self.run(params)
        Bundler.with_clean_env do
          #
          repos = Actions.sh("pod repo list")
          repos.lines.any
          puts(repos)

        end
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "ret pod lint"
      end

      def self.details
        "podspec lint"
      end

      def self.available_options
        [
            FastlaneCore::ConfigItem.new(key: :podspec,
                                         description: "The podspec you want to lint",
                                         optional: true,
                                         verify_block: proc do |value|
                                           UI.user_error!("Couldn't find file at path '#{value}'") unless File.exist?(value)
                                           UI.user_error!("File must be a '.podspec'：") unless value.end_with?('.podspec')
                                         end),
            FastlaneCore::ConfigItem.new(key: :no_check_repeat,
                                         description: "disable check for repeat files",
                                         is_string: false,
                                         default_value: false,
                                         optional: true)
        ]
      end

      def self.output


        [
            ['RET_PODLINT_CUSTOM_VALUE', '输出值的描述']
        ]
      end

      def self.return_value
        'return 值的描述'
      end

      def self.authors
        ["caoxiujin"]
      end

      def self.is_supported?(platform)
        [:ios, :mac].include?(platform)
      end
    end
  end
end
