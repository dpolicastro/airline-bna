# Create the archive
composer archive create  -t dir -n ../ -a archive.bna

# Install the archive
composer network install -a ./archive.bna -c PeerAdmin@hlfv1

# Strart the network
composer network start -n airline_v8 -c PeerAdmin@hlfv1 -V 0.0.1 -A admin -S adminpw

# Use the card generated
composer card import -f admin@airline_v8.card