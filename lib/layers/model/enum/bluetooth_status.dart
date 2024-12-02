enum BluetoothStatus {
  scan('blue_state_scan'),
  connect('blue_state_connect'),
  inspection('blue_state_inspection'),
  scanError('blue_state_scanError'),
  connectError('blue_state_connectError'),
  unableError('blue_state_unableError'),
  inspectionError('blue_state_inspectionError'),
  stripError('blue_state_stripError'),
  cutoff('blue_state_cutoff');

  const BluetoothStatus(this.message);

  final String message;
}