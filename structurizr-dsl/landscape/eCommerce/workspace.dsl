workspace extends ../system-landscape.dsl {
    configuration {
        scope softwaresystem
    }
    model {
        !extend eCommerce {
            !adrs adrs/eCommerce
            !docs docs
            integrations = container "Enterprise Integrations" "The integrations with external systems" "Azure, .NET Core"{
                !adrs adrs/enterprise-integrations
                services = component "Services" "The services that integrate with the commerce tools API" ".NET Core"
                productHub -> services "Sends Product Changes Events" "HTTPS/EVENT"
                services -> commerceTools "Sends Product Data" "HTTPS/JSON"
                
            }
            eCommerce -> refundFraud "Checks Status" "HTTPS/JSON"
            customer -> eCommerce "Uses" "Web Browser"
            eCommerce -> csr "Opens a ticket for customer" "HTTPS/JSON"
            eCommerce -> newSystem "Reports Order Concern" "HTTPS/JSON"
            customerCare -> refundFraud "Reports" "HTTPS/JSON"
            thing = container "External APIs" "API's from eCommerce that other systems can use exposed by Central APIM" "Azure API Management"{
                externalAPIFunction = component "Services" "The services that are exposed to other systems" "Azure Function"
            }    
        }
        central-apim -> externalAPIFunction "Forwards" "HTTPS/JSON"
        externalAPIFunction -> commerceTools "Forwards Order CAlls" "HTTPS/JSON"
        externalAPIFunction -> algolia "Forwards Search Calls" "HTTPS/JSON"

        eCommerce -> customerCare "Reports Order Concern" "HTTPS/JSON"
        commerceTools -> contentstack "Sends Product Data" "HTTPS/JSON"
        commerceTools -> cooklist "Sends Product Data" "HTTPS/JSON"
        commerceTools -> algolia "Sends Product Data" "HTTPS/JSON"

    }
    views {
        systemcontext eCommerce "eCommerce-SystemContext" "The system context diagram for the eCommerce system" {
            include *
            autoLayout tb
        }
        container eCommerce "eCommerce-Containers" "The container diagram for the eCommerce system" {
            include *
            autoLayout lr
        }
        component integrations "eCommerce-Components" "The component diagram for the eCommerce system" {
            include *
            autoLayout lr
        }
    }
}