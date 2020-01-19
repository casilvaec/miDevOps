FROM jenkins/jenkins
#quite LTS

USER root
# La línea de comando que viene después, USER root otorga acceso de root a la imagen, que se utilizará durante la instalación de Docker CLI y Kubernetes CLI (kubectl).

ENV DOCKERVERSION=18.03.1-ce
#Establece una variable de entorno

RUN curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKERVERSION}.tgz \
  && tar xzvf docker-${DOCKERVERSION}.tgz --strip 1 \
                 -C /usr/local/bin docker/docker \
  && rm docker-${DOCKERVERSION}.tgz

 # La ANTERIOR línea de comando descarga Docker, instala la CLI de Docker y elimina el Docker Daemon:

 # Tenga en cuenta que la imagen de Jenkins mofidied no contiene Docker Daemon. Docker Daemon se ejecutará en otro contenedor y la imagen modificada de Jenkins se referirá a ese contenedor Docker Daemon. Echa un vistazo a Docker en Docker para obtener más información.

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
	&& chmod +x ./kubectl \
	&& mv ./kubectl /usr/local/bin/kubectl

# Lo ANTERIOR descarga la CLI de Kubernetes (kubectl) y la instala:





