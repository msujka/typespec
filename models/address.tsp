import "../types.tsp";

@doc("Represents physical addresses for a profile.")
model Address {
  @doc("First line of address.")
  @example("50 Sunflower Avenue")
  firstLine: string;

  @doc("City")
  @example("Phoenix")
  city: string;

  countryIso3Code: CountryCode;

  @minLength(2)
  @doc("Postal code")
  @example("10025")
  postCode: string;

  @minLength(2)
  @maxLength(2)
  @pattern("^[A-Z]{2}$")
  @doc("State code. Required for US, CA, BR and AU addresses")
  @example("AZ")
  stateCode: string;
}