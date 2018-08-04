require_relative 'sentence'

# Implementation of Tree ADT adapted to the Story topic
class Story

  attr_reader :root
  attr_accessor :sentences

  # Initialize object by adding a root sentence
  def initialize(sentence)
    @root = Sentence.new(sentence)
  end

  def add_sentence(sentence)
    @sentences[] = Sentence.new(sentence)
  end

  # @param id
  def get_sentence(id)
    @sentences[id]
  end

end