# APIs at Scale with TypeSpec

[Official Docs](https://typespec.io/) | [Try TypeSpec Online](https://aka.ms/trytypespec) | [Getting Started](https://typespec.io/docs) | [Language Overview](https://typespec.io/docs/language-basics/overview)

TypeSpec is a language for defining cloud service APIs and shapes. TypeSpec is a highly extensible language with primitives that can describe API shapes common among REST, OpenAPI, gRPC, and other protocols.

TypeSpec is excellent for generating many different API description formats, client and service code, documentation, and other assets while keeping your TypeSpec definition as a single source of truth.

Using TypeSpec, you can create reusable patterns for all aspects of an API and package those reusable patterns into libraries. These patterns establish "guardrails" for API designers and make it easier to follow best practices than to deviate from them. TypeSpec also has a rich linter framework with the ability to flag anti-patterns as well as an emitter framework that lets you control the output to ensure it follows the patterns you want.

TypeSpec is a Microsoft-built, community-supported project. Your ideas, feedbacks, and code make all the difference and we deeply appreciate the support from the community.

## [Installation](https://typespec.io/docs)

```
npm install -g @typespec/compiler
```

## [Usage](https://typespec.io/docs#create-first-typespec-project)

# Quick Start

This example uses the `@typespec/http`, `@typespec/rest`, and `@typespec/openapi3` libraries to define a basic REST service and generate an OpenAPI 3.0 document from it.

Run the following command after you clone this repository

Install the dependencies

```
tsp install
```

Compile it to OpenAPI 3.0:

```
tsp compile .
```

You can find the emitted OpenAPI output in `./tsp-output/schema/openapi.yaml`.

# [API-Reference](https://msujka.github.io/typespec/)

# How to use the Redocly CLI

Install Redocly CLI
```
npm i -g @redocly/cli@latest
```

Build the static HTML file
```
redocly build-docs tsp-output/schema/openapi.yaml --output=docs/api-reference.html
```

# Talks

## APIs at Scale with Typespec
A talk given by Mandy Whaley from Microsoft at the 2024 Austin API Summit in Austin, Texas.
[![APIs at Scale with TypeSpec](https://img.youtube.com/vi/yfCYrKaojDo/maxresdefault.jpg)](https://www.youtube.com/watch?v=yfCYrKaojDo)

## Typespec demo with Mark Weitzel, Principal Architect at Microsoft
Mark Weitzel, Principal Architect at Microsoft joins us to talk about TypeSpec, a new project that makes it easier than ever to author OpenAPI docs.
[![APIs at Scale with TypeSpec](https://img.youtube.com/vi/c4KwhL6b4Hc/maxresdefault.jpg)](https://www.youtube.com/watch?v=c4KwhL6b4Hc)
