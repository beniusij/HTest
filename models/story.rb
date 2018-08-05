require_relative 'sentence'

# Implementation of Tree ADT adapted to the Story topic.
# A story has a "root" sentence node which corresponds
# to the first sentence in the story and has array of
# possible story paths. "Current" holds a sentence node
# object which is currently viewed by the user.
class Story

  attr_reader :root
  attr_accessor :current

  # Initialize object by adding a "root" sentence and
  # update "current" with the root sentence object
  def initialize(sentence)
    @root = Sentence.new(sentence)
    @current = @root
  end

  # @param id - location of sentence node in an array
  def update_sentence(id)
    @current = @current.get_sentence_node(id.to_i)
  end

end