require "active_support/core_ext/object/blank"
require "active_support/core_ext/enumerable"
require "peatio"

module Peatio
  module Muskcoin
    require "bigdecimal"
    require "bigdecimal/util"

    require "peatio/muskcoin/blockchain"
    require "peatio/muskcoin/client"
    require "peatio/muskcoin/wallet"

    require "peatio/muskcoin/hooks"

    require "peatio/muskcoin/version"
  end
end
