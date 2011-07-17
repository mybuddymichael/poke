module Params

  MissingParamsError = Class.new(StandardError)

  class << self

    def check_params(params_given, params_required)
      params_required.each do |param|
        unless params_given.keys.include?(param)
          raise MissingParamsError,
            "parameters given do not include \":#{param}\""
        end
      end
    end

  end

end
