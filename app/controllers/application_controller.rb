# frozen_string_literal: true

# main application controller
class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
end
