class TyrePsi {
  final double psi;
  final int temp;
  final bool isLowPressure;

  TyrePsi({required this.psi, required this.temp, required this.isLowPressure});
}

final List<TyrePsi> demoPsiList = [
  TyrePsi(psi: 25.3, temp: 56, isLowPressure: true),
  TyrePsi(psi: 35.1, temp: 41, isLowPressure: false),
  TyrePsi(psi: 29.9, temp: 44, isLowPressure: false),
  TyrePsi(psi: 31.2, temp: 52, isLowPressure: false),
];