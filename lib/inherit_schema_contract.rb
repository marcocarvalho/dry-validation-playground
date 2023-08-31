class InheritSchemaContract < Dry::Validation::Contract
  json do
    required(:person).hash(Schema) do
      required(:external_id).value(:string, max_size?: 64)
      required(:first_name).value(:string, max_size?: 255)
    end
  end
end