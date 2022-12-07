import 'package:flutter/cupertino.dart';

class TravelModel {
  String distance;
  String temp;
  String rating;
  String name;
  String location;
  String image;
  String description;
  String price;

  TravelModel(
      {required this.distance,
      required this.temp,
      required this.rating,
      required this.name,
      required this.location,
      required this.image,
      required this.description,
      required this.price});
}

List<TravelModel> travelList = [
  TravelModel(
      distance: "7km",
      temp: "30",
      rating: "5",
      name: "New York",
      location: "US.New York",
      image: "assets/images/New York.jpg",
      description: "NNNNNNNNNNNNNNNNNNNNNNNNNN",
      price: "3000"),
  TravelModel(
      distance: "14km",
      temp: "22",
      rating: "4",
      name: "Tehran",
      location: "Iran.Tehran",
      image: "assets/images/Tehran.jpg",
      description: "TTTTTTTTTTTTTTTTTTTTTTT",
      price: "600"),
  TravelModel(
      distance: "21km",
      temp: "26",
      rating: "4.6",
      name: "Paris",
      location: "France.Paris",
      image: "assets/images/Paris.jpg",
      description: "PPPPPPPPPPPPPPPPPPPPPPPPPPP",
      price: "2500"),
  TravelModel(
      distance: "28km",
      temp: "24",
      rating: "4.8",
      name: "Rome",
      location: "Italy.Rome",
      image: "assets/images/Rome.jpg",
      description: "RRRRRRRRRRRRRRRRRRRRRRRR",
      price: "4500"),
      
      
];