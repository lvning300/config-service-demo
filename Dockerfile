FROM openjdk:8-jdk-alpine
RUN  apk update && apk upgrade && apk add netcat-openbsd
COPY run.sh /usr/bin
COPY target/config-service-demo-1.0.jar /usr/local
RUN chmod a+x /usr/bin/run.sh \
    && echo "http://mirrors.aliyun.com/alpine/v3.8/main/" > /etc/apk/repositories \
    && echo "https://mirrors.aliyun.com/alpine/v3.8/community/" >> /etc/apk/repositories \
    && apk update \
    && apk add --no-cache \
    && apk add tzdata \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone

RUN echo $JAVA_HOME
RUN cd /tmp/ && \
    wget "http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip" --header 'Cookie: oraclelicense=accept-securebackup-cookie' && \
    unzip jce_policy-8.zip && \
    rm jce_policy-8.zip && \
    yes |cp -v /tmp/UnlimitedJCEPolicyJDK8/*.jar /usr/lib/jvm/java-1.8-openjdk/jre/lib/security/

ENTRYPOINT ["/usr/bin/run.sh"]
