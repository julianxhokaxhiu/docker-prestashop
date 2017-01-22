# docker-prestashop
PHP Docker for Prestashop on Steroids

## Goal

This Docker should serve as a starting point for self-hosting a personal Prestashop 1.6.x installation.

## What is included?

* Apache + PHP 5.6 + VOLUME ( thanks to https://hub.docker.com/_/php/ )
* Some PHP extensions enabled ( see below )
* Apache mod_rewrite enabled

## Which PHP extensions come pre-loaded?

```php
// print_r( get_loaded_extensions() );

Array()
```

## License
See [LICENSE](LICENSE)
