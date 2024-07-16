workspace "Enterprise-Landscape"{
    configuration {
        scope landscape
    }
    model {
        customer = person "Customer" "A customer that uses our systems to purchase products"
        csr = person "Customer SErvices Rep" "A customer service representative that uses our systems to manage customer orders"

        !include eCommerce/models/eCommerce.dsl
        !include customerCare/models/customerCare.dsl
        !include central-apim/models/central-apim.dsl


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