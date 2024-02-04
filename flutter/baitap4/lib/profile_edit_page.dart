import 'package:flutter/material.dart';
import 'package:personal_profile/profile.dart';

class ProfileEditPage extends StatefulWidget {
  final Profile profileEdit;

  const ProfileEditPage({super.key, required this.profileEdit});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final TextEditingController tenController = TextEditingController();
  final TextEditingController ngaySinhController = TextEditingController();
  final TextEditingController queQuanController = TextEditingController();
  final TextEditingController soThichController = TextEditingController();

  @override
  void initState() {
    super.initState();
    tenController.text = widget.profileEdit.hoTen;
    ngaySinhController.text = _textFromDate(widget.profileEdit.ngaySinh);
    queQuanController.text = widget.profileEdit.queQuan;
    soThichController.text = widget.profileEdit.soThich;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit My profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildTextField('Tên', tenController, false),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: buildTextField("Ngày sinh", ngaySinhController, true),
                  ),
                  TextButton(
                      onPressed: () async {
                        DateTime? selectedDate =
                            await _selectDate(widget.profileEdit.ngaySinh);
                        if (selectedDate != null) {
                          setState(() {
                            widget.profileEdit.ngaySinh = selectedDate;
                            ngaySinhController.text =
                                _textFromDate(selectedDate);
                          });
                        }
                      },
                      child: const Icon(
                        Icons.date_range,
                        color: Colors.blue,
                      ))
                ],
              ),
              const SizedBox(height: 15),
              buildTextField('Quê quán', queQuanController, false),
              const SizedBox(height: 15),
              buildTextField('Sở thích', soThichController, false),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                  onPressed: updateProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFe0e0e0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    elevation: 3,
                  ),
                  child: const Text(
                    "OK",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextField buildTextField(
      String label, TextEditingController controller, bool readOnly) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      maxLines: null, // để có thể nhập nhiều dòng trong TextField
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
      ),
    );
  }

  Future<DateTime?> _selectDate(DateTime ngaySinh) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: ngaySinh,
      firstDate: DateTime.now().subtract(const Duration(days: 365 * 50)),
      lastDate: DateTime.now().add(const Duration(days: 365 * 50)),
    );
    return pickedDate;
  }

  String _textFromDate(DateTime selectedDate) {
    return '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
  }

  void updateProfile() {
    //Khi nút OK được nhấn, hàm này sẽ được gọi. Nhiệm vụ của chúng ta
    //là phải làm sao đó để trang profile ban đầu nhận được các giá trị cập nhật
    //này. Đầu tiên, tạo một profile mới với các giá trị đã nhập vào, trường
    //hợp không có giá trị mới thì lấy lại giá trị cũ là được
    String ngaySinh=ngaySinhController.text;
    List<int> listFromNgaySinh =
    ngaySinh.split('/').map((e) => int.parse(e)).toList();

    Profile newProfile = Profile(
        hoTen: tenController.text,
        queQuan: queQuanController.text,
        ngaySinh: DateTime(
          listFromNgaySinh[2],
          listFromNgaySinh[1],
          listFromNgaySinh[0],
        ),
        soThich: soThichController.text,
        imageAssest: widget.profileEdit.imageAssest);

    //Giờ chúng ta sẽ trả về cái newProfile mới này
    Navigator.pop(context, newProfile);
  }
}
