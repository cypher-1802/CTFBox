FROM  ubuntu:22.04

WORKDIR /home

RUN mkdir Challenge1
RUN cd Challenge1
ADD challengeFile/* /home/Challenge1

ADD build.sh /bin
RUN chmod a+x /bin/build.sh
RUN /bin/build.sh
# CMD [ "/bin/build.sh" ]
