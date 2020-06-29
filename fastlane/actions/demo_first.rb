module Fastlane
  module Actions
    module SharedValues
      DEMO_FIRST_CUSTOM_VALUE = :DEMO_FIRST_CUSTOM_VALUE
    end

    class DemoFirstAction < Action
      def self.run(params)
        Bundler.with_clean_env do
          # 保存现在的工作区
          Actions.sh('git add .')
          Actions.sh('git stash')
          # 拉取远端分支
          Actions.sh('git fetch -p')

          cmds = []
          branchName = params[:name]

          # 切换分支
          if branchName
            cmds << "git checkout #{branchName}"
          end

          result = Actions.sh(cmds.join(' '))

          UI.message("执行完毕 checkout 成功🚀")
          UI.message("分支切换 成功🚀")

          Actions.lane_context[SharedValues::DEMO_FIRST_CUSTOM_VALUE] = result

          return result
        end
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "action的简单描述, 主要是切换分支"
      end

      def self.details
        "没有更多的详细描述了。。"
      end

      def self.available_options
        [
            FastlaneCore::ConfigItem.new(key: :name,
                                         description: "分支名称",
                                         is_string: true,
                                         #default_value: 'master',
                                         optional: false,
            verify_block: proc do |value|
              UI.user_error!("缺少name参数：") unless (value and not value.empty?)
            end)
        ]
      end

      def self.output
        # Define the shared values you are going to provide
        # Example
        [
          ['DEMO_FIRST_CUSTOM_VALUE', '输出值的描述']
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
        # platform == :ios
      end
    end
  end
end
