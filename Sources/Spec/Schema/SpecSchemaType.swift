import Foundation

/// An enumeration of schema types.
/// Get more info: https://swagger.io/specification/#schemaObject
public enum SpecSchemaType: Equatable {

    // MARK: - Enumeration Cases

    /// Boolean schema.
    case boolean(SpecBooleanSchema)

    /// Integer number schema.
    case integer(SpecIntegerSchema)

    /// Any number schema, includes both integer and floating-point numbers.
    case number(SpecNumberSchema)

    /// String schema.
    case string(SpecStringSchema)

    /// Array schema.
    indirect case array(SpecArraySchema)

    /// Object schema.
    indirect case object(SpecObjectSchema)

    /// All of the schemas.
    /// - `schemas`: schemas that are used in a composition
    indirect case allOf(schemas: [SpecComponent<SpecSchema>])

    /// Any of the schemas.
    /// - `schemas`: schemas that are used in a composition
    /// - `discriminator`: an object that is used to differentiate between other schemas
    /// which may satisfy the payload description.
    indirect case anyOf(schemas: [SpecComponent<SpecSchema>], discriminator: SpecSchemaDiscriminator?)

    /// One of the schemas.
    /// - `schemas`: schemas that are used in a composition
    /// - `discriminator`: an object that is used to differentiate between other schemas
    /// which may satisfy the payload description.
    indirect case oneOf(schemas: [SpecComponent<SpecSchema>], discriminator: SpecSchemaDiscriminator?)

    /// Any schema.
    indirect case any(SpecAnySchema)
}
