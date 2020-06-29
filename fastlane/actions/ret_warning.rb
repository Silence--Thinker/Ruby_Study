module Fastlane
  module Actions
    module SharedValues
      RET_WARNING_CUSTOM_VALUE = :RET_WARNING_CUSTOM_VALUE
    end

    class RetWarningAction < Action
      def self.run(params)

        workspace = File.expand_path(params[:workspace])
        scheme = params[:scheme]
        pods_project = params[:pods_project] || Dir.chdir("..") do
          File.expand_path("../Pods/Pods.xcodeproj", workspace)
        end

        puts "pods_project======= #{pods_project} "

        other_action.ret_remove_target_dependencies(
            project: pods_project,
            target: scheme
        )

        sandbox_path = "/Users/silence/Desktop/Demo/sandbox";
        derived_path = "/Users/silence/Desktop/Demo/sandbox/derived_data";
        other_action.xcodebuild(
            workspace: workspace,
            scheme: scheme,
            buildlog_path: sandbox_path,
            derivedDataPath: derived_path,
            sdk: "iphonesimulator",
            configuration: "Debug",
            xcargs: [
                "-IDEBuildingContinueBuildingAfterErrors=YES",
                "CODE_SIGN_IDENTITY=\"\"",
                "CODE_SIGNING_REQUIRED=NO",
            ].join(" ")
        )

        warnings = []
        logfile = File.join(sandbox_path, "xcodebuild.log")
        ignores = params[:ignores]
        File.open(logfile).each do |line|
          if line =~ /^(\/.+\/(.*):.*:.*):\swarning:\s(.*)$/
            unless params[:ignores].include? "#{$2}"
              warnings.push "⚠️ #{line}"
            end
          end
        end

        unless warnings.empty?
          UI.user_error! "warning 检查失败：\n" + warnings.join("\n")
        end

      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "check warnings count by limit"
      end

      def self.details
        "Just to file warning files"
      end

      def self.available_options
        [
            FastlaneCore::ConfigItem.new(key: :workspace,
                                         description: "The workspace path",
                                         optional: false,
                                         is_string: true,
                                         verify_block: proc do |value|
                                           v = File.expand_path(value.to_s)
                                           UI.user_error!("Workspace file not found at path '#{v}' ") unless File.exist?(v)
                                         end),
            FastlaneCore::ConfigItem.new(key: :scheme,
                                         description: "The Pod scheme to build",
                                         optional: false,
                                         is_string: true),
            FastlaneCore::ConfigItem.new(key: :pods_project,
                                         description: "The Pods project path",
                                         optional: true,
                                         is_string: true,
                                         ),
            FastlaneCore::ConfigItem.new(key: :ignores,
                                         description: "The ignore files",
                                         optional: true,
                                         is_string: false,
                                         default_value: [],
                                         verify_block: proc do |value|
                                           UI.user_error!("Ignores is must be an array") unless value.kind_of?(Array)
                                         end)
        ]
      end

      def self.output
        [
          ['RET_WARNING_CUSTOM_VALUE', 'A description of what this value contains']
        ]
      end

      def self.return_value
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
