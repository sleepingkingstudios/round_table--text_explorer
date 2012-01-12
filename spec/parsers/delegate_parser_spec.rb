# spec/parsers/delegate_parser_spec.rb

require 'spec_helper'
require 'parsers/delegate_parser_helper'
require 'text_explorer/parsers/delegate_parser'

module TextExplorer::Mock # :nodoc: all
  module Parsers
    class MockDelegateParser
      include TextExplorer::Parsers::DelegateParser
      
      def initialize(delegate)
        @delegate = delegate
      end # constructor initialize
    end # class MockDelegateParser
  end # module Parsers
end # module TextExplorer::Mock

describe TextExplorer::Parsers::DelegateParser do
  let(:delegate) {
    delegate = mock('delegate')
  } # end let :delegate
  
  let(:described_class) { TextExplorer::Mock::Parsers::MockDelegateParser }
  
  context "(initialized)" do
    before :each do
      @parser = described_class.new delegate
    end # before :eachs
    subject { @parser }
    
    it_behaves_like "a DelegateParser"
  end # context (initialized)
end # describe TextExplorer::Parsers::DelegateParser