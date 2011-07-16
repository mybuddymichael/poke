module Params

  WrongNumberOfParamsError = Class.new(StandardError)
  
  def check_params(params_given, params_required)
    params_required.each do |param|
      unless params_given.keys.include?(param)
        raise WrongNumberOfParamsError,
          "Parameters given do not include #{param}"
      end
		end
  end

end
