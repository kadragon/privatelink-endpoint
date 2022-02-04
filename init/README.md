### terraform backend

## :dart: About

테라폼의 .tfstate 파일을 s3에 저장해서, 상태를 공유하기 위해서 필요한 s3와 dynamodb를 생성하기 위함.

## :checkered_flag: Starting

```bash
# aws iam 계정 정보 설정
$ aws configure

# terraform 실행
$ terraform init
$ terraform plan
$ terraform apply
```
