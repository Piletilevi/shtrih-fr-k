- json_kvitki_startshift.plp  
    Startshift:  
    Fiskalniku staatus muutub - 'vahetus alustatud'

- json_kvitki_insertcash.plp  
    Insertcash:  
    Tuleb välja tshekk sisestatud raha summaga ja operatsiooni nimega
    Ideaalis ka tagasiside BO'le raha sisestamise õnnestumise kohta, siis kirjutab BO selle ka oma aruandesse. Enne ei    kirjuta, kui on saanud kas kasutajalt või draiverilt tagasisidet.

- json_kvitki_sale.plp  
    Sale:  
    1. Trükitakse tshekk
    2. Eduka tsheki trükkimise järel trükitakse piletid

- json_kvitki_endshift.plp  
    Endshift:  
    1. Tuleb välja tshekk Z reportiga, e päeva lõpetamise aruandega
    2. Fiskalniku staatus muutub - 'vahetus lõpetatud'

