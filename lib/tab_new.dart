import 'package:flutter/material.dart';
import 'package:tutorial_444/utils/popup.dart';
import '../tabswidgets/brand_input.dart';
import '../tabswidgets/cpu_dropdown.dart';
import '../tabswidgets/gpu_dropdown.dart';
import '../tabswidgets/ram_slider.dart';
import '../tabswidgets/weight_slider.dart';
import '../tabswidgets/screen_size_radio.dart';
import '../tabswidgets/is_hd_switch.dart';
import '../tabswidgets/is_installed_checkbox.dart';
import '../tabswidgets/date_picker.dart';
import 'laptop_details.dart';

class TabNew extends StatefulWidget {
  final Function(LaptopDetails)? onAdd;
  final Function(LaptopDetails)? onUpdate;
  final LaptopDetails? laptop;

  const TabNew({super.key, this.onAdd, this.onUpdate, this.laptop});

  @override
  State<TabNew> createState() => _TabNewState();
}

class _TabNewState extends State<TabNew> {
  final TextEditingController _brandController = TextEditingController();
  final ValueNotifier<String?> _cpuController = ValueNotifier<String?>(null);
  final ValueNotifier<String?> _gpuController = ValueNotifier<String?>(null);
  final ValueNotifier<double> _ramController = ValueNotifier<double>(0.0);
  final ValueNotifier<double> _massController = ValueNotifier<double>(0.0);
  final ValueNotifier<bool> _isHdSsdController = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _installedController = ValueNotifier<bool>(false);
  final TextEditingController _dateController = TextEditingController();

  String _selectScreen = '12 inch';

  @override
  void initState() {
    super.initState();
    if (widget.laptop != null) {
      _brandController.text = widget.laptop!.brand;
      _cpuController.value = widget.laptop!.cpu;
      _gpuController.value = widget.laptop!.gpu;
      _ramController.value = widget.laptop!.ram;
      _massController.value = widget.laptop!.mass;
      _isHdSsdController.value = widget.laptop!.isHdSsd;
      _installedController.value = widget.laptop!.isWindowsInstalled;
      _dateController.text = widget.laptop!.manufacturingDate;
      _selectScreen = widget.laptop!.screenSize;
    }
  }

  void _handleAddButton() {
    final laptopDetails = LaptopDetails(
      brand: _brandController.text,
      cpu: _cpuController.value,
      gpu: _gpuController.value,
      ram: _ramController.value,
      mass: _massController.value,
      screenSize: _selectScreen,
      isHdSsd: _isHdSsdController.value,
      isWindowsInstalled: _installedController.value,
      manufacturingDate: _dateController.text,
    );

    if (widget.laptop != null && widget.onUpdate != null) {
      widget.onUpdate!(laptopDetails);
      showMessagealert(context, "Laptop Saved: ${laptopDetails.brand}");
    } else if (widget.onAdd != null) {
      widget.onAdd!(laptopDetails);
      showMessagealert(context, "Laptop Saved: ${laptopDetails.brand}");
    }
    showMessagealert(context, "Laptop Saved: ${laptopDetails.brand}");

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              BrandInput(controller: _brandController),
              const Divider(),
              CpuDropdown(cpuController: _cpuController),
              const Divider(),
              GpuDropdown(gpuController: _gpuController),
              const Divider(),
              RamSlider(ramController: _ramController),
              const Divider(),
              WeightSlider(weightcontroller: _massController),
              const Divider(),
              const ScreenSizeRadio(),
              const Divider(),
              IsHdSwitch(isHdSsdController: _isHdSsdController),
              const Divider(),
              IsInstalledCheckbox(installedController: _installedController),
              const Divider(),
              DatePickerWidget(controller: _dateController),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: OutlinedButton(
                    onPressed: _handleAddButton,
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      side: WidgetStateProperty.all(
                        const BorderSide(
                          color: Colors.green,
                          width: 2.0,
                          style: BorderStyle.solid,
                        ),
                      ),
                      backgroundColor: WidgetStateProperty.all(Colors.white),
                      foregroundColor: WidgetStateProperty.all(Colors.green),
                    ),
                    child: const Text("ADD"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
