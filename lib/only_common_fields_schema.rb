OnlyCommonFieldsSchema = Dry::Schema.JSON do
  optional(:last_name).value(:string, max_size?: 255)
  optional(:type).value(:string, max_size?: 32)
  optional(:birthdate).value(:string, format?: /\A(-?(?:[1-9][0-9]*)?[0-9]{4})-(1[0-2]|0[1-9])-(3[0-1]|0[1-9]|[1-2][0-9])\Z/)
end
