require 'spec_helper.rb'

describe BotChecker::Checker do
  let(:checker) { BotChecker::Checker.new }

  context 'when not passed a user agent' do
    it 'returns false' do
      expect(checker.bot?).to be(false)
    end
  end

  context 'when passed a user agent' do
    let(:user_agent) { 'some user-agent' }

    context 'that is not in the list' do
      it 'returns false' do
        expect(checker.bot?(user_agent)).to be(false)
      end
    end
  end
end
