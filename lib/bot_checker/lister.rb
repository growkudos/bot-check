require 'yaml'

module BotChecker
  class Lister

    def initialize
      @list = YAML.load_file(File.join(File.dirname(__FILE__), 'bot_agents.yml'))
    end

    def include?(user_agent)
      @list.include?(user_agent)
    end
  end
end
