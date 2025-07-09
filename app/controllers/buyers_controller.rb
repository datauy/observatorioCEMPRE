class BuyersController < ApplicationController
  def show
    @buyer = Buyer.find(params[:id])
  end

  def index
    @expand = false
    @country_options = []
    @materials_options = Material.all.map {|m| [m.name, m.id]}
    @buyer_options = []
    req_company = {}
    req_country = {}
    @semaphore = []
    @countries = []
    buyers = Buyer
    if params[:buyers].present?
      buy = params[:buyers].split(',')
      buyers = buyers.where(id: buy)
      #paises salen de compradores
    end
    if params[:countries].present?
      ctries = params[:countries].split(',')
      buyers = buyers.where(buyer_id: ctries)
    end
    if params[:materials].present?
      mats = params[:materials].split(',')
      buyers = buyers.includes(:materials).where('materials.id': mats)
    end
    if params[:semaphore].present?
      sems = params[:semaphore].split(',')
      buyers = buyers.where(semaphore: sems)
    end

    #TODO filtros por separado de requisitos
    #if params[:buyers].present?
    #  buyers = buyers.where(params[:buyers])
    #end
    Buyer.where( id: buyers.pluck(:buyer_id).uniq ).each do |c|
      creq = c.requirements
      country = {
        id: c.id,
        name: c.name,
        materials: c.materials.count,
        requirements: creq.count,
        semaphore: c.semaphore,
        coordinates: c.coordinates,
        buyers: [],
        buyers_requirements: 0
      }
      creq.each do |cr|
        if req_country[cr.id].nil?
          req_country[cr.id] = [cr.name, cr.id]
        end
      end
      breq = 0
      buyers.where(buyer_id: c.id).each do |b|
        buyer = {
          id: b.id,
          name: b.name,
          materials: b.materials.count == 1 ? b.materials.first.name : b.materials.count,
          semaphore: b.semaphore,
          coordinates: b.coordinates,
          btype: b.btype,
          requirements: []
        }
        @buyer_options.push [b.name, b.id]
        b.requirements.each do |r|
          breq += 1
          req_company[r.requirement_category.id] = [r.requirement_category.name, r.requirement_category.id]
          req = {
            material: r.material.name,
            category: r.requirement_category.name,
            semaphore: r.semaphore,
          }
          buyer[:requirements].push( req )
        end
        country[:buyers].push(buyer)
      end
      country[:buyers_requirements] = breq
      @countries.push(country)
      logger.debug "\n\nCOUNTRIES\n#{@countries.inspect}\n\n"
      @country_options.push( [c.name,c.id] )
    end
    @req_country = req_country.values
    @req_company = req_company.values
    respond_to do |format|
      format.html
      format.turbo_stream {
        @expand = true
      }
    end
  end
  #
  #

end
