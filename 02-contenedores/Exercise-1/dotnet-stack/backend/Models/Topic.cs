using MongoDB.Bson.Serialization.Attributes;
using MongoDB.Bson;

namespace backend.Models
{
    public class Topic
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string Id { get; set; }

        [BsonElement("TopicName")]
        public string TopicName { get; set; }
    }
}
