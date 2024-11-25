#!/usr/bin/bash

# 인자가 하나가 아닌 경우 스크립트 종료
if [ "$#" -ne 1 ]; then
    echo "$0 [root_passwd]"
    exit 1
fi


my_passwd=$1
dir_path=$(dirname $(realpath $0))


# 각 하위 스크립트에 환경 변수 전달
export my_passwd

echo "[`date`] Time_Stamp : ssh-keygen auto Start...."

echo "[`date`] Time_Stamp : ansible 설치 Start...."
${dir_path}/ssh_keygen_auto_zero.sh
echo "[`date`] Time_Stamp : ansible 설치 End...."; echo "";


echo "[`date`] Time_Stamp : ssh-keygen 배포  Start...."
${dir_path}/ssh_keygen_auto_first.sh
echo "[`date`] Time_Stamp : ssh-keygen 배포  End...."; echo "";


echo "[`date`] Time_Stamp : /etc/hosts 만들기  Start...."
${dir_path}/hosts_set_auto.sh
echo "[`date`] Time_Stamp : /etc/hosts 만들기  End...."; echo "";


echo "[`date`] Time_Stamp : ssh-keygen scp_rsa_id  Start...."
${dir_path}/ssh_keygen_auto_second.sh
echo "[`date`] Time_Stamp : ssh-keygen scp_rsa_id  End...."; echo "";


echo "[`date`] Time_Stamp : authorized_keys 만들기  Start...."
${dir_path}/ssh_keygen_auto_three.sh
echo "[`date`] Time_Stamp : authorized_keys 만들기  End...."; echo "";


echo "[`date`] Time_Stamp : authorized_keys 모든서버 배포  Start...."
${dir_path}/ssh_keygen_auto_four.sh
echo "[`date`] Time_Stamp : authorized_keys 모든서버 배포  End...."; echo "";

echo "[`date`] Time_Stamp : ssh-keygen auto End...."
