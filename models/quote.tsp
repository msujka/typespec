import "../types.tsp";

model Quote {
  @visibility(Lifecycle.Read)
  @doc("The unique identifier for the quote.")
  id: Guid;

  @doc("The currency you are sending from.")
  sourceCurrency: Currency;

  @doc("The currency you are sending to.")
  targetCurrency: Currency;

  @doc("The amount you are sending from.")
  sourceAmount: Amount;

  @doc("The amount you are sending to.")
  targetAmount: Amount;

  @doc("Preferred payin method. Use BANK_TRANSFER to return this method at the top of the response's results.")
  @example("BANK_TRANSFER")
  preferredPayIn?: "BANK_TRANSFER";
}