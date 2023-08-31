RSpec.describe "Compare errors" do
  let(:inherited_schema_contract) { InheritSchemaContract.new }
  let(:contract) { Contract.new }
  let(:common_fields_contract) { CommonFieldsContract.new }

  let(:params) do
    {
      person: {
        last_name: "x"*256,
        type: "u"*33,
        birthdate: "invalid"
      }
    }
  end

  it "has the same errors for inherited schema and direct schema contract" do
    expect(inherited_schema_contract.call(params).errors[:person].to_h).to eq(contract.call(params).errors[:person].to_h)
  end

  it "has the same errors for inherited schema and only inherited common fields schema" do
    expect(inherited_schema_contract.call(params).errors[:person].to_h).to eq(common_fields_contract.call(params).errors[:person].to_h)
  end

  it "has the same errors for inherited only the common fields and direct defined schema contract" do
    expect(common_fields_contract.call(params).errors[:person].to_h).to eq(contract.call(params).errors[:person].to_h)
  end
end