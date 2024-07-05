## Fazendo deploy da imagem

Usaremos o Docker hub como "image registry", local onde é armazenado as imagens docker, e subiremos a imagem do projeto a partir do arquivo "Dockerfile" na raiz do projeto. 

### Fazendo build da imagem

```
docker build . -t <your_username>/picpay-simpleapp-python:v1.0.0 -t <your_username>/picpay-simpleapp-python:latest
```

Neste comando estamos construindo a imagem e guardando ela localmente. Além disso, estamos criando duas tags, uma `v1.0.0` e uma `latest`.

### Subindo a imagem no docker hub

Para subir a imagem no Docker hub é necessário estar logado em uma conta. Para isso, rode o comando:

```
docker login
```

Após realizar o login, será possível subir as imagens:

```
docker push -a <your_username>/picpay-simpleapp-python
```

Este comando será responsável por subir a imagem com todas suas tags no Docker hub.

