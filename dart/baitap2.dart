class SinhVien {
  final String id, ten;
  final String? ngaySinh, que_Quan;

  SinhVien({required this.id, required this.ten, this.ngaySinh, this.que_Quan});

  @override
  String toString() {
    return "Student information: \n\tid: ${id}\n\tten: ${ten}\n\tngaySinh: ${ngaySinh}\n\tque_Quan: ${que_Quan}";
  }
}

class QL_SinhVien {
  final List<SinhVien> _sinhViens = [];

  void printAll() {
    _sinhViens.forEach((element) {
      print(element.toString());
    });
  }

  void add(SinhVien sv) {
    _sinhViens.add(sv);
  }

  bool edit(SinhVien currentSV, SinhVien newSV) {
    int index = _sinhViens.indexOf(currentSV);
    if (index != -1) {
      _sinhViens[index] = newSV;
      return true;
    }
    return false;
  }

  void delete(SinhVien sv) {
    _sinhViens.remove(sv);
  }
}

void main() {
  var danhSach_SV = QL_SinhVien();
  danhSach_SV.add(SinhVien(id: '611', ten: 'Tien'));
  danhSach_SV.add(SinhVien(
      id: '612', ten: 'Phuong', ngaySinh: '1-1-2001', que_Quan: 'Nha Trang'));

  danhSach_SV.printAll();
}
