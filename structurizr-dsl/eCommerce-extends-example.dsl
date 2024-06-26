workspace extends customerCare.dsl  {
    model {
        //!include customerCare.dsl

        user = person "User"
        commerceTools = softwareSystem "Commerce Tools" { 
            tags "External System"
        }
        algolia = softwareSystem "Algolia" { 
            tags "External System"
        }
        contentstack = softwareSystem "Contentstack" { 
            tags "External System"
        }
        cooklist = softwareSystem "Cooklist" { 
            tags "External System"
        }
        productHub = softwareSystem "Sellable Product Hub"
        ecommerce = softwareSystem "eCommerce System"{
            integrations = container "Wegmans Enterprise Integrations" {
                webhook = component "Webhook" 
                services = component "Services"
                productHub -> services "Sends Product Changes Events"
                services -> commerceTools "Sends Product Data"

            }
            eCommerceIntegrations = container "eCommerce Data Integrations" {
                ctservices = component "Integration Services"
                commerceTools -> ctservices "[HTTPS/Event] Sends Product Data" {
                    tags "HTTPS/Event"
                }
                ctservices -> algolia "[HTTPS/JSON] Send Product Data"{
                    tags "HTTPS/JSON"
                }
            }
            webapp = container "Website" {
                frontend = component "Frontend"
                bff = component "Backend For Frontend"
                frontend -> bff "[HTTPS/JSON] Calls"{
                    tags "[HTTPS/JSON]"
                }
                bff -> services "[HTTPS/JSON] Calls"{
                    tags "[HTTPS/JSON]"
                }
            }
         }

        user -> ecommerce "Uses"
        user -> customerCare "Contacts"
        user -> ccr "Contacts"
        ecommerce -> refundFraud "Checks"
        customerCare -> refundFraud "Reports"
    }

    views {
        systemLandscape SystemLandscape {
            include *
            autoLayout
        }
        systemContext ecommerce {
            include *
            autoLayout
        }
        systemContext customerCare {
            include *
            autoLayout
        }
        container ecommerce {
            include *
            autoLayout
        }
        component integrations {
            include *
            autoLayout
        }
        component eCommerceIntegrations {
            include *
            autoLayout
        }
        component webapp {
            include *
            autoLayout
        }
        systemContext refundFraud {
            include *
            autoLayout
        }
    

        styles {
            
            relationship "[HTTPS/JSON]" {
                dashed true
                color #08427b
            }
            relationship "[HTTPS/Event]" {
                dashed true
                color #EB0606
            }
            element "Person" {
                background #08427b
                color #ffffff
                shape person
            }
            element "External System" {
                background #000000
                color #ffffff
                shape RoundedBox
            }
        }
    }
}
