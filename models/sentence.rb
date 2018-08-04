class Sentence

  attr_reader :sentence
  attr_accessor :options

  def initialize(value)
    @sentence = value
    @options = []
  end

  def get_sentence_node(id)
    @options[id.to_i]
  end

  def add_sentence_node(id, sentence)
    @options[id.to_i] = Sentence.new(sentence)
  end
end