import "@typespec/http";
import "../models/profile.tsp";
import "../models/quote.tsp";
import "../responses.tsp";

using Http;

namespace Wise {

@route("/profiles")
@tag("Quotes")
interface Quotes {

  @summary("Create a quote.")
  /** Create an authenticated quote for a profile */
  @route("{profileId}/quotes") @post create(@path profileId: Profile.id, @body body: Quote): Wise.CreateResponse<Quote>;

  @summary("Get a quote.")
  /** Get a quote for a profile */
  @route("{profileId}/quotes/{id}") @get read(@path profileId: Profile.id, @path id: Quote.id): Wise.ReadResponse<Quote>;

  @summary("Update a quote.")
  /** Update a quote for a profile */
  @route("{profileId}/quotes/{id}") @patch update(@path profileId: Profile.id, @path id: Quote.id, @body body: MergePatchUpdate<Quote>): Wise.UpdateResponse<Quote>;

}

}