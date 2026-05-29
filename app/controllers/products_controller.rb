

@products = Product.order("name").page(params[:page]).per(5)



