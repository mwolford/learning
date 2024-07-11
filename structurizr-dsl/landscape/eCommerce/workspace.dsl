workspace extends ../system-landscape.dsl {
    configuration {
        scope softwaresystem
    }
    model {
        !extend eCommerce {
            !adrs adrs
            !docs docs
            integrations = container "Enterprise Integrations" "The integrations with external systems" "Azure, .NET Core"{
                !adrs adrs
                services = component "Services" "The services that integrate with the commerce tools API" ".NET Core"
                productHub -> services "Sends Product Changes Events" "HTTPS/EVENT"
                services -> commerceTools "Sends Product Data" "HTTPS/JSON"
                
            }
            eCommerce -> refundFraud "Checks Status" "HTTPS/JSON"
            customer -> eCommerce "Uses" "Web Browser"
        }
        eCommerce -> customerCare "Reports Order Concern" "HTTPS/JSON"
    }
    views {
        systemcontext eCommerce "eCommerce-SystemContext" "The system context diagram for the eCommerce system" {
            include *
            autoLayout lr
        }
        container eCommerce "eCommerce-Containers" "The container diagram for the eCommerce system" {
            include *
            autoLayout lr
        }
    }
}