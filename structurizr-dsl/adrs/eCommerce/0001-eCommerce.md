# ADR 001: Using Sellable Product Hub and commercetool for Commerce Product Data

## Context

We need to establish a reliable and efficient way to emit commerce product data to other systems within our enterprise architecture. This data includes information about sellable products, such as pricing, inventory, and product details. 

## Decision

After evaluating various options, we have decided to use Sellable Product Hub as the enterprise source and commercetool as the eCommerce source for emitting commerce product data.

## Rationale

1. **Sellable Product Hub**: Sellable Product Hub provides a centralized repository for managing and organizing sellable product data. It offers robust features for maintaining product information, pricing, and inventory across multiple channels.

2. **commercetool**: commercetool is a powerful eCommerce platform that specializes in managing and delivering commerce experiences. It offers extensive APIs and integrations, making it easier to connect with other systems and distribute commerce product data.

3. **Scalability and Flexibility**: Both Sellable Product Hub and commercetool are designed to handle large-scale operations and can easily scale as our business grows. They also provide flexibility in terms of customization and integration capabilities.

4. **Industry Standard**: Sellable Product Hub and commercetool are widely adopted in the industry and have proven track records. Leveraging these established solutions reduces the risk of implementation issues and ensures compatibility with other systems.

## Consequences

By using Sellable Product Hub as the enterprise source and commercetool as the eCommerce source, we can achieve a streamlined and reliable process for emitting commerce product data to other systems. This decision promotes data consistency, scalability, and compatibility within our enterprise architecture.
