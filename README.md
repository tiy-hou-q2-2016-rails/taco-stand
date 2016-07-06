Taco Stand
==========

## API

`/api/tacos`
* Returns tacos
* meta is not returned yet

```
{
  tacos: [
    {id: 3, name: 'Taco'},
    {id: 5, name: 'Fish Taco'}
  ],
  meta: {
    current_page: 1,
    total_pages: 2
  }
}
```



`/api/tacos/:id`
* Returns specific taco

```
{

    "taco": {
        "id": 22,
        "name": "Beef Fajitas",
        "url": "http://localhost:3000/api/tacos/22",
        "photo_url": "http://grouchymuffin.com/wp-content/uploads/2013/05/lupe-tortillas-fajitas.jpg",
        "price": "$6.56",
        "price_in_cents": 656,
        "user": {
            "id": 7,
            "username": "bob"
        }
    }
}
```


### Create a Taco


POST `/api/tacos`

params = {
  taco: {
    name: "",
    price: "",
    photo_url: ""
  }
}
