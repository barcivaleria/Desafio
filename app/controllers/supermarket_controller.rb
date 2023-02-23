# frozen_string_literal: true

class SupermarketController < ApplicationController
    def index
      render json: Supermarket.all
    end
  end