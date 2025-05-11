"currency": "GBP",
"type": "sort_code",
"profile": str(profile_id),
"ownedByCustomer": True,
"accountHolderName": "John Doe",
 "details": {
    "legalType": "PRIVATE",
    "sortCode": "040075",
    "accountNumber": "37778842",
    "dateOfBirth": "1961-01-01"
 }
}

import "../types.tsp";

model Recipient {
  @doc("The unique identifier for the recipient.")
  id: Guid;

  @doc("The name of the recipient.")
  name: string;

  @doc("The type of the recipient.")
  type: RecipientType;

  @doc("The currency of the recipient's account.")
  currency: Currency;

  @doc("The details of the recipient's account.")
  details: RecipientDetails;
}