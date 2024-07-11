workspace "Enterprise-Landscape"{
    configuration {
        scope landscape
    }
    model {
        customer = person "Customer" "A customer that uses our systems to purchase products"

        eCommerce = softwareSystem "eCommerce" "Allows customers to purchase products online"
        customerCare = softwareSystem "Customer Care" "Allows customers to view and manage their orders"
    }
    views {
        styles {

        }
    }
}