# frozen_string_literal: true

module BotChecker
  class Checker
    def bot?(user_agent = nil)
      return false if user_agent.nil?
      WILD_CARDS.any? { |wc| user_agent.downcase.include?(wc) } || Lister.include?(user_agent)
    end
  end

  WILD_CARDS = %w[bot yahoo slurp google msn crawler].freeze
end
