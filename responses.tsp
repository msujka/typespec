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
union DeleteResponse {
  unauthorized: Unauthorized;
  notFound: NotFound;
  rateLimit: RateLimit;
  serverError: InternalServerError;
}

}
