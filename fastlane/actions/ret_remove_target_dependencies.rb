
require 'xcodeproj'

module Fastlane
  module Actions
    module SharedValues
      RET_REMOVE_TARGET_DEPENDENCIES = :RET_REMOVE_TARGET_DEPENDENCIES
    end

    class RetRemoveTargetDependenciesAction < Action
      def self.run(params)

        # filepath = "/Users/silence/Desktop/Demo/demo.text";
        #
        # file = File.exist?(filepath) ? File.open(filepath) : File.new(filepath, "w")

        projectPath = params[:project]
        project = Xcodeproj::Project.open(projectPath)
        puts "projectPath ====== #{projectPath} "
        puts "target ====#{target}"
        target = project.targets.select{|t| t.name == params[:target]}.first
        target.dependencies.clear
        project.save



      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "remove target dependencies"
      end

      def self.details
        "Just to remove target dependencies"
      end

      def self.available_options
        [
            FastlaneCore::ConfigItem.new(key: :project,
                                         description: "path for project",
                                         optional: false,
                                         is_string: true,
                                         verify_block: proc do |value|
                                           v = File.expand_path(value.to_s)
                                           UI.user_error!("Project file not found at path '#{v}' ") unless File.exist?(v)
                                         end),
            FastlaneCore::ConfigItem.new(key: :target,
                                         description: "Target name",
                                         optional: false,
                                         is_string: true),
        ]
      end

      def self.output
        [
            ['RET_REMOVE_TARGET_DEPENDENCIES', 'output']
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
