class Product < ApplicationRecord
  #Associations
  belongs_to :supplier
  belongs_to :category

  #methods
  #class methods
  def self.search(params)
    scope = all
    scope = scope.where(category_id: params[:category_id]) if params[:category_id].present?
    scope = scope.where(sku: params[:sku]) if params[:sku].present?
    scope = scope.where('name LIKE :name', name: "%#{params[:name]}%") if params[:name].present?
    scope
  end
end
