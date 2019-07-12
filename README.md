# circleci-orb-ipsec
To deploy from circleci thru an ipsec tunnel.

## CHANGING:
`circleci orb publish orb.yml danackerson/ipsec@dev:<msg>`

These @dev versions can be used but don't appear in the Orb registry.

## PUBLISHING:
`circleci orb publish promote danackerson/ipsec@dev:<msg> patch`

where <msg> is the SAME string as in the published CHANGE.