::EncodedId::Rails.configure do |config|
  config.id_length = 8
  config.character_group_size = 4
  config.alphabet = ::EncodedId::Alphabet.modified_crockford
  config.salt = "the-test-salt"
end
