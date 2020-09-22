#!/usr/bin/env bash
if [ ! -f /etc/httpd/conf.d/custom.conf ]; then

cat <<EOF > /etc/httpd/conf.d/custom.conf
<Directory /var/www/html/public>
    AllowOverride all
</Directory>

<IfModule headers_module>
    Header append X-Frame-Options SAMEORIGIN
</IfModule>

SetEnv TYPO3_CONTEXT Production
#SetEnv TYPO3_CONTEXT Development
EOF

    chmod 644 /etc/httpd/conf.d/custom.conf
    systemctl reload httpd
fi
