	#!/bin/bash/
create_ecr_repo() {
	local dotnet=$1
	local helm=$2
	aws ecr create-repository --repository-name $dotnet --region ap-northeast-1
	aws ecr create-repository --repository-name $helm --region ap-northeast-1
}
create_ecr_repo "$1" "$2"
