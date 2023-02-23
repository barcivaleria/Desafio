# frozen_string_literal: true

class Cnab < ApplicationRecord
    belongs_to :supermarket
  
    validates_presence_of :type, :data, :value, :cpf, :card_number, :owner, :supermarket_name
  
  end