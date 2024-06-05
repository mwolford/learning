//Models for Customer Care Tool
ccr = person "Customer Care Representative"

customerCare = softwareSystem "Customer Care System"
refundFraud = softwareSystem "Refund Fraud System"

ccr -> customerCare "Uses"