FROM ubuntu
RUN apt-get update && apt-get install -y python
RUN echo 1.0 >> /etc/version && apt-get install -y git \
    && apt-get install -y iputils-ping
RUN mkdir /datos
WORKDIR /datos
RUN echo "Hola" > f1.txt

###ENV###
ENV dir=/data dir1=/data1
RUN mkdir $dir && mkdir $dir/$dir1
ENV TZ=Europe/Madrid
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ENV HOME=/etc

###ARG###
#ARG dir2
#RUN mkdir $dir2
#ARG user
#ENV user_docker $user
#ADD add_user.sh .
#RUN ./add_user.sh

###EXPOSE###
RUN apt-get install -y apache2
EXPOSE 80
ADD entrypoint.sh /datos

###VOLUME###


###CMD###
CMD /datos/entrypoint.sh

###ENTRYPOINT###
#ENTRYPOINT ["/bin/bash"]
