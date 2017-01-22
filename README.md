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

Array
(
    [0] => Core
    [1] => date
    [2] => ereg
    [3] => libxml
    [4] => openssl
    [5] => pcre
    [6] => sqlite3
    [7] => zlib
    [8] => ctype
    [9] => curl
    [10] => dom
    [11] => fileinfo
    [12] => filter
    [13] => ftp
    [14] => hash
    [15] => iconv
    [16] => json
    [17] => mbstring
    [18] => SPL
    [19] => PDO
    [20] => session
    [21] => posix
    [22] => Reflection
    [23] => standard
    [24] => SimpleXML
    [25] => pdo_sqlite
    [26] => Phar
    [27] => tokenizer
    [28] => xml
    [29] => xmlreader
    [30] => xmlwriter
    [31] => mysqlnd
    [32] => apache2handler
    [33] => apcu
    [34] => gd
    [35] => imagick
    [36] => intl
    [37] => mcrypt
    [38] => memcached
    [39] => mysql
    [40] => pdo_mysql
    [41] => soap
    [42] => zip
    [43] => apc
    [44] => Zend OPcache
)
```

## License
See [LICENSE](LICENSE)
