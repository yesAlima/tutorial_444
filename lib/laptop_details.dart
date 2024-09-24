class LaptopDetails {
  String brand;
  String? cpu;
  String? gpu;
  double ram;
  double mass;
  String screenSize;
  bool isHdSsd;
  bool isWindowsInstalled;
  String manufacturingDate;

  LaptopDetails({
    required this.brand,
    required this.cpu,
    required this.gpu,
    required this.ram,
    required this.mass,
    required this.screenSize,
    required this.isHdSsd,
    required this.isWindowsInstalled,
    required this.manufacturingDate,
  });
}
