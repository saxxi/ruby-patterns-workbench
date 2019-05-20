# frozen_string_literal: true

module WebREST
  class HTTPClient
    # @param [String] url
    # @param [Hash] headers
    def initialize(url:, headers: {})
      @url = url
      @headers = headers
    end

    # @param [String] method
    # @param [String] path
    # @param [Hash] params
    # @param [Hash] body
    # @param [Hash] headers
    # @return [Hash]
    def request(method, path:, params: {}, body: {}, headers: nil)
      case method.upcase.to_sym
      when :GET
        get(path, params: params, headers: headers)
      when :POST
        post(path, body: body, headers: headers)
      when :PUT
        put(path, body: body, headers: headers)
      else
        raise "Unsupported request method #{method}"
      end
    end

    # Send a GET request
    # @param [String] path
    # @param [Hash] params
    # @param [Hash] headers
    # @return [Hash]
    def get(path, params: {}, headers: nil)
      response = conn.get do |req|
        build_request(req, path: path, params: params, headers: headers)
      end
      response
    rescue StandardError => e
      puts e.inspect
      raise
    end

    # Send a POST request
    # @param [String] path
    # @param [Hash] body
    # @param [Hash] headers
    # @return [Hash]
    def post(path, body: {}, headers: nil)
      response = conn.post do |req|
        build_request(req, path: path, body: body, headers: headers)
      end
      puts response.body
      response.body unless response.blank?
    end

    # Send a PUT request
    # @param [String] path
    # @param [Hash] body
    # @param [Hash] headers
    # @return [Hash]
    def put(path, body: {}, headers: nil)
      response = conn.put do |req|
        build_request(req, path: path, body: body, headers: headers)
      end
      puts response.body
      response.body unless response.blank?
    end

    private

    # @return [String]
    attr_reader :url
    # @return [Hash]
    attr_reader :headers

    def conn
      @conn ||= Faraday.new(url: url, headers: headers) do |faraday|
        # faraday.response :xml, content_type: /\bxml$/
        faraday.response :json, content_type: /\bjson$/
        faraday.response :logger
        faraday.use Faraday::Response::RaiseError
        faraday.adapter :typhoeus
      end
    end

    def build_request(req, path:, body: nil, params: nil, headers: nil)
      req.url path
      puts("[WebREST] Body: #{body&.to_json}")
      puts("[WebREST] Params: #{params}")
      puts("[WebREST] Headers: #{headers}")
      req.body = body.to_json if body.present?
      req.params = params if params.present?
      req.headers = headers if headers.present?
    end
  end
end
