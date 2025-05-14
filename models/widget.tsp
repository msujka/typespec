import "../types.tsp";

@doc("Represents a widget object.")
model Widget {
  @visibility(Lifecycle.Read)
  @doc("Unique identifier for the profile.")
  id: Guid;
}