import "@typespec/http";
import "../models/profile.tsp";
import "../responses.tsp";

using Http;

namespace Wise {

@route("/profiles")
@tag("Profiles")
interface Profiles {

  /** List all profiles */
  @summary("List all profiles")
  @get list (): Wise.ListResponse<Profile>;

  @summary("Retrieve a profile")
  /** Retrieve a profile by ID  */
  @get read(@path id: Profile.id): Wise.ReadResponse<Profile>;

  @summary("Create a profile")
  /** Create a profile */
  @post create(@body body: Profile): Wise.CreateResponse<Profile>;

  @summary("Update a profile")
  /** Update user profile information for a personal profile. */
  @patch update(@path id: Profile.id, @body body: MergePatchUpdate<Profile>): Wise.UpdateResponse<Profile>;

  @summary("Delete a profile")
  /** Delete a profile */
  @delete delete(@path id: Profile.id): Wise.DeleteResponse;

  /** Analyze a widget */
 // @route("{id}/analyze") @post analyze(@path id: string): Wise.AnalyzeResponse<Profile>;
}

}