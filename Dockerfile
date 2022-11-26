FROM openjdk:11
COPY ./src/main/java /usr/src/myapp
WORKDIR /usr/src/myapp
RUN javac java/DevOpsDemo/App.java
CMD ["java", "/DevOpsDemo"]