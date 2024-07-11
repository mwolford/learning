workspace "eCommerce"  {
    model {
        ccr = person "Customer Care Representative"

        customerCare = softwareSystem "Customer Care System"
        refundFraud = softwareSystem "Refund Fraud System"

        ccr -> customerCare "Uses"
        user = person "User"
         commerceTools = softwareSystem "Commerce Tools" { 
            description "The core eCommerce platform, orders, pricing, product detail, etc"
            tags "External System"
        }
        algolia = softwareSystem "Algolia" { 
            description "The Core Search engine for the website"
            tags "External System"
        }
        contentstack = softwareSystem "Contentstack" { 
            description "The Core CMS for the website"
            tags "External System"
        }
        cooklist = softwareSystem "Cooklist" { 
            description "The Core Recipe Management System"
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
                commerceTools -> ctservices "Sends Product Data" "HTTPS/Event" "HTTPS/Event"
                ctservices -> algolia "Send Product Data" "HTTPS/JSON" "HTTPS/JSON"
            }
            webapp = container "Website" {
                frontend = component "Frontend"
                bff = component "Backend For Frontend"
                frontend -> bff "Calls" "HTTPS/JSON" "HTTPS/JSON"
                bff -> services "Calls" "HTTPS/JSON" "[HTTPS/JSON]"
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
