workspace extends ../system-landscape.dsl {
    configuration {
        scope softwaresystem
    }
    model {

        !extend central-apim {
            apim = container "API Management" "The API Management System" "Azure API Management"{
                waf = component "Web Application Firewall" "The Web Application Firewall for the API Management System" "Azure WAF"
                gateway = component "Gateway" "The Gateway for the API Management System" "Azure Gateway"
                portal = component "Developer Portal" "The Developer Portal for the API Management System" "Azure Developer Portal"
            }
        }

    }
    views {
        systemcontext central-apim "Central-APIM-SystemContext" "The system context diagram for the Central APIM system" {
            include *
            autoLayout tb
        }
        container central-apim "Central-APIM-Containers" "The container diagram for the Central APIM system" {
            include *
            autoLayout lr
        }
        component apim "Central-APIM-Components" "The component diagram for the Central APIM system" {
            include *
            autoLayout lr
        }
    }
}