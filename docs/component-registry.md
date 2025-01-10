# Component registry
Register of avaialable components and dependencies between them. 

## Libraries
### Rest-operations-library
Git repository: https://github.com/GesPymes/rest-operation-library

**Active**: true 

### Commons-library
Git repository: https://github.com/GesPymes/commons-library

**Active**: true

### Authenticator-library
Git repository: https://github.com/GesPymes/authenticator-library

**Active**: true


## Services
### Customer-service
Git repository: https://github.com/GesPymes/customer-service

**Active**: true

### Employee-service
Git repository: https://github.com/GesPymes/employee-service

**Active**: true

### Authenticator-service
Git repository: https://github.com/GesPymes/authenticator-service

**Active**: true

### Job-service
Git repository: https://github.com/GesPymes/job-service

**Active**: true
#### Dependencies
- Customer-service
- Employee-service

### Invoice-service
Git repository: https://github.com/GesPymes/invoice-service

**Active**: true
#### Dependencies
- Job-service


## Batches
### Periodic-appointments-batch
Git repository: https://github.com/GesPymes/periodic-appoinments-batch

**Active**: true
#### Dependencies
- Authenticator-service
- Job-service

### Automatic-invoices-batch
Git repository: https://github.com/GesPymes/automatic-invoices-batch

**Active**: true
#### Dependencies
- Authenticator-service
- Invoice-service

## Databases
Git repository:https://github.com/GesPymes/gespyme-database

**Active**: true 

