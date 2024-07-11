# ADR: Sellable Hub as Source of Truth for Commerce Systems

## Context

In our eCommerce ecosystem, we have multiple commerce systems that require accurate and up-to-date product data. Currently, there is a need to establish a central source of truth for product data to ensure consistency and avoid data discrepancies across different systems. We are considering using Sellable Hub as the central repository and integrating it with Commercetools.

## Decision

We have decided to implement Sellable Hub as the source of truth for all commerce systems that require product data. Commercetools will be integrated with Sellable Hub to ensure seamless data synchronization.

## Rationale

1. Centralized Data: By using Sellable Hub as the central repository, we can ensure that all commerce systems have access to the most accurate and up-to-date product data. This eliminates the need for manual data synchronization and reduces the risk of data discrepancies.

2. Scalability: Sellable Hub provides a scalable solution that can handle large volumes of product data. This ensures that our eCommerce ecosystem can grow and accommodate future business needs.

3. Integration with Commercetools: Commercetools is a widely used commerce platform that offers robust features and flexibility. Integrating Commercetools with Sellable Hub allows us to leverage the strengths of both systems and create a seamless data flow.

## Consequences

1. Improved Data Consistency: With Sellable Hub as the source of truth, we can ensure consistent and accurate product data across all commerce systems. This improves the overall customer experience and reduces the risk of errors.

2. Reduced Maintenance Effort: By eliminating manual data synchronization, we can reduce the maintenance effort required to keep product data up-to-date. This allows our team to focus on other critical tasks.

3. Dependency on Sellable Hub: As Sellable Hub becomes the central repository, there will be a dependency on its availability and reliability. We need to ensure proper monitoring and maintenance of Sellable Hub to minimize any potential disruptions.
