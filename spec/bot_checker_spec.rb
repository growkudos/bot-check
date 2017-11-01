require 'spec_helper.rb'

describe BotChecker do
  let(:checker) { BotChecker::Checker.new }

  context 'when not passed a user agent' do
    it 'returns false' do
      expect(checker.bot?).to be(false)
    end
  end

  context 'when passed a user agent' do
    subject { checker.bot?(user_agent)}

    context 'that is not in the list' do
      let(:user_agent) { 'some user-agent' }

      it 'returns false' do
        is_expected.to be(false)
      end
    end

    context 'that is in the wildcard list' do
      let(:user_agent) { 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)' }

      it 'returns true' do
        is_expected.to be(true)
      end
    end

    context 'that is not in wildcard but is in list' do
      let(:user_agent) { 'ContentSmartz' }

      it 'returns true' do
        is_expected.to be(true)
      end
    end
  end
end
