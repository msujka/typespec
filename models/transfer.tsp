import "../types.tsp";

model Transfer {
  @visibility(Lifecycle.Read)
  @doc("The unique identifier for the transfer.")
  id: Guid;

  @doc("Refund recipient account ID.")
  sourceAccount?: Guid;
  @doc("The recipent account for the transfer.")
  targetAccount: Guid;
  @doc("The unique identifier for the quote.")
  quoteUuid: Guid;

  @visibility(Lifecycle.Read)
  @doc("The status of the transfer.")
  status?: TransferStatus;

  @doc("The reference for the transfer.")
  @visibility(Lifecycle.Read)
  reference?: string;

  @visibility(Lifecycle.Read)
  @doc("The exchange rate for the transfer.")
  rate: numeric;

  @visibility(Lifecycle.Read)
  @doc("The date and time the transfer was created.")
  created: Date;

  @visibility(Lifecycle.Read)
  @doc("Indicates if the transfer has active issues.")
  hasActiveIssues?: boolean;

  @visibility(Lifecycle.Read)
  @doc("The source currency of the transfer.")
  sourceCurrency?: Currency;

  @visibility(Lifecycle.Read)
  @doc("The source value of the transfer.")
  sourceValue?: Amount;

  @visibility(Lifecycle.Read)
  @doc("The target currency of the transfer.")
  targetCurrency?: Currency;

  @visibility(Lifecycle.Read)
  @doc("The target value of the transfer.")
  targetValue?: Amount;

  @doc("Idenpotency identifier randomly generated per transfer request by the calling client.")
  customerTransactionId: Guid;
}