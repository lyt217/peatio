# encoding: UTF-8
# frozen_string_literal: true

class StaticPagesController < ApplicationController
  layout 'contest'
  # include Concerns::DisableCabinetUI

  def tos
  end

  def listing
  end

  def delisting
  end

  def faq
  end

  def status
    @currencies = Currency.all.sort
    @blockchains = Blockchain.all
    @markets = Market.all
  end

  def contest
    @currencies = Currency.all.sort
    @blockchains = Blockchain.all
  end
end
