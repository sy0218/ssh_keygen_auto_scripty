# ssh_keygen 자동화 스크립트

사전 준비( 필요 패키지 설치 )
- 각 서버 sudo passwd root
- 각 서버 apt-get update -y
- 각 서버 apt-get install expect -y

셋업 참조 파일 : system_download.txt
전체 파이프 라인 스크립트 : ssh_keygen_auto_proc.sh

파이프 라인 세부 설명
1. ssh_keygen_auto_zero.sh >>> 각 서버 ansible 설치
2. ssh_keygen_auto_first.sh >>> 각 서버 ssh-keygen 배포
3. hosts_set_auto.sh >>> Create /etc/hosts and 각 서버 배포 
4. ssh_keygen_auto_second.sh >>> 현재 서버 id_rsa.pub를 authorized_keys 리다이렉트후 anthorized_keys 각 서버 배포
5. ssh_keygen_auto_three.sh >>> 모든 서버의 id_rsa.pub를 authorized_keys로 리다이렉트 하여 모든 서버  키정보를 담은 authorized_keys Create
6. ssh_keygen_auto_four.sh >>> 최종 생성된 authorized_keys 각 서버에 배포 후 완료!!!!
