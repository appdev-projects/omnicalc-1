class ApplicationController < ActionController::Base
  def blank_square_form
    render({ :template => "calculation_templates/square_form.html.erb" })
  end

  def calculate_square

    # params = {"elephant" => 42}

    @num = params.fetch("elephant").to_f
    @square_of_num = @num ** 2

    render({ :template => "calculation_templates/square_results.html.erb" })
  end

  def calculate_random
    @lower = params.fetch("user_min").to_f
    @upper = params.fetch("user_max").to_f
    @result = rand(@lower...@upper)

    render({ :template => "calculation_templates/rand_results.html.erb" })
  end

  def blank_random_form
    render({ :template => "calculation_templates/random_form.html.erb" })
  end

  def square_root_form
    render({ :template => "calculation_templates/square_root_form.html.erb" })
  end

  def square_root_results
    @nums = params.fetch("squareroot_number").to_f
    @squareroot_of_num = @nums ** (0.5)

    render({ :template => "calculation_templates/square_root_results.html.erb" })
  end

  def payment_form
    render({ :template => "calculation_templates/payment_form.html.erb" })
  end

  def payment_results
    @num_apr = params.fetch("apr_number").to_f
    @apr_per_period = (@num_apr / 100) / 12
    @num_years = params.fetch("years_number").to_f.round(3)
    @num_principal = params.fetch("principal_number").to_f

    @monthly_payment = ((@apr_per_period * @num_principal) / (1 - (1 + @apr_per_period) ** (-12 * @num_years)))

    @num_apr = @num_apr.to_s(:percentage, precision: 4)
    render({ :template => "calculation_templates/payment_results.html.erb" })
  end
end
