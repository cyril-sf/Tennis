if defined?(Footnotes) && Rails.env.development?
  Footnotes.run!
  # Set mvim as the default editor
  Footnotes::Filter.prefix = 'mvim://open?url=file://%s&line=%d&column=%d'
end
