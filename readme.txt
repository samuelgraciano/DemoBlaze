DEMOBLAZE - PRUEBAS DE API CON KARATE

1. Objetivo

Probar los servicios de registro y autenticacion de DemoBlaze:
https://api.demoblaze.com/signup y https://api.demoblaze.com/login.

2. Requisitos

- JDK 25 instalado y disponible en JAVA_HOME y PATH. La ejecucion registrada
  en este proyecto se realizo con Java 25.
- Git  para clonar el repositorio, descargar Gradle y las
  dependencias de Maven Central y acceder a la API publica.
- Opcional: Postman para probar manualmente los comandos cURL incluidos.

No es necesario instalar Gradle: el proyecto incluye Gradle Wrapper.

3. Preparacion y ejecucion

1. Clonar el repositorio:

   git clone https://github.com/samuelgraciano/DemoBlaze.git

2. Entrar en la carpeta creada:

   cd DemoBlaze

3. Verificar Java:

   java -version

4. Ejecutar las pruebas desde la raiz del proyecto:

   En Windows (PowerShell):
   .\gradlew.bat test --rerun-tasks

   En Linux o macOS:
   ./gradlew test --rerun-tasks

   Si el sistema no permite ejecutar gradlew en Linux o macOS, ejecutar
   chmod +x gradlew y repetir el comando anterior.

La opcion --rerun-tasks fuerza una nueva ejecucion contra la API. Sin ella,
Gradle puede reutilizar resultados anteriores. La primera ejecucion puede tardar
mas mientras se descargan Gradle y las dependencias.

4. Resultados y reportes

- Abrir build/karate-reports/karate-summary.html para ver el reporte de Karate
  y entrar al detalle del feature.
- Abrir build/reports/tests/test/index.html para ver el reporte de Gradle/JUnit.
- La evidencia resumida de una ejecucion anterior esta en
  reportes/resumen-ejecucion.txt. Los reportes generados en build/ no se
  versionan y se recrean al ejecutar las pruebas.

Los reportes y logs locales pueden incluir las credenciales de prueba y el token
devuelto por el servicio. Usar exclusivamente datos de prueba y no compartir
reportes sin revisar su contenido.

5. Escenarios e insumos

- src/test/resources/features/demoblaze.feature: escenarios Karate, entradas y
  validaciones de las respuestas.
- src/test/java/org/demoBlaze/DemoBlazeApiTest.java: ejecutor Karate con JUnit.
- build.gradle.kts: dependencias y configuracion de Gradle.
- postman/curl-demoblaze.md: comandos para importar en Postman; seguir el orden
  indicado y cambiar el usuario de ejemplo por uno unico.
- conclusiones.txt: hallazgos y alcance de las pruebas.

Los escenarios crean usuarios de prueba con identificadores aleatorios en un
servicio publico real. Estos registros pueden permanecer en DemoBlaze. La
disponibilidad del servicio, la red y los cambios en su API pueden afectar el
resultado. El caso de credenciales incorrectas utiliza un usuario inexistente;
no verifica por separado una contrasena incorrecta para un usuario existente.
