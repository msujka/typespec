import "../types.tsp";
import "./address.tsp";

@doc("Profiles are connected to a User account and are either personal or business.")
model Profile {

  id: Guid;

  @doc("First name (including middle names).")
  @example("Oliver")
  @maxLength(30)
  firstName: string;

  @doc("Last name.")
  @maxLength(30)
  @example("Wilson")
  lastName: string;

  @maxLength(30)
  @doc("Preferred first name, if different to the legal first name.")
  @example("Ollie")
  preferredName?: string;

  @doc("Contact email address. Please speak with your integration account manager for details on how customer communication is handled for your integration.")
  @example("o.wilson@example.com")
  email: string;

  address: Address;

  nationality?: CountryCode;

  @doc("Date of birth.")
  @example("1977-07-01")
  dateOfBirth: Date;
}