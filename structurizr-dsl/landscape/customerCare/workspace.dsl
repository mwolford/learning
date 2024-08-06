workspace extends ../system-landscape.dsl {
    configuration {
        scope softwaresystem
    }
    model {
        
        !extend customerCare {
            !adrs adrs
            !docs docs
            ccr -> customerCare "Uses" "Web Browser"
            
        }
        customerCare -> newSystem "Uses" "HTTPS/JSON"
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