workspace "Enterprise-Landscape"{
    configuration {
        scope landscape
    }
    model {
        customer = person "Customer" "A customer that uses our systems to purchase products"

        eCommerce = softwareSystem "eCommerce" "Allows customers to purchase products online"
        customerCare = softwareSystem "Customer Care" "Allows customers to view and manage their orders"
        refundFraud = softwareSystem "Refund Fraud System" "The system that manages refund fraud" "External System" 
        commerceTools = softwareSystem "Commerce Tools" "The core eCommerce platform, orders, pricing, product detail, etc" "External System"
        algolia = softwareSystem "Algolia" "The Core Search engine for the website" "External System"
        contentstack = softwareSystem "Contentstack" "The Core CMS for the website" "External System"
        cooklist = softwareSystem "Cooklist" "The Core Recipe Management System" "External System"
        productHub = softwareSystem "Sellable Product Hub" "Products that are in a sellable state"
        customerCare -> refundFraud "Reports" "HTTPS/JSON"
        commerceTools -> contentstack "Sends Product Data" "HTTPS/JSON"
        commerceTools -> cooklist "Sends Product Data" "HTTPS/JSON"
        commerceTools -> algolia "Sends Product Data" "HTTPS/JSON"
    }
    views {
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