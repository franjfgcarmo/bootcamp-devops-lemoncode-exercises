### 2. Crear un usuario nuevo y probar que no puede acceder al proyecto anteriormente creado - OBLIGATORIO

* Añadirlo con el role `guest`, comprobar que acciones puede hacer.
* Cambiar a role `reporter`, comprobar que acciones puede hacer.
* Cambiar a role `developer`, comprobar que acciones puede hacer.
* Cambiar a role `maintainer`, comprobar que acciones puede hacer.

Acciones a probar:

* Commit
* Ejecutar pipeline manualmente
* Push and pull del repo
* Merge request
* Acceder a la administración del repo

### Solución

#### Role guest.
![alt text](image-2.png)

- Commit. **Si permite**
- Push and pull.** No me ha permitido **
![alt text](image.png)
- Merge request. **No aparece el botón para crear pull request**
- Acceder a la administración del repo. **Sólo permite consultarlo**
- Pipeline. **No aparece la opción para lanzar una pipeline.**

![opciones](guest.gif)


#### Role reporter.
![alt text](image-1.png)

- Commit. **Si permite**
- Push and pull. **No me ha permitido** 
![alt text](image-3.png)
- Merge request. **No aparece el botón para crear pull request**
- Acceder a la administración del repo. **Sólo permite consultarlo**
- Pipeline. **No aparece la opción para lanzar una pipeline.**

![opciones](reporter.gif)

#### Role developer.
![alt text](image-4.png)

 - Commit. **Si permite**
 - Push and pull del repo. **Si permite**

 ![alt text](image-5.png)
 ![alt text](image-6.png)

 - Ejecutar pipeline manualmente. **Se puede lanzar una nueva pipeline**
 - Merge request. **Se puede crear.**
 - Acceder a la administración del repo.**Sólo permite consultarlo**
![opciones](developer.gif)

#### Role maintainer.
![alt text](image-7.png)

 - Commit
 - Push and pull del repo
 
![alt text](image-8.png)

- Ejecutar pipeline manualmente. **Se puede lanzar**
- Merge request. **Se pueden crear pull request**
- Acceder a la administración del repo. **Permite agregar usuario y también acceder a los Setting**
![opciones](maintainer.gif)