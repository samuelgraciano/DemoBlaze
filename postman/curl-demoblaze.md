# cURL para Postman: DemoBlaze Signup y Login

En Postman, selecciona **Import > Raw text**, pega un comando cURL y elige **Import**. Los ejemplos usan el mismo usuario para poder probar el registro, el duplicado y el login correcto. Si ese usuario ya existe, cambia `karate_postman_20261119_1937` por otro nombre único en los comandos 1, 2 y 3.

## 1. Crear un usuario

```bash
curl --location 'https://api.demoblaze.com/signup' --header 'Content-Type: application/json' --data-raw '{"username":"karate_postman_20261119_1937","password":"KaratePass123!"}'
```

Entrada: `username` y `password`. Respuesta esperada: HTTP `200` y cuerpo `""`.

## 2. Intentar crear el mismo usuario

Primero ejecuta el comando 1. Luego importa y ejecuta este comando, sin cambiar el usuario:

```bash
curl --location 'https://api.demoblaze.com/signup' --header 'Content-Type: application/json' --data-raw '{"username":"karate_postman_20261119_1937","password":"KaratePass123!"}'
```

Respuesta esperada: HTTP `200` y cuerpo `{"errorMessage":"This user already exist."}`.

## 3. Login con usuario y password correctos

Primero ejecuta el comando 1 para crear el usuario. Usa exactamente el mismo usuario y password:

```bash
curl --location 'https://api.demoblaze.com/login' --header 'Content-Type: application/json' --data-raw '{"username":"karate_postman_20261119_1937","password":"KaratePass123!"}'
```

Respuesta esperada: HTTP `200` y un cuerpo de texto con un `Auth_token`.

## 4. Login con credenciales incorrectas

```bash
curl --location 'https://api.demoblaze.com/login' --header 'Content-Type: application/json' --data-raw '{"username":"usuario_inexistente_postman_20261119_1937","password":"IncorrectPass123!"}'
```

Respuesta esperada: HTTP `200` y cuerpo `{"errorMessage":"User does not exist."}`.
