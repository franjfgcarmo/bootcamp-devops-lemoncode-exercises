const database = 'TopicstoreDb';
const collection = 'Topics';

// Create a new database.
use(database);

// Create a new collection.
db.createCollection(collection);

use('TopicstoreDb');

// Create a new document in the collection.
db.getCollection('Topics').insertOne({    
        "_id": ObjectId('5fa2ca6abe7a379ec4234883'),
        "TopicName" : "Contenedores"    
});

db.getCollection('Topics').insertOne({    
    "_id": ObjectId('5fa2ca6abe7a379ec4234885'),
    "TopicName" : "Contenedores 2"    
});