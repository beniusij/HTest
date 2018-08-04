class Sentence

  attr_reader :sentence
  attr_accessor :options

  def initialize(value)
    @sentence = value
    @options = []
  end

  def get_sentence
    @sentence
  end
end