ssh_pubkeys = ssh/id_rsa_cardno_000605020338.pub \
              ssh/id_rsa_cardno_000606901726.pub \
              ssh/id_rsa_cardno_000610333243.pub \
              ssh/id_rsa_cardno_000610333976.pub

ca_certs = tls/ca-int-vault.pem \
           tls/ca-int-ipa.pem \
           tls/ca-root-2.pem

all: index.html authorized_keys

index.html : README.md
	pandoc README.md --template=templates/index-template.html5 \
		--metadata='pagetitle="breed.org Crypto Infrastructure"' \
		-t html5 -s -o index.html

authorized_keys: $(ssh_pubkeys)
	cat $(ssh_pubkeys) > authorized_keys

local_cacerts.pem: $(ca_certs)
	cat $(ca_certs) > local_cacerts.pem
