### 1. Crea mediante comandos de bash la siguiente jerarquía de ficheros y directorios

```bash
foo/
├─ dummy/
│  ├─ file1.txt
│  ├─ file2.txt
├─ empty/
```

Donde `file1.txt` debe contener el siguiente texto:

```bash
Me encanta la bash!!
```

Y `file2.txt` debe permanecer vacío.

```shell
vagrant@ubuntu-client:~$ mkdir -p foo/dummy
vagrant@ubuntu-client:~$ mkdir -p foo/empty
vagrant@ubuntu-client:~$ echo 'Me encanta la bash!!' > foo/dummy/file1.txt
vagrant@ubuntu-client:~$ cat foo/dummy/file1.txt
Me encanta la bash!!
vagrant@ubuntu-client:~$ touch foo/dummy/file2.txt
vagrant@ubuntu-client:~$ find foo/
foo/
foo/dummy
foo/dummy/file2.txt
foo/dummy/file1.txt
foo/empty
```

```shell
vagrant@ubuntu-client:~$ echo 'Me encanta la bash 2!!' > foo/dummy/file1.txt | touch foo/dummy/file2.txt
vagrant@ubuntu-client:~$ cat foo/dummy/file2.txt foo/dummy/file1.txt
Me encanta la bash 2!!
```