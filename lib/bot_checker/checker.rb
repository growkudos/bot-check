module BotChecker
  class Checker
    def bot?(user_agent = nil)
      return false if user_agent.nil?

      bot_list = BotChecker::Lister.new

      WILD_CARDS.any? { |wc| user_agent.downcase.include?(wc) } || bot_list.include?(user_agent)
    end
  end

  WILD_CARDS = %w[bot yahoo slurp google msn crawler yandex].freeze
end
