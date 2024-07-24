# SSH Keygen 자동화 스크립트

## 사전 준비

필요한 패키지들을 설치합니다:

1. 각 서버에서 `root` 비밀번호 설정:
   ```sh
   sudo passwd root
   ```
2. 각 서버에서 패키지 목록을 업데이트:
   ```sh
   apt-get update -y
   ```
3. 각 서버에서 `expect` 패키지 설치:
   ```sh
   apt-get install expect -y
   ```
## 필수 준비
- **필수 셋팅**: `system_download.txt 파일 /data/work 하위에 위치 필수!!!!`

## 참조 파일

- **셋업 참조 파일**: `system_download.txt(/data/work 하위에 위치 필수!!!!)`
- **전체 파이프라인 스크립트**: `ssh_keygen_auto_proc.sh`

## 파이프라인 세부 설명

1. **`ssh_keygen_auto_zero.sh`**: 각 서버에 Ansible 설치
2. **`ssh_keygen_auto_first.sh`**: 각 서버에 `ssh-keygen` 배포
3. **`hosts_set_auto.sh`**: `/etc/hosts` 파일 생성 및 각 서버에 배포
4. **`ssh_keygen_auto_second.sh`**: 현재 서버의 `id_rsa.pub`를 `authorized_keys`로 리다이렉트 후 각 서버에 배포
5. **`ssh_keygen_auto_three.sh`**: 모든 서버의 `id_rsa.pub`를 `authorized_keys`로 리다이렉트하여 모든 서버의 키 정보를 담은 `authorized_keys` 파일 생성
6. **`ssh_keygen_auto_four.sh`**: 최종 생성된 `authorized_keys` 파일을 각 서버에 배포 후 완료

## 실행 방법

1. `ssh_keygen_auto_proc.sh` 스크립트를 실행하여 전체 파이프라인을 시작합니다.
   ```sh
   ./ssh_keygen_auto_proc.sh
   ```

## 파일 구조

- `system_download.txt`: 셋업 참조 파일
- `ssh_keygen_auto_proc.sh`: 전체 파이프라인 스크립트
- `ssh_keygen_auto_zero.sh`: Ansible 설치 스크립트
- `ssh_keygen_auto_first.sh`: SSH 키 생성 및 배포 스크립트
- `hosts_set_auto.sh`: `/etc/hosts` 파일 생성 및 배포 스크립트
- `ssh_keygen_auto_second.sh`: 현재 서버의 `id_rsa.pub`를 각 서버에 배포 스크립트
- `ssh_keygen_auto_three.sh`: 모든 서버의 키 정보를 담은 `authorized_keys` 파일 생성 스크립트
- `ssh_keygen_auto_four.sh`: 최종 `authorized_keys` 파일을 각 서버에 배포 스크립트

---

이 스크립트는 여러 서버 간 SSH 키를 자동으로 설정하고 배포하는 과정을 자동화 합니다.
