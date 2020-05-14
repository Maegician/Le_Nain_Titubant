<?php

$container->loadFromExtension('swiftmailer', [
    'default_mailer' => 'smtp_mailer',
    'mailers' => [
        'smtp_mailer' => [
            'url' => 'smtp://username:password@example.com:12345?transport=smtp&username=user&password=pass&host=example.org&port=23456&timeout=42&source_ip=127.0.0.1&local_domain=local.example.com&encryption=tls&auth_mode=login',
        ],
    ],
]);
