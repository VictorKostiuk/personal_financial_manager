class ReportsController < ApplicationController
  def index
  end

  def report_by_category
    collection = params[:id].blank? ? Operation.joins(:category).where(spend: params[:spend], odate: (params[:start_date]..params[:end_date])).sum(:amount)
                   : Operation.joins(:category).where(category_id: params[:id], odate: (params[:start_date]..params[:end_date])).group(:name).sum(:amount)

    if params[:id].blank? && collection.integer?
      @operations = collection
      @categories = collection
    else
      @operations = collection.values
      @categories = collection.keys
    end
  end


  def report_by_dates
    collection = Operation.where(spend: params[:spend], odate: (params[:start_date]..params[:end_date])).group(:odate).sum(:amount)

    @dates = collection.map{ |k,v| k.to_s}
    @amount = collection.values
  end
end
