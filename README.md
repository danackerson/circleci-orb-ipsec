# circleci-orb-ipsec
To deploy from circleci thru an ipsec tunnel.

export CIRCLECI_CLI_TOKEN=xyz123
export IPSEC_IMG_VERSION=v2 // v2 is ipsec<->fritz.box -- OR --
export IPSEC_IMG_VERSION=v4 // v4 is wireguard<->blackpearl
## CHANGING:
`circleci orb publish orb.yml danackerson/ipsec@dev:<msg> --token <circleCI_API_Token>`

These @dev versions can be used but don't appear in the Orb registry.

## PUBLISHING:
`circleci orb publish promote danackerson/ipsec@dev:<msg> (major|minor|patch) --token <circleCI_API_Token>`

where <msg> is the SAME string as in the published CHANGE.

## USING:
If you've changed the Dockerfile, increment the [Global org-context variable IPSEC_IMG_VERSION](https://circleci.com/gh/organizations/danackerson/settings#contexts/7adccd70-f8d4-497c-954e-1ee4f6579096) to force the orb to rebuild & push that new docker image on subsequent project deploys.
