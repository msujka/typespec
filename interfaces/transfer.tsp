import "@typespec/http";
import "../models/transfer.tsp";
import "../models/profile.tsp";
import "../responses.tsp";

using Http;

namespace Wise {

  @route("/transfers")
  @tag("Transfers")
  interface Transfers {
    @summary("Create a transfer.")
    /** Create a transfer for a profile */
    @route("{profileId}/transfers") 
    @post create(@path profileId: Profile.id, @body body: Transfer): Wise.CreateResponse<Transfer>;

    @summary("Get a transfer.")
    /** Get a transfer for a profile */
    @route("{profileId}/transfers/{id}") 
    @get read(@path profileId: Profile.id, @path id: Transfer.id): Wise.ReadResponse<Transfer>;

    @summary("Update a transfer.")
    /** Update a transfer for a profile */
    @route("{profileId}/transfers/{id}") 
    @patch update(@path profileId: Profile.id, @path id: Transfer.id, @body body: MergePatchUpdate<Transfer>): Wise.UpdateResponse<Transfer>;

    @summary("Fund a transfer.")
    /** Fund a transfer for a profile */
    @route("{profileId}/transfers/{id}/payments") 
    @post fund(@path profileId: Profile.id, @path id: Transfer.id, @body body: Payment): Wise.CreateResponse<Payment>;

  }
}
