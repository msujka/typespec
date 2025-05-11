import "@typespec/http";
import "@typespec/openapi";
import "./interfaces/profile.tsp";
import "./interfaces/quote.tsp";
import "./interfaces/recipentaccount.tsp";


using Http;
using OpenAPI;
@tagMetadata("Profiles", #{
  description: "Profiles are connected to a User account and are either personal or business. The requests described here refer to a {{profileId}} or profile id - this value can be the business profile ID, or the personal profile ID.",
})
@tagMetadata("Quotes", #{
  description: "The quote resource defines the basic information required for a Wise transfer - the currencies to send between, the amount to send and the profile who is sending the money. The profile must be included when creating a quote.",
})
@tagMetadata("Recipient Account", #{
  description: "Recipient or beneficiary is the one who will receive the funds.",
})
@service(#{ title: "Wise Platform API" })
namespace Wise;
