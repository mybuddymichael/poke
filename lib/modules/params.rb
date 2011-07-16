module Params

  MissingParamsError = Class.new(StandardError)

  def Params.check_params(params_given, params_required)
    params_required.each do |param|
      unless params_given.keys.include?(param)
        raise WrongNumberOfParamsError,
          "Parameters given do not include #{param}"
      end
    end
  end

end
