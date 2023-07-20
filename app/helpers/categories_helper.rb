module CategoriesHelper
  def top_categories
    top_categories = Category.all.sort_by { |category| category.operations.count }.reverse.last(3)
  end
end
