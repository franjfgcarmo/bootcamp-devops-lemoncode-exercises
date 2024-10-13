### 2. Mediante comandos de bash, vuelca el contenido de file1.txt a file2.txt y mueve file2.txt a la carpeta empty

El resultado de los comandos ejecutados sobre la jerarquía anterior deben dar el siguiente resultado.

```bash
foo/
├─ dummy/
│  ├─ file1.txt
├─ empty/
  ├─ file2.txt
```

Donde `file1.txt` y `file2.txt` deben contener el siguiente texto:

```bash
Me encanta la bash!!
```

### Solución: 

```shell
vagrant@ubuntu-client:~$ cat foo/dummy/file1.txt > foo/dummy/file2.txt
vagrant@ubuntu-client:~$ cat foo/dummy/file1.txt foo/dummy/file2.txt
Me encanta la bash!!
Me encanta la bash!!

vagrant@ubuntu-client:~$ mv foo/dummy/file2.txt foo/empty/
vagrant@ubuntu-client:~$ find foo/
foo/
foo/dummy
foo/dummy/file1.txt
foo/empty
foo/empty/file2.txt
```