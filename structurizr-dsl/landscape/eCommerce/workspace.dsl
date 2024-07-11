workspace extends ../system-landscape.dsl {
    configuration {
        scope softwaresystem
    }
    model {
        !extend eCommerce {
            integrations = container "Enterprise Integrations" "The integrations with external systems" "Azure, .NET Core"{
                services = component "Services" "The services that integrate with the commerce tools API" ".NET Core"
                productHub -> services "Sends Product Changes Events" "HTTPS/EVENT"
                services -> commerceTools "Sends Product Data" "HTTPS/JSON"
                
            }
            eCommerce -> refundFraud "Checks Status" "HTTPS/JSON"
        }
    }
    views {
        systemcontext eCommerce "eCommerce-SystemContext" "The system context diagram for the eCommerce system" {
            include *
            autoLayout lr
        }
    }
}