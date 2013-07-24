class DNA
  attr_reader :sequence

  def initialize(dna)
    @sequence = dna
  end

  def to_rna
    sequence.sub("T", "U")
  end
end
