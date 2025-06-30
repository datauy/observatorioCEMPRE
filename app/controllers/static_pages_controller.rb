class StaticPagesController < ApplicationController
  def home
    self.search
  end

  def about

  end

  def search
    @country_options = []
    @buyer_options = []
    @countries = []
    Buyer.where( btype: 0 ).each do |c|
      country = {
        id: c.id,
        name: c.name,
        materials: c.materials.count,
        requirements: c.requirements.count,
        semaphore: c.semaphore,
        buyers: [],
        buyers_requirements: 0
      }
      breq = 0
      c.buyers.each do |b|
        buyer = {
          id: b.id,
          name: b.name,
          materials: b.materials.count == 1 ? b.materials.first.name : b.materials.count,
          semaphore: b.semaphore,
          requirements: []
        }
        b.requirements.each do |r|
          breq += 1
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
  end
end
