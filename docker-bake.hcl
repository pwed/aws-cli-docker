group "default" {
    targets = ["v1", "v2-amd64"]
}

target "v1" {
    dockerfile = "Dockerfile"
    pull = true
    target = "awscliv1"
    tags = ["pwed/awscli:1"]
    platforms = ["linux/amd64", "linux/arm64"]
}

target "v2-amd64" {
    dockerfile = "Dockerfile"
    pull = true
    target = "awscliv2-amd64"
    tags = ["pwed/awscli:2", "pwed/awscli:latest"]
    platforms = ["linux/amd64"]
}

// target "v2-arm64" {
//     dockerfile = "Dockerfile"
//     pull = true
//     target = "awscliv2-arm64"
//     tags = ["pwed/awscli:2", "pwed/awscli:latest"]
//     platforms = ["linux/arm64"]
// }