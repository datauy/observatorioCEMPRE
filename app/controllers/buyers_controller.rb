class BuyersController < ApplicationController
  def show
    @buyer = Buyer.find(params[:id])
  end

  def index
    @country_options = []
    @materials_options = []
    @buyer_options = []
    req_company = {}
    req_country = {}
    @semaphore = []
    @countries = []

    Buyer.where( btype: 0 ).each do |c|
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
      c.buyers.each do |b|
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
  end
  #
  #

end
