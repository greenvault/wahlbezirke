module Wahlbezirkinformer
  class SamlConfigurator
    attr_accessor :config_file_path

    def initialize(config_file_path = nil)
      self.config_file_path ||= if config_file_path
        Pathname(config_file_path)
      elsif ENV.key?('SAML_CONFIG_FILE')
        Pathname(ENV['SAML_CONFIG_FILE'])
      else
        Rails.root + 'config' + 'saml.yml'
      end

      parse_idp_metadata_from_remote if config[:idp_metadata_url]
    end

    def config
      @config ||= config_file_contents.fetch(Rails.env)
    end

    def idp_metadata_url
      @idp_metadata_url ||= config.delete(:idp_metadata_url)
    end

    private

    def config_file_contents
      @config_file_contents ||= YAML.load(ERB.new(config_file_path.read).result).with_indifferent_access
    end

    def idp_metadata_parser
      OneLogin::RubySaml::IdpMetadataParser.new
    end

    def parse_idp_metadata_from_remote
      settings = idp_metadata_parser.parse_remote(config.delete(:idp_metadata_url))

      %i[idp_entity_id name_identifier_format idp_sso_target_url idp_slo_target_url idp_cert idp_cert_fingerprint
         idp_attribute_names].each do |attribute_name|

        config[attribute_name] = settings.public_send(attribute_name)
      end
    rescue => exception
      $stderr.puts 'WARNING: Could not read SAML config from IdP'
      $stderr.puts "#{exception.class.name}: #{exception.message}"

      nil
    end
  end
end
