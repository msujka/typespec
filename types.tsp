

@doc("3 Letter country code in lower case")
@example("usa")
@pattern("^[a-z]{3}$")
@maxLength(3)
@minLength(3)
scalar CountryCode extends string;


@doc("A globally unique identifier. This is a 128-bit integer that can be used to identify an object.")
@example("123e4567-e89b-12d3-a456-426614174000")
@minLength(36)
@maxLength(36)
@pattern("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$")
scalar Guid extends string;

@doc("Representes a type of user profile.")
@example(ProfileType.PERSONAL)
enum ProfileType { "PERSONAL", "BUSINESS" };

@doc("Represents a date in the format YYYY-MM-DD.")
scalar Date extends string;

@doc("Three-letter ISO currency code in upper case.")
@example("USD")
@pattern("^[A-Z]{3}$")
@maxLength(3)
@minLength(3)
scalar Currency extends string;

@doc("Cash amount in the smallest unit of the currency.")
@example(1000)
@minValue(0)
@maxValue(1000000000000)
scalar Amount extends numeric;

@doc("The legal type of the account holder.")
@example(LegalType.PRIVATE)
enum LegalType {
  PRIVATE,
  BUSINESS
}

@doc("Recipient type.")
@example("SortCode")
scalar AccountType extends string;