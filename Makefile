pubkeys = ssh/id_rsa_cardno_000605020338.pub \
           ssh/id_rsa_cardno_000606151210.pub \
           ssh/id_rsa_cardno_000606901726.pub

all: index.html authorized_keys

index.html : README.md
	pandoc README.md --template=templates/index-template.html5 \
		--metadata='pagetitle="breed.org Crypto Infrastructure"' \
		-t html5 -s -o index.html

authorized_keys: $(pubkeys)
	cat $(pubkeys) > authorized_keys
