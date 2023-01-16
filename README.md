# ZenHR
ZenHR task

# To add admin user use rails console
- rails c
- User.create(Email: "Admin@test.com",password: "your password",role: "Admin")

# Job seekers through registration


# List of controllers Api

## Users
+ /api/auth/login **POST**
+ /api/auth/register **POST**

## Jobpost
+ /api/job_posts **GET**
+ /api/job_posts **POST**
+ /api/job_posts/:id **PUT**
+ /api/job_posts/:id **DELETE**

## JobApplication
+ /api/job_applications **GET**
+ /api/job_applications/:id **GET**
+ /api/job_applications **POST**
