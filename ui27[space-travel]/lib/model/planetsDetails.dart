
import 'package:ui27/model/planetDetail.dart';
class PlanetDao {

  static final List<Planet> planets = [
    const Planet(
      id: "1",
      name: "Mars",
      location: "Milkyway Galaxy",
      distance: "54.6m Km",
      gravity: "3.711 m/s ",
      description: "Lorem ipsum...",
      image: "assets/mars.png",
      backImage: 'https://wallpapercave.com/wp/wp2461878.jpg',
    ),
    const Planet(
      id: "2",
      name: "Neptune",
      location: "Milkyway Galaxy",
      distance: "54.6m Km",
      gravity: "3.111 m/s ",
      description: "Lorem ipsum...",
      image: "assets/neptune.png",
      backImage: 'https://i.pinimg.com/236x/f1/b2/37/f1b2373f420bc53df1d47fb47b950a49--hd-desktop-neptune.jpg',
    ),
    const Planet(
      id: "3",
      name: "Moon",
      location: "Milkyway Galaxy",
      distance: "54.6m Km",
      gravity: "3.811 m/s ",
      description: "Lorem ipsum...",
      image: "assets/moon.png",
      backImage: 'https://wallpaperaccess.com/full/234234.jpg',
    ),
    const Planet(
      id: "4",
      name: "Earth",
      location: "Milkyway Galaxy",
      distance: "54.6m Km",
      gravity: "3.711 m/s ",
      description: "Lorem ipsum...",
      image: "assets/earth.png",
      backImage: 'https://wallpapershome.com/images/pages/pic_h/16639.jpg'
    ),
    const Planet(
      id: "5",
      name: "Mercury",
      location: "Milkyway Galaxy",
      distance: "54.6m Km",
      gravity: "3.711 m/s ",
      description: "Lorem ipsum...",
      image: "assets/mercury.png",
      backImage: 'https://cdn.wallpapersafari.com/52/21/9BzVvg.jpg'
    ),
  ];

  static Planet getPlanetById(id) {
    return planets
        .where((p) => p.id == id)
        .first;
  }
}