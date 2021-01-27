FROM dhaks/mule4.3.0

COPY /apiops-generic-db-sapi/target/*.jar /opt/mule/apps/

ENV key=mymulesoft

EXPOSE 8081

CMD [ "/opt/mule/bin/mule"]
