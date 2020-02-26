# Resumé de SQL

## Creer un table : 
```
CREATE TABLE entity (
    id INTEGER,
    name TEXT NOT NULL,
    jurisdiction TEXT,
    jurisdiction_description TEXT,
    company_type TEXT,
    address_id INTEGER,
    incorporation_date DATE,
    inactivation_date DATE,
    status TEXT,
    service_provider TEXT,
    country_codes TEXT,
    countries TEXT,
    source TEXT,
    PRIMARY KEY(id),
    FOREIGN KEY(address_id) REFERENCES address(id)
)
```

## Inserer donnees : 
```
INSERT INTO entity (
    id, 
    name, 
    jurisdiction, 
    jurisdiction_description, 
    incorporation_date
) VALUES (
    0, 
    'Une société', 
    'IMG', 
    'Le Pays 
    Imaginaire', 
    '2020-01-01'
);
```

## Jointures : 
```
SELECT entity.name, entity.jurisdiction, address.countries 
FROM entity 
JOIN address ON entity.id_address = address.id_address 
WHERE address.countries = 'HKG' 
LIMIT 100;
```

## Group By :
```
SELECT count(entity.id), entity.jurisdiction 
FROM entity 
JOIN address ON entity.id_address = address.id_address 
GROUP BY entity.jurisdiction 
ORDER BY count desc 
LIMIT 100;
```