import "@typespec/http";
import "../models/account.tsp";
import "../responses.tsp";

using Http;

namespace Wise {

@route("/accounts")
@tag("Recipient Accounts")
interface RecipientAccount {

  @summary("List recipient accounts")
  /** Fetch a list of the user's recipient accounts.*/
  @get list(): Wise.ListResponse<RecipentAccount>;

  @summary("Retrieve a recipient account")
  /** Retrieve recipient account info by ID.  */
  @get read(@path id: RecipentAccount.id): Wise.ReadResponse<RecipentAccount>;

  @summary("Create a recipient account")
  /** Recipient is a person or institution who is the ultimate beneficiary of your payment. */
  @post create(@body body: RecipentAccount): Wise.CreateResponse<RecipentAccount>;
}

}