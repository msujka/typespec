import "@typespec/http";

using TypeSpec.Http;

namespace Wise {
  
@example("https://httpproblems.com/http-status/429")
@doc("A URI reference that identifies the problem.")
scalar StatusUri extends string;

@example("Too Many Requests")
@doc("A short, human-readable summary of the problem.")
scalar StatusSummary extends string;

@doc("The HTTP status code.")
@example(429)
scalar StatusCode extends integer;

@doc("A human-readable explanation specific to this occurrence of the problem.")
@example("No Authorization Header.")
scalar StatusDetail extends string;


@error
model Error {
  type: StatusUri;
  title: StatusSummary;
  status: StatusCode;
  detail?: StatusDetail;
}

@error
@doc("The request could not be understood by the server due to malformed syntax.")
model BadRequest extends Error {
  @statusCode status: 400;
}

@error
@doc("The client is not authorized to access the requested resource.")
@example(#{
  type: "https://httpproblems.com/http-status/401",
  title: "Unauthorized",
  status: 401,
  detail: "No Authorization Header.",
})
model Unauthorized extends Error {
  @statusCode status: 401;
}

@error
@doc("The requested resource could not be found.")
@example(#{
  type: "https://httpproblems.com/http-status/404",
  title: "Not Found",
  status: 404,
  detail: "The requested resource could not be found.",
})
model NotFound extends Error {
  @statusCode status: 404;
}

@error
@doc("The request could not be completed due to a conflict with the current state of the target resource.")
@example(#{
  type: "https://httpproblems.com/http-status/409",
  title: "Conflict",
  status: 409,
  detail: "The request could not be completed due to a conflict with the current state of the target resource.",
})
model Conflict extends Error {
  @statusCode status: 409;
}

@error
@doc("Rate limit response indicates the client has sent too many requests in a given amount of time.")
@example(#{
  type: "https://httpproblems.com/http-status/429",
  title: "Too Many Requests",
  status: 429,
  detail: "Rate limit exceeded.",
})
model RateLimit extends Error {
  @statusCode status: 429;
}

@error
@doc("The server encountered an unexpected condition that prevented it from fulfilling the request. These are rare.")
@example(#{
  type: "https://httpproblems.com/http-status/500",
  title: "Internal Server Error",
  status: 500,
  detail: "An unexpected error occurred. Those are rare. The team has been notified and will be in touch with you shortly.",
})
model InternalServerError extends Error {
  @statusCode status: 500;
}

union ListErrors {
  unauthorized: Unauthorized;
  rateLimit: RateLimit;
  serverError: InternalServerError;
}

union CreateErrors {
  badRequest: BadRequest;
  unauthorized: Unauthorized;
  rateLimit: RateLimit;
  serverError: InternalServerError;
}

union IdempotentCreateErrors {
  badRequest: BadRequest;
  unauthorized: Unauthorized;
  conflict: Conflict;
  rateLimit: RateLimit;
  serverError: InternalServerError;
}

union ReadErrors {
  unauthorized: Unauthorized;
  notFound: NotFound;
  rateLimit: RateLimit;
  serverError: InternalServerError;
}

union UpdateErrors {
  badRequest: BadRequest;
  unauthorized: Unauthorized;
  notFound: NotFound;
  rateLimit: RateLimit;
  serverError: InternalServerError;
}

union IdempotentUpdateErrors {
  badRequest: BadRequest;
  unauthorized: Unauthorized;
  notFound: NotFound;
  conflict: Conflict;
  rateLimit: RateLimit;
  serverError: InternalServerError;
}

union DeleteErrors {
  unauthorized: Unauthorized;
  notFound: NotFound;
  rateLimit: RateLimit;
  serverError: InternalServerError;
}

union IdempotentDeleteErrors {
  unauthorized: Unauthorized;
  notFound: NotFound;
  conflict: Conflict;
  rateLimit: RateLimit;
  serverError: InternalServerError;
}

}