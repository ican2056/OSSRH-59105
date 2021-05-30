USER_NAME='zhangsan'
useradd -g 'WWW' $USER_NAME
echo "Abc123" | passwd $USER_NAME --stdin
