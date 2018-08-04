require_relative 'sentence'

# Implementation of Tree ADT adapted to the Story topic
class Story

  attr_reader :root
  attr_accessor :current

  # Initialize object by adding a root sentence
  def initialize(sentence)
    @root = Sentence.new(sentence)
    @current = @root
  end

  # @param id
  def update_sentence(id)
    @current = @current.get_sentence_node(id.to_i)
  end

end