import "./errors.tsp";
import "@typespec/http";

using TypeSpec.Http;

namespace Wise {


model Page<T> {
  @doc("The items in the collection.")
  @pageItems items: T[];
  @doc("Next page link.")
  @nextLink next: url;
  @doc("Previous page link.")
  @prevLink prev: url;
  @doc("First page link.")
  @firstLink first: url;
  @doc("Last page link.")
  @lastLink last: url;
}

model IdempotencyKey {

  @doc("Allows to safely retry requests without the risk of performing the same operation multiple times. By including a unique key (such as a UUID) in the header of POST, or PATCH requests, the server can identify and return the result of the original request if the same key is received again, preventing duplicate resource creation or unintended side effects.")
  @example("a3bb189e-8bf9-4884-8b27-9f6b2d95f27e")
  @header IdenpotencyKey: Guid;
}

union ListResponse<T> {
  items: Page<T>;
  unauthorized: Unauthorized;
  rateLimit: RateLimit;
  serverError: InternalServerError;
}

model Created <T> {
  @statusCode httpCode: 201;
  ...T
}

union CreateResponse<T> {
  item: Created<T>;
  badRequest: BadRequest;
  unauthorized: Unauthorized;
  rateLimit: RateLimit;
  serverError: InternalServerError;
}

union CreateResponseIdenpotent<T> {
  item: Created<T>;
  badRequest: BadRequest;
  unauthorized: Unauthorized;
  conflict: Conflict;
  rateLimit: RateLimit;
  serverError: InternalServerError;
}

union ReadResponse<T> {
  item: T;
  unauthorized: Unauthorized;
  notFound: NotFound;
  rateLimit: RateLimit;
  serverError: InternalServerError;
}

union UpdateResponse<T> {
  item: T;
  badRequest: BadRequest;
  unauthorized: Unauthorized;
  notFound: NotFound;
  rateLimit: RateLimit;
  serverError: InternalServerError;
}

union UpdateResponseIdenpotent<T> {
  item: T;
  badRequest: BadRequest;
  unauthorized: Unauthorized;
  notFound: NotFound;
  conflict: Conflict;
  rateLimit: RateLimit;
  serverError: InternalServerError;
}

union DeleteResponse {
  unauthorized: Unauthorized;
  notFound: NotFound;
  rateLimit: RateLimit;
  serverError: InternalServerError;
}

}
