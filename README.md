# GrupoCastores
Prueba Tecnica - Evaluación Técnica de Programación Grupo Castores

# Proyecto de Gestión de Inventarios

Este es un proyecto de gestión de inventarios desarrollado con Spring Boot, Maven, Java, MySQL y otras tecnologías.

## Descripción

La aplicación permite a los administradores gestionar productos en el inventario de una empresa, registrar entradas y salidas de productos, y controlar el acceso a los distintos módulos según el rol de los usuarios.

## Tecnologías utilizadas

- **IDE utilizado**: Eclipse (versión 2021-03 o posterior)
- **Lenguaje de programación**: Java (versión 17)
- **DBMS utilizado**: MySQL (versión 8.0.28)
- **Servidor de base de datos**: XAMPP
- **Framework**: Spring Boot (versión 2.5.5)
- **Maven**: Para la gestión de dependencias.

## Configuración de la Base de Datos

1. **Usuario de la base de datos**:  
   Para este proyecto, se crea un usuario específico para conectarse a la base de datos.  
   - **Nombre de usuario**: `Castores`
   - **Contraseña**: `I(lV4VxmlVEhl.fJ`

2. **Crear la base de datos**:  
   Debes crear una base de datos llamada `castores_prueba` en MySQL.
   
   ```sql
   CREATE DATABASE;
   ```

3. **Configurar la conexión de la base de datos**:  
   En el archivo `src/main/resources/application.properties`, configura las credenciales de conexión a la base de datos:
   
   ```properties
   spring.datasource.url=jdbc:mysql://localhost:3306/castores_prueba
   spring.datasource.username=Castores
   spring.datasource.password=I(lV4VxmlVEhl.fJ
   spring.jpa.hibernate.ddl-auto=update
   ```

## Pasos para correr la aplicación

1. **Clonar el repositorio**:
   ```bash
   git clone https://github.com/Sebastian-Dev24/GrupoCastores
   ```

2. **Configurar MySQL**:
   - Asegúrate de tener MySQL instalado y configurado. Puedes utilizar XAMPP o instalar MySQL directamente.
   - Crea la base de datos `almacen_db` como se indica más arriba.

3. **Configurar la conexión de la base de datos**:
   Asegúrate de que las credenciales en el archivo `application.properties` coincidan con las de tu base de datos MySQL.

4. **Compilar y correr la aplicación**:
   - Abre el proyecto en Eclipse.
   - Ejecuta la aplicación con Maven desde Eclipse o en la terminal con el siguiente comando:
     ```bash
     mvn spring-boot:run
     ```

5. **Acceder a la aplicación**:
   Una vez la aplicación esté corriendo, abre tu navegador y ve a la siguiente URL:
   ```
   http://localhost:8080/login.html
   ```

6. **Iniciar sesión**:
   Accede con el usuario y contraseña configurados. Si no tienes uno, puedes crear usuarios desde el formulario de registro.

## Estructura del Proyecto

- **`src/main/java`**: Contiene todo el código fuente de la aplicación, incluyendo controladores, servicios y repositorios.
- **`src/main/resources`**: Contiene los archivos de configuración de la aplicación, como `application.properties` para la configuración de la base de datos.
- **`src/main/resources/static`**: Contiene los archivos estáticos como CSS, imágenes, y scripts.
- **`src/main/resources/templates`**: Contiene las vistas en formato Thymeleaf.

## Roles y Permisos

1. **Administrador**:
   - Puede ver y gestionar el inventario.
   - Puede agregar productos, dar de baja/reactivar productos, y ver el historial de movimientos.
   - No puede acceder al módulo para salida de productos.

2. **Almacenista**:
   - Puede ver el inventario y acceder al módulo para salida de productos.
   - No puede agregar productos ni modificar el historial de movimientos.

## Desarrollo Futuro

- Integración con otros sistemas para la gestión del inventario.
- Implementación de funcionalidades adicionales según las necesidades del negocio.

## Contribución

Si deseas contribuir a este proyecto, por favor, realiza un fork del repositorio y envía un pull request con tus mejoras.

## Licencia

Este proyecto está bajo la Licencia MIT. Consulta el archivo `LICENSE` para más detalles.
