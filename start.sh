

echo "Starting Client..."
cd snapcast/client && make install && cd -

amixer sset 'PCM' 100% 
systemctl status snapclient
