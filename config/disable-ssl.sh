docker exec -it auth-server /bin/sh -c "cd /opt/jboss/keycloak/bin;
./kcadm.sh config credentials --server http://localhost:8082/auth --realm master --user admin;
./kcadm.sh update realms/master -s sslRequired=NONE";







