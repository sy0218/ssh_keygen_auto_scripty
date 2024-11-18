#!/usr/bin/bash

dir_path=$(dirname $(realpath $0))

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
