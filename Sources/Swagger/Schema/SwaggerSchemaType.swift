import Foundation

/// An enumeration of schema types.
/// Get more info: https://swagger.io/specification/#schemaObject
public enum SwaggerSchemaType: Equatable {

    // MARK: - Enumeration Cases

    /// Boolean schema.
    case boolean(SwaggerBooleanSchema)

    /// Integer number schema.
    case integer(SwaggerIntegerSchema)

    /// Any number schema, includes both integer and floating-point numbers.
    case number(SwaggerNumberSchema)

    /// String schema.
    case string(SwaggerStringSchema)

    /// Array schema.
    indirect case array(SwaggerArraySchema)

    /// Object schema.
    indirect case object(SwaggerObjectSchema)

    /// All of the schemas.
    /// - `schemas`: schemas that are used in a composition
    indirect case allOf(schemas: [SwaggerComponent<SwaggerSchema>])

    /// Any of the schemas.
    /// - `schemas`: schemas that are used in a composition
    /// - `discriminator`: an object that is used to differentiate between other schemas
    /// which may satisfy the payload description.
    indirect case anyOf(schemas: [SwaggerComponent<SwaggerSchema>], discriminator: SwaggerSchemaDiscriminator?)

    /// One of the schemas.
    /// - `schemas`: schemas that are used in a composition
    /// - `discriminator`: an object that is used to differentiate between other schemas
    /// which may satisfy the payload description.
    indirect case oneOf(schemas: [SwaggerComponent<SwaggerSchema>], discriminator: SwaggerSchemaDiscriminator?)

    /// Any schema.
    indirect case any(SwaggerAnySchema)
}
