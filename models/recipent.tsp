import "../types.tsp";

model Recipient {
  @visibility(Lifecycle.Read)
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