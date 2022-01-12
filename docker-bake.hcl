group "default" {
    targets = ["v1", "v2"]
}

target "v1" {
    dockerfile = "Dockerfile"
    pull = true
    target = "awscliv1"
    tags = ["pwed/awscli:1"]
    platforms = ["linux/amd64", "linux/arm64", "linux/arm", "linux/arm/v7"]
    // platforms = ["linux/arm64", "linux/arm/v7"]
}

target "v2" {
    dockerfile = "Dockerfile"
    pull = true
    target = "awscliv2"
    tags = ["pwed/awscli:2", "pwed/awscli:latest"]
    platforms = ["linux/amd64", "linux/arm64", "linux/arm", "linux/arm/v7"]
    // platforms = ["linux/arm64", "linux/arm/v7"]
}