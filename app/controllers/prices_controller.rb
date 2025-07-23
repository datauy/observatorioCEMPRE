class PricesController < ApplicationController

  def index
    if params[:countries].present?
      ctries = params[:countries].split(',')
      @countries = Buyer.where( btype: 0, id: ctries )
    else
      @countries = Buyer.where( btype: 0 )
    end
    if params[:materials_cat].present?
      mats = params[:materials_cat].split(',')
      @materials = Material.where(category: mats)
    else
      mats = Price.all.uniq.pluck(:material_id)
      @materials = Material.find(mats)
    end
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end
end
