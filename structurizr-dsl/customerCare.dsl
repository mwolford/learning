workspace "CustomerCare" {
    configuration {
        scope softwaresystem
    }
    model {
        ccr = person "Customer Care Representative"  "The employee that services customer inquiries"

        customerCare = softwareSystem "Customer Care System" "The system that manages customer inquiries"
        refundFraud = softwareSystem "Refund Fraud System" "The system that manages refund fraud" 

        ccr -> customerCare "Uses" "Web Browser"
        customerCare -> refundFraud "Reports" "HTTPS/JSON"
    }
    views {
        systemContext customerCare {
            include *
            autoLayout lr
        }
        styles {
            !include style/team-standards.style
        }
    }
    
}