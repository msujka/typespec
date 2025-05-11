# typespec
APIs at Scale with TypeSpec

# TypeSpec

[Official Docs](https://typespec.io/) | [Try TypeSpec Online](https://aka.ms/trytypespec) | [Getting Started](https://typespec.io/docs) | [Language Overview](https://typespec.io/docs/language-basics/overview)

TypeSpec is a language for defining cloud service APIs and shapes. TypeSpec is a highly extensible language with primitives that can describe API shapes common among REST, OpenAPI, gRPC, and other protocols.

TypeSpec is excellent for generating many different API description formats, client and service code, documentation, and other assets while keeping your TypeSpec definition as a single source of truth.

Using TypeSpec, you can create reusable patterns for all aspects of an API and package those reusable patterns into libraries. These patterns establish "guardrails" for API designers and make it easier to follow best practices than to deviate from them. TypeSpec also has a rich linter framework with the ability to flag anti-patterns as well as an emitter framework that lets you control the output to ensure it follows the patterns you want.

TypeSpec is a Microsoft-built, community-supported project. Your ideas, feedbacks, and code make all the difference and we deeply appreciate the support from the community.

## [Installation](https://typespec.io/docs)

```
npm install -g @typespec/compiler
```

#### Tools

The [TypeSpec VS Code extension](https://marketplace.visualstudio.com/items?itemName=typespec.typespec-vscode) can be installed from the VS Code [marketplace](https://marketplace.visualstudio.com/items?itemName=typespec.typespec-vscode) or directly on the command line:

```
tsp code install
```

The [TypeSpec VS Extension](https://marketplace.visualstudio.com/items?itemName=typespec.typespecvs) can be installed from the [VS Marketplace](https://marketplace.visualstudio.com/items?itemName=typespec.typespecvs) or directly on the command line:

```
tsp vs install
```

## [Usage](https://typespec.io/docs#create-first-typespec-project)

### TypeSpec to OpenAPI 3.0 Example

This example uses the `@typespec/http`, `@typespec/rest`, and `@typespec/openapi3` libraries to define a basic REST service and generate an OpenAPI 3.0 document from it.

Run the following command and select "Generic REST API":

```
tsp init
```

Hit enter a few times to confirm the defaults.

Copy the contents below into your **main.tsp**:

```typespec
import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

using Http;
using Rest;

/** This is a pet store service. */
@service(#{ title: "Pet Store Service" })
@server("https://example.com", "The service endpoint")
namespace PetStore;

@route("/pets")
interface Pets {
  list(): Pet[];
}

model Pet {
  @minLength(100)
  name: string;

  @minValue(0)
  @maxValue(100)
  age: int32;

  kind: "dog" | "cat" | "fish";
}
```

Install the dependencies of main.tsp:

```
tsp install
```

Compile it to OpenAPI 3.0:

```
tsp compile main.tsp --emit @typespec/openapi3
```

You can find the emitted OpenAPI output in `./tsp-output/openapi.json`.

### Generated JavaScript services require a service runtime:
> https://nodejs.org/download 

Create a JavaScript service project for your TypeSpec:
> npx hsjs-scaffold

More information on getting started:
> https://aka.ms/tsp/hsjs/start