require "administrate/base_dashboard"

class LongTermStockDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    stock_symbol: Field::String,
    target_price: Field::Number.with_options(decimals: 2),
    bid_price: Field::Number.with_options(decimals: 2),
    last_trade_price: Field::Number.with_options(decimals: 2),
    action: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :stock_symbol,
    :target_price,
    :bid_price,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :stock_symbol,
    :target_price,
    :bid_price,
    :last_trade_price,
    :action,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :stock_symbol,
    :target_price,
    :bid_price,
    :last_trade_price,
    :action,
  ].freeze

  # Overwrite this method to customize how long term stocks are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(long_term_stock)
  #   "LongTermStock ##{long_term_stock.id}"
  # end
end
