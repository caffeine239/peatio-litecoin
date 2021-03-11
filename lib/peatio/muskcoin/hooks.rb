module Peatio
  module Muskcoin
    module Hooks
      BLOCKCHAIN_VERSION_REQUIREMENT = "~> 0.0.0"
      WALLET_VERSION_REQUIREMENT = "~> 0.0.0"

      class << self
        def check_compatibility
          unless Gem::Requirement.new(BLOCKCHAIN_VERSION_REQUIREMENT)
                                 .satisfied_by?(Gem::Version.new(Peatio::Blockchain::VERSION))
            [
              "Muskcoin blockchain version requiremnt was not suttisfied by Peatio::Blockchain.",
              "Muskcoin blockchain requires #{BLOCKCHAIN_VERSION_REQUIREMENT}.",
              "Peatio::Blockchain version is #{Peatio::Blockchain::VERSION}"
            ].join('\n').tap { |s| Kernel.abort s }
          end

          unless Gem::Requirement.new(WALLET_VERSION_REQUIREMENT)
                                 .satisfied_by?(Gem::Version.new(Peatio::Wallet::VERSION))
            [
              "Muskcoin wallet version requiremnt was not suttisfied by Peatio::Wallet.",
              "Muskcoin wallet requires #{WALLET_VERSION_REQUIREMENT}.",
              "Peatio::Wallet version is #{Peatio::Wallet::VERSION}"
            ].join('\n').tap { |s| Kernel.abort s }
          end
        end

        def register
          Peatio::Blockchain.registry[:muskcoin] = Muskcoin::Blockchain.new
          Peatio::Wallet.registry[:muskcoind] = Muskcoin::Wallet.new
        end
      end

      if defined?(Rails::Railtie)
        require "peatio/muskcoin/railtie"
      else
        check_compatibility
        register
      end
    end
  end
end
