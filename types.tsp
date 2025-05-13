

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

/** 
 The status of the transfer:
 - `incoming_payment_waiting`: The transfer has been submitted, and it’s waiting for the funds to arrive with Wise.
 - `incoming_payment_initiated`: The funding has been initiated but the money has not yet arrived to Wise's account.
 - `processing`: We have received the funds and are processing the transfer. Processing is a generic term and means we’re doing behind-the-scene activities before the money gets sent to the recipient, such as AML, compliance and fraud checks.
 - `funds_converted`: All compliance checks have been completed for the transfer and funds have been converted from the source currency to the target currency.
 - `outgoing_payment_sent`: Wise has paid out funds to the recipient. This is the final state of the transfer, assuming funds will not be returned. When a transfer has this state, it does not mean the money has arrived in the recipient’s bank account, just that we have sent it from ours. Note: Payment systems in different countries operate in different speeds and frequency. For example, in the UK, the payment will reach the recipient bank account within few minutes after we send the outgoing payment. However, in the US it usually takes a day until funds are received.
 - `cancelled`: This status is used when the transfer was never funded and therefore never processed. This is a final state of the transfer.
 - `funds_refunded`: Transfer has been refunded. This is a final state of the transfer.
 - `bounced_back`: Transfer has bounced back but has not been cancelled nor refunded yet. This is not a final transfer state, it means the transfer will either be delivered with delay or it will turn to funds_refunded state.
 - `charged_back`: This status is used when we have problem to debit payer's account or payer requested money back. Chargeback can happen from any other state.
 - `unknown`: This status is used when we don’t have enough information to move the transfer into a final state. We send out an email for more information. e.g. Sender account details to refund money back.
*/
enum TransferStatus {
  "incoming_payment_waiting",
  "incoming_payment_initiated",
  "processing",
  "funds_converted",
  "outgoing_payment_sent",
  "charged_back",
  "cancelled",
  "funds_refunded",
  "bounced_back",
  "unknown"
}

model Payment {

  /** 
   * This indicates the type of funding you would like to apply to the transfer.
   * - `BALANCE`: Funds are pulled from a multi-currency account held with Wise.
   * - `TRUSTED_PRE_FUND_BULK`: Funds for the transfer will be settled through a bulk payment at a later date.
   */
  type: "BALANCE" | "TRUSTED_PRE_FUND_BULK";

  @doc("`COMPLETED` or `REJECTED`")
  @example("COMPLETED")
  @visibility(Lifecycle.Read)
  status: "COMPLETED" | "REJECTED";

  @example("transfer.insufficient_funds")
  @visibility(Lifecycle.Read)
  errorCode?: string;
}