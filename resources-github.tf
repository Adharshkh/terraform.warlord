resource "github_repository" "github-repo-1" {
  name        = "terraform-demo-1"
  description = "This repo is for aws_pipeline-testing-only"

  visibility = "public"
}
