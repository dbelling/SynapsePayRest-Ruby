module SynapsePayRest
  class Client
    attr_accessor :http_client, :users, :nodes, :transactions, :user_id

    def initialize(options: raise('options is required'), user_id: nil, logging: false)
      base_url = if options['development_mode']
                   'https://sandbox.synapsepay.com/api/3'
                 else
                   'https://synapsepay.com/api/3'
                 end

      @http_client = HTTPClient.new(options, base_url, user_id: user_id, logging: logging)
      @users = Users.new @http_client
      @nodes = Nodes.new @http_client
      @transactions = Transactions.new @http_client
    end

    # support old reader/var names
    alias_method :trans, :transactions
    alias_method :client, :http_client
  end
end