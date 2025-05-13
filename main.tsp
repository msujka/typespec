import "@typespec/http";
import "@typespec/openapi";
import "./interfaces/profile.tsp";
import "./interfaces/quote.tsp";
import "./interfaces/recipentaccount.tsp";
import "./interfaces/transfer.tsp";


using Http;
using OpenAPI;
@tagMetadata("Profiles", #{
  description: "Profiles are connected to a User account and are either personal or business. The requests described here refer to a {{profileId}} or profile id - this value can be the business profile ID, or the personal profile ID.",
})
@tagMetadata("Quotes", #{
  description: "The quote resource defines the basic information required for a Wise transfer - the currencies to send between, the amount to send and the profile who is sending the money. The profile must be included when creating a quote.",
})
@tagMetadata("Recipient Accounts", #{
  description: "Recipient or beneficiary is the one who will receive the funds.",
})
@tagMetadata("Transfers", #{
  description: "A transfer is a payment order to recipient account based on a quote. Once created, a transfer needs to be funded within the next fourteen days. Otherwise, it will be automatically canceled.",
})
@service(#{ title: "Wise Platform API" })
namespace Wise;
