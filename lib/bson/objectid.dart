class ObjectId extends BsonObject{  
  Binary id;
  factory ObjectId(){
    Timestamp ts = new Timestamp(null,0);    
    return new ObjectId.fromSeconds(ts.seconds);
  }
  ObjectId.fromSeconds(int seconds): id=new Binary(12){
    id.writeInt(seconds,4,forceBigEndian:true);
    id.writeInt(Statics.MachineId,3);
    id.writeInt(Statics.Pid,2);    
    id.writeInt(Statics.nextIncrement,3,forceBigEndian:true);
  }  
  String toString()=>"ObjectId(${id.toHexString()})";
  get value() => id;
  int byteLength() => 12;
}