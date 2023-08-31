# Problem

If you define a schema directly into the contract you will receive a set of errors. If you define a schema and use it you get a diferrent set of errors.

# run it

```
bundle install
bundle exec rspec
```

The output will be:

```

  1) Compare errors has the same errors for inherited schema and direct schema contract
     Failure/Error: expect(inherited_schema_contract.call(params).errors[:person].to_h).to eq(contract.call(params).errors[:person].to_h)

       expected: {:birthdate=>["is in invalid format"], :external_id=>["is missing"], :first_name=>["is missing"], :last_name=>["size cannot be greater than 255"], :type=>["size cannot be greater than 32"]}
            got: {:birthdate=>["is in invalid format"], :last_name=>["size cannot be greater than 255"], :type=>["size cannot be greater than 32"]}

       (compared using ==)

       Diff:
       @@ -1,6 +1,4 @@
        :birthdate => ["is in invalid format"],
       -:external_id => ["is missing"],
       -:first_name => ["is missing"],
        :last_name => ["size cannot be greater than 255"],
        :type => ["size cannot be greater than 32"],

     # ./spec/contract_errors_spec.rb:17:in `block (2 levels) in <top (required)>'

  2) Compare errors has the same errors for inherited only the common fields and direct defined schema contract
     Failure/Error: expect(common_fields_contract.call(params).errors[:person].to_h).to eq(contract.call(params).errors[:person].to_h)

       expected: {:birthdate=>["is in invalid format"], :external_id=>["is missing"], :first_name=>["is missing"], :last_name=>["size cannot be greater than 255"], :type=>["size cannot be greater than 32"]}
            got: {:birthdate=>["is in invalid format"], :last_name=>["size cannot be greater than 255"], :type=>["size cannot be greater than 32"]}

       (compared using ==)

       Diff:
       @@ -1,6 +1,4 @@
        :birthdate => ["is in invalid format"],
       -:external_id => ["is missing"],
       -:first_name => ["is missing"],
        :last_name => ["size cannot be greater than 255"],
        :type => ["size cannot be greater than 32"],

     # ./spec/contract_errors_spec.rb:25:in `block (2 levels) in <top (required)>'

```