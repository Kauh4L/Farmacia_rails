json.extract! item_venda, :id, :venda_id, :produto_id, :quantidade, :preco_unitario, :created_at, :updated_at
json.url item_venda_url(item_venda, format: :json)
