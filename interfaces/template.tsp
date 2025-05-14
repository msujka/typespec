import "@typespec/http";
import "../models/widget.tsp";
import "../responses.tsp";

using Http;


namespace Wise {

  @route("/widgets")
  @tag("Widgets")
  interface Widgets {
    @summary("List all widgets.")
    /** Returns a paginated list of widgets. */
    @get list(): Wise.ListResponse<Widget>;

    @summary("Create a widget.")
    /** Create a widget. */
    @post create(@body body: Widget): Wise.CreateResponse<Widget>;

    @summary("Get a widget.")
    /** Get a widget. */
    @get read(@path id: Widget.id): Wise.ReadResponse<Widget>;

    @summary("Update a widget.")
    /** Update a widget. */
    @patch update(@path id: Widget.id, @body body: MergePatchUpdate<Widget>): Wise.UpdateResponse<Widget>;

    @summary("Delete a widget.")
    /** Delete a widget. */
    @delete delete(@path id: Widget.id): Wise.DeleteResponse;
  }
}
