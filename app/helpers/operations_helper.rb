module OperationsHelper
  def recent_expenses
    Operation.where(spend: false).first(3)
  end
  def recent_income
    Operation.where(spend: true).first(3)
  end
end
