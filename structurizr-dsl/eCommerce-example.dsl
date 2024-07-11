workspace "eCommerce"  {
    configuration {
        scope softwaresystem
    }
    model {
        ccr = person "Customer Care Representative"  "The employee that services customer inquiries"

        customerCare = softwareSystem "Customer Care System" "The system that manages customer inquiries"
        refundFraud = softwareSystem "Refund Fraud System" "The system that manages refund fraud" 

        ccr -> customerCare "Uses" "Web Browser"
        
        user = person "User" "The user of the system"
        commerceTools = softwareSystem "Commerce Tools" "The core eCommerce platform, orders, pricing, product detail, etc" "External System"
        algolia = softwareSystem "Algolia" "The Core Search engine for the website" "External System"
        contentstack = softwareSystem "Contentstack" "The Core CMS for the website" "External System"
        cooklist = softwareSystem "Cooklist" "The Core Recipe Management System" "External System"
        productHub = softwareSystem "Sellable Product Hub" "Products that are in a sellable state"
        ecommerce = softwareSystem "eCommerce System" "The eCommerce system"{
            !docs docs/eCommerce
            !adrs adrs/eCommerce
            integrations = container "Enterprise Integrations" "The integrations with external systems" "Azure, .NET Core"{
                services = component "Services" "The services that integrate with the commerce tools API" ".NET Core"
                productHub -> services "Sends Product Changes Events" "HTTPS/EVENT"
                services -> commerceTools "Sends Product Data" "HTTPS/JSON"
                commerceTools -> contentstack "Sends Product Data" "HTTPS/JSON"
                commerceTools -> cooklist "Sends Product Data" "HTTPS/JSON"
            }
            eCommerceIntegrations = container "eCommerce Data Integrations" "The integrations with external systems" "Azure, .NET Core"{
                ctservices = component "Integration Services" "The services that integrate with the commerce tools API" ".NET Core"
                commerceTools -> ctservices "Sends Product Data" "HTTPS/EVENT" "HTTPS/EVENT"
                ctservices -> algolia "Send Product Data" "HTTPS/JSON" "HTTPS/JSON"
            }
            webapp = container "Website" "The frontend of the website, a single page application" "REACT/HTML/CSS" {
                frontend = component "Frontend" "The frontend of the website, a single page application" "REACT/HTML/CSS"
                bff = component "Backend For Frontend" "The backend for the frontend, a gateway for the frontend to the backend services" "NEXTjs"
                frontend -> bff "Calls" "HTTPS/JSON" "HTTPS/JSON"
                bff -> services "Calls" "HTTPS/JSON" "HTTPS/JSON"
            }
         }

        user -> ecommerce "Uses" "Web Browser"
        user -> customerCare "Contacts" "Web Browser, Chat, Email"
        user -> ccr "Contacts" "Web Browser, Phone, Email"
        ecommerce -> refundFraud "Checks" "HTTPS/JSON"
        customerCare -> refundFraud "Reports" "HTTPS/JSON"

    }

    views {
systemLandscape "eCommerce-SystemLandscape" "The system landscape diagram for the eCommerce System" {
            include *
            autoLayout
        }
        systemContext ecommerce "eCommerce-SystemContext" "The system context diagram for the eCommerce System" {
            include *
            autoLayout
        }
        container ecommerce "eCommerce-Containers" "The container diagram for the eCommerce System" {
            include *
            autoLayout
        }
        component integrations "eCommerce-Integrations" "The component diagram for the eCommerce System" {
            include *
            autoLayout
        }
        component eCommerceIntegrations "eCommerce-Data-Integrations" "The component diagram for the eCommerce Data Integrations" {
            include *
            autoLayout
        }
        component webapp "eCommerce-Webapp" "The component diagram for the eCommerce Webapp" {
            include *
            autoLayout
        }
        systemContext refundFraud "RefundFraud-SystemContext" "The system context diagram for the Refund Fraud System" {
            include *
            autoLayout
        }
        systemContext customerCare "CustomerCare-SystemContext" "The system context diagram for the Customer Care System" {
            include *
            autoLayout lr
        }
    

        styles {
            
           relationship "HTTPS/JSON" {
                dashed true
                color #08427b
            }
            relationship "HTTPS/Event" {
                dashed true
                color #EB0606
            }
            element "Person" {
                background #08427b
                color #ffffff
                shape Person
            }
            element "External System" {
                background #3D3C85
                color #ffffff
                shape RoundedBox
            }
        }
    }
}
