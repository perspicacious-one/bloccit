module RandomData
  def self.random_paragraph
    sentences = []
    rand(4..8).times do
      sentences << random_sentence
    end

    sentences.join(" ")
  end

  def self.random_sentence
    strings = []
    rand(3..5).times do
      strings << random_word
    end

    sentence = strings.join(" ")
    sentence.capitalize << "."
  end

  def self.random_word
    letters = ('a'..'z').to_a
    letters.shuffle!
    letters[0,rand(3..8)].join
  end
  
  def self.random_int
    rand(1..100)
  end
end
