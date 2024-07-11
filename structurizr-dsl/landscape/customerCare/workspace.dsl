workspace extends ../system-landscape.dsl {
    configuration {
        scope softwaresystem
    }
    model {
        ccr = person "Customer Care Representative"  "The employee that services customer inquiries"

        !extend customerCare {
            !adrs adrs
            !docs docs
            ccr -> customerCare "Uses" "Web Browser"
        }
    }
    views {
        systemContext customerCare "CustomerCare-SystemContext" "The system context diagram for the Customer Care system" {
            include *
            autoLayout lr
        }

        container customerCare "CustomerCare-Containers" "The container diagram for the Customer Care system" {
            include *
            autoLayout lr
        }
    }
}