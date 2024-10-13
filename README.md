# rsschool-devops-course-tasks

Public repository `rsschool-devops-course-tasks` was created to pass the AWS DevOps course by RSSchool and have the single source of truth for all up and running AWS resources and additional settings.
As of now project has next directories and files:
1. Directory `tf_init` is used to create S3 bucket to save Terraform state for all other AWS resources. Make `terraform init/plan/apply` into this directory on your local system to deploy S3 bucket and then use bucket name to specify it into `backend.tf` file into `tf_resources` directory. Terraform state for this setup will be saved on your local storage into the same directory.
**Important note!** Strongly recommended - be careful with this S3 bucket and .tfstate files into it and don't delete them due to it will impact the Terraform state for all the infrastructure created via `tf_resource` directory.
2. Directory `tf_resources` is used to create all the rest resources of project. It's necessary to specify S3 bucket name from `tf_init` directory for `backend.tf` file and make `terraform init/plan/apply` into this directory on your local system to deploy the compulsory resources for GitHub actions workflow. After these actions you can manage your infrastructure by pushing code into feature branches or creating PRs into default branch (`main`).
3. Directory `.github/workflows` contains `tf_deployment.yaml` file to describe jobs which should be executed automatically by GitHub actions after pushing or creating of PRs for dedicated branches.
4. File `.gitignore` contains the names or masks of files and directories which should be ignored by Git.
5. File `README.md` contains the documentation of the project to setup and manage infrastructure correctly.


## Task 2
https://github.com/rolling-scopes-school/tasks/blob/master/devops/modules/1_basic-configuration/task_2.md

During this task dedicated VPC with public and private subnets in both us-east-1a and us-east-1b AZs were created.

Instances from public subnets are publicly accessible from world by HTTP/HTTPS via public IPs. They use Internet Gateway to reach resources out of VPC. Also they are accessible by SSH only within VPC (you can use bastion host to reach them from your personal IP).

Instances from private subnets are not publicly accessible. They use NAT Gateway to reach resources out of VPC. Since they are located into private subnets they are accessible by HTTP/HTTPS or SSH only within VPC (you can use bastion host to reach them from your personal IP).

You can review all the screenshots and details into PR to Task 2: https://github.com/shall-it/rsschool-devops-course-tasks/pull/2

**Important note!** Strongly recommended - destroy all instances and NAT Gateway especially when you don't need them to save your money since these resources are most expensive!