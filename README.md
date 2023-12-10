# mapup.ai assessment steps and instructions

1. **Initialize a GitHub Repository**
   - Start by creating an empty GitHub repository.

2. **Set Up Local Git Repository**
   - Create a local folder and initialize Git within it.

3. **Develop a Basic Flask App**
   - Create a simple Flask "Hello World" app.

4. **Manage Dependencies with requirements.txt**
   - Generate a `requirements.txt` file to manage Flask dependencies for pip.

5. **Create a Multistage Dockerfile**
   - Implement a multistage Dockerfile.

6. **Configure GitHub Actions**
   - Create a directory ".github/workflows" in the root and add a `main.yml` file in "./github/workflows/main.yml".

7. **Define Dockerfile Stages**
   - Specify build and final stages in the Dockerfile.

8. **Configure GitHub Actions for Docker Build and Push**
   - In the `main.yml` file, define necessary jobs for GitHub Actions to build and push the Flask image to AWS ECR.

9. **AWS IAM Custom Policy**
   - Open AWS IAM and create a custom policy for GitHub Actions.

```json
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "GetAuthorizationToken",
			"Effect": "Allow",
			"Action": [
				"ecr:GetAuthorizationToken"
			],
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Action": [
				"ecr:BatchGetImage",
				"ecr:BatchCheckLayerAvailability",
				"ecr:CompleteLayerUpload",
				"ecr:GetDownloadUrlForLayer",
				"ecr:InitiateLayerUpload",
				"ecr:PutImage",
				"ecr:UploadLayerPart"
			],
			"Resource": [
				"arn:aws:ecr:ap-south-1:554763319095:repository/mapup.ai"
			]
		}
	]
}
```

10. **Create AWS User and Attach Custom Policy**
    - Create a new user and attach the custom policy to it.

11. **Generate Access and Secret Keys**
    - Create Access and Secret Keys for the user.

12. **GitHub Repository Secrets**
    - Go to GitHub repo -> Settings -> New repository secrets, and save Access and Secret Keys.

13. **AWS ECR Setup**
    - In AWS ECR, create a private repository with vulnerability scanning enabled for image scans.

14. **Configure ECR Repository in GitHub Actions**
    - Mention the ECR repository name in `main.yml` for push by GitHub Actions.

15. **Test and Debug the Pipeline**
    - Test and debug the GitHub Actions pipeline by setting up the GitHub repository, committing, and pushing code to it.

16. **AWS ECS Service Setup**
    - In AWS ECS, create a service with rolling release update enabled, using the newly created image from the ECR private repository with the "latest" tag using its URI.

17. **Application Load Balancer Integration**
    - When setting up the ECS service, attach an Application Load Balancer to it.

18. **Proceed with ECS Service Creation**
    - Complete the creation of the ECS service.

19. **Check Deployment**
    - Obtain the DNS link of the load balancer and check the "Hello World!" output on your browser.

20. **Set up SNS notification for email for image push notifications**
    - (WIP)