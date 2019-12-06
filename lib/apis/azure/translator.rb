module Apis
  module Azure
    class Translator
      class << self

        @@base_url = "https://api.cognitive.microsofttranslator.com/"

        def languages
          path = "#{@@base_url}/languages?api-version=3.0"
          JSON.parse(open(path).read)
        end

        def translate(text, opts = {})
          path = "#{@@base_url}/translate?api-version=3.0"
          body = JSON.generate([
            { "Text": text }
          ])
          headers = {
            'Ocp-Apim-Subscription-Key': ENV['translator_key'],
            'Content-type': 'application/json',
            'Content-length': body.length,
            params: {
                **opts
            }
          }
          begin
            response = RestClient.post(path, body, headers)
            JSON.parse(response.body)
          rescue StandardError => e
            p e.message
            []
          end
        end
      end
    end
  end
end
