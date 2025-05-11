import "../types.tsp";
import "./profile.tsp";

@doc("Recipient or beneficiary is the one who will receive the funds.")
model RecipentAccount is Account {
}

model Account {
  id: Guid;

  currency: Currency;
  type: AccountType;
  prfileId: Profile.id;
  ownedByCustomer: boolean;
  accountHolderName: string;
  details: AccountDetails;
}

model AccountDetails {
  @doc("The legal type of the account holder.")
  legalType: LegalType;

  @doc("The sort code of the account.")
  @example("040075")
  sortCode: string;

  @doc("The account number.")
  @example("37778842")
  accountNumber: string;

  @doc("The date of birth of the account holder.")
  @example("1961-01-01")
  dateOfBirth: Date;
}