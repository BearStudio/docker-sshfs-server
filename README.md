# SSH server docker
## Pourquoi un serveur SSH
Ce container/serveur ssh permet de pouvoir partager notament des fichiers grace a un lien alternatif du lien ssh primaire a un serveur

## How to :

### Information du container
Utilisateur par défaut root (Pour faire fonctionner SSH correctement )
Utilisateur avec accès SSH "datashared"

### ENV

SSH_KEYS *Vos clé public RSA, elles seront copier dans /home/datashared/.ssh/.autorized_keys*

### Exemple théorique :
```
docker run -v /srv/myshareddata/:/home/datashared/data/ -p 45632:22 -e SSH_KEYS="" -d bearstudio/sshfs
```

### Exemple concret
```
docker run -v /srv/myshareddata/:/home/datashared/data/ -p 45632:22 -e SSH_KEYS="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDwnxayXZOnaspqwdUgCLftIpljJ7VQlB1xiH7oAqhV1S0NNCImobRH1JCdgD1LdJg4Z3yzWm21BZVzBe1lneQCg4iC7QxcqXkVuqOmww8oLO7YFmTqMhMmR4UBLYpxy8fSJgvMN3xLfiPQXNsEDMggehz2JEgIsUri/9Xv6LXuN1fvbBzcQybP0GE8DYeKY8YONlxm8qODIIUoch+t/gCkFNW9jQqDqoAznCqcii08hLtU1ba1okRhKj7RlFJ22PlVpcnrZQg3qpuaeiNctHmS6vaEviZywuaHPik0AFqx43lRzXCHSvCNsFBroYHINwYdO/ffuIbP/Mjs5LR+CA5P tibs@tibs-working" -d bearstudio/sshfs
```


### Connection au container avec sshfs

```
sshfs -o -p 45632 datashared@*serveraddress*:data/ myEmptyFolder/
```
