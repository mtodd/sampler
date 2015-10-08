class Study
  def self.generate_unique_token(initial_token = nil)
    token = initial_token || generate_token
    token = generate_token while Sample.where(:study_token => token).any?
    token
  end

  def self.generate_token
    SecureRandom.hex(8)
  end
end
