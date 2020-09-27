class Need {
  String plan, checkout,appointment,link;
  Need({
    this.plan,
    this.checkout,
    this.appointment,
    this.link,
  });

  Map<String, dynamic> tomap(){
    return{
      "name":this.plan,
      "title":this.checkout,
      "type":this.appointment,

    };
  }
}