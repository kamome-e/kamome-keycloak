#!/bin/bash

rsync -av --exclude '*/.git' --exclude '*/target' --exclude '*/dependency-reduced-pom.xml' --exclude '/kamome-keycloak/bin' --delete /vagrant/kamome-keycloak /usr/src/
cd /usr/src/kamome-keycloak

export MAVEN_OPTS="-Xmx1024m -XX:MaxMetaspaceSize=512m"

mvn clean install -Pdistribution -DskipTests=true

cd /vagrant

cp -p /usr/src/kamome-keycloak/distribution/server-dist/target/keycloak-4.8.3.Final.tar.gz /vagrant
