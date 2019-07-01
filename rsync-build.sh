#!/bin/bash

rsync -av --exclude '*/.git' --exclude '*/target' --exclude '*/dependency-reduced-pom.xml' --exclude '*/bin' --delete /vagrant/kamome-keycloak/ /usr/src/keycloak/
cd /usr/src/keycloak

export MAVEN_OPTS="-Xmx1024m -XX:MaxMetaspaceSize=512m"

mvn clean install -Pdistribution -DskipTests=true

cd /vagrant

cp -p /usr/src/keycloak/distribution/server-dist/target/keycloak-4.8.3.Final.tar.gz /vagrant
