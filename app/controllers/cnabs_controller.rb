# frozen_string_literal: true

class CnabsController < ApplicationController
    def index
      supermarket = Supermarket.find(params[:supermarket_id])
  
      render json: { cnabs: supermarket.cnabs.to_json(include: %i[cnab_type supermarket]), total_balance: supermarket.total_balance }
    rescue ActiveRecord::RecordNotFound
      render json: { message: 'Supermercado não encontrado' }, status: :not_found
    end
  
    def create
      file = cnab_body[:file].read
      @cnab = Cnab::ParseFile.call(file)
  
      render json: @cnab.to_json, status: :created
    rescue StandardError => e
      render json: { message: e.message }, status: :internal_server_error
    end
  
    private
  
    def cnab_body
      params.require(:cnab).permit(:file)
    end
  end