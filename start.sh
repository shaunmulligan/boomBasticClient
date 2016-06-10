

echo "Starting Client..."
cd snapcast/client && make install && cd -

systemctl status snapclient
