require "administrate/base_dashboard"

class TradingRecordDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    symbol: Field::String,
    direction: Field::String,
    volume: Field::Number,
    price: Field::Number.with_options(decimals: 2),
    deal_time: Field::DateTime,
    status: Field::String,
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
    :symbol,
    :direction,
    :volume,
    :price,
    :deal_time,
    :status
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :symbol,
    :direction,
    :volume,
    :price,
    :deal_time,
    :status,
    :created_at,
    :updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :symbol,
    :direction,
    :volume,
    :price,
    :deal_time,
    :status
  ].freeze

  # Overwrite this method to customize how trading records are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(trading_record)
  #   "TradingRecord ##{trading_record.id}"
  # end
end
