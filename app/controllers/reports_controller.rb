class ReportsController < ApplicationController
  def index
  end

  def report_by_category
    if params[:id].blank?
      collection = Operation.where(spend: params[:spend], odate: (params[:start_date]..params[:end_date])).group(:odate).sum(:amount)
    else
      collection = Operation.where(category_id: params[:id])
      collection = collection.where(spend: params[:spend], odate: (params[:start_date]..params[:end_date])).group(:odate).sum(:amount)
    end

    @operations = collection.map{ |k,v| k.to_s}
    @categories = collection.values
  end


  def report_by_dates
    collection = Operation.where(spend: params[:spend], odate: (params[:start_date]..params[:end_date])).group(:odate).sum(:amount)

    @dates = collection.map{ |k,v| k.to_s}
    @amount = collection.values
  end
end
