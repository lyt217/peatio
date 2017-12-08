module APIv2
  module Auth
    module Utils
      class << self
        def cache
          # Simply use rack-attack cache wrapper
          @cache ||= Rack::Attack::Cache.new
        end

        def urlsafe_string_40
          # 30 is picked so generated string length is 40
          SecureRandom.urlsafe_base64(30).tr('_-', 'xx')
        end

        alias :generate_access_key :urlsafe_string_40
        alias :generate_secret_key :urlsafe_string_40

        def hmac_signature(secret_key, payload)
          OpenSSL::HMAC.hexdigest 'SHA256', secret_key, payload
        end

        def jwt_shared_secret_key
          OpenSSL::PKey::RSA.new(Base64.urlsafe_decode64(ENV.fetch('JWT_SHARED_SECRET_KEY')))
        end
      end
    end
  end
end
