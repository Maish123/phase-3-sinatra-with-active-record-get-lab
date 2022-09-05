class ApplicationController < Sinatra::Base

  set default_content_type: "application/json"
  # add routes
  get '/bakeries' do
    bakeries = Bakery.all 
    bakeries.to_json
  end
  ##GET BAKERIES/ID ROUTE
  get '/bakeries/:id' do
    bakeries = Bakery.find(params[:id])
    bakeries.to_json(include: :baked_goods)
  end
  ## GET BAKED_GOODS/BY PRICE
  get'/baked_goods/by_price' do
  sorted_goods = BakedGood.order(price: :desc)
  sorted_goods.to_json
  end
  ##GET BAKED GOODS/MOST EXPENSIVE
  get '/baked_goods/most_expensive' do
    most_expensive = BakedGood.order(price: :desc).first
    most_expensive.to_json
  end

end
