## What

`renew-letsencrypt.sh` => exactly what it says ...

`deploy_sinewyk_stuff.sh` => deploy my stuff

`install_wsl.sh` => when launching a clear instance of wsl, one step install script for everything I need (at least as most as possible)

## Refs

-   ### renew letsencrypt

Let's encrypt stuff ... I forgot the exact source, but this https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-16-04 and this should be sufficient to re-do it if necessary

```
server {
        listen 80;
        listen [::]:80;

        server_name www.sinewyk.com sinewyk.com;

        location /.well-known/acme-challenge {
                root /var/www/letsencrypt;
        }

        return  301 https://sinewyk.com$request_uri;
}
```

I should probably install properly certbot from debian packages ... and use the latest feature to do this cleanly => https://certbot.eff.org/lets-encrypt/debianstretch-nginx

Should rework to use `certbot(-auto) renew` to not hard fail and launch it more frequently

-   ### deploy script

Something I did some time ago while working at La Ruche Qui Dit Oui! when we still did handmade deployments, did the job. Never quite did the roll back even though it should just be making the symlink to a previous release
