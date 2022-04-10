import 'package:abhicreativefashion/Auth/real_database.dart';import 'package:abhicreativefashion/Common/Utils/Utils.dart';import 'package:abhicreativefashion/Ui/Screen/mobilePDF.dart';import 'package:flutter/material.dart';import 'package:syncfusion_flutter_pdf/pdf.dart';class ActiveScreen extends StatefulWidget {  const ActiveScreen({Key? key}) : super(key: key);  @override  State<ActiveScreen> createState() => _ActiveScreenState();}class _ActiveScreenState extends State<ActiveScreen> {  RealDatabase realDatabase = RealDatabase();  bool on = true;  DateTime _dateTime = DateTime.now();  @override  Widget build(BuildContext context) {    return Scaffold(      appBar: AppBar(        automaticallyImplyLeading: false,        foregroundColor: on ? Colors.green : Colors.red,        backgroundColor: Colors.white,        title: Text(on ? "Active Order" : "Return Order"),        actions: [          GestureDetector(            onTap: () {              setState(() {                on = !on;              });            },            child: Icon(              on ? Icons.flash_on_rounded : Icons.assignment_return_outlined,              size: 30,            ),          ),          const SizedBox(width: 15),        ],      ),      floatingActionButton: FloatingActionButton(        onPressed: () async {          final DateTime? _dateTime1 = await buildShowDatePicker(context);          setState(() {            _dateTime = _dateTime1!;            print("===============${_dateTime}==============11");          });          realDatabase.ReadDataFilter(              "${_dateTime.day}-${_dateTime.month}-${_dateTime.year}");        },        backgroundColor: on ? Colors.green : Colors.red,        child: const Icon(Icons.date_range),      ),      body: on          ? StreamBuilder(              stream: _dateTime == true                  ? realDatabase.ReadData()                  : realDatabase.ReadDataFilter(                      "${_dateTime.day}-${_dateTime.month}-${_dateTime.year}"),              builder: (context, AsyncSnapshot snapshot) {                if (snapshot.hasData) {                  if (snapshot.data.snapshot.value != null) {                    Map map = snapshot.data.snapshot.value;                    List l1 = [];                    map.forEach(                      (key, value) {                        l1.add({"key": key, ...value});                      },                    );                    return SizedBox(                      height: MediaQuery.of(context).size.height,                      child: ListView.builder(                        physics: const BouncingScrollPhysics(),                        itemCount: l1.length,                        itemBuilder: (context, index) {                          return Padding(                            padding: const EdgeInsets.symmetric(                              horizontal: 10.0,                              vertical: 15.0,                            ),                            child: Row(                              children: [                                Card(                                  elevation: 3,                                  clipBehavior: Clip.antiAlias,                                  shadowColor: Colors.redAccent,                                  child: Container(                                    margin: const EdgeInsets.symmetric(                                      horizontal: 10.0,                                      vertical: 8.0,                                    ),                                    child: Text('${index + 1}'),                                  ),                                ),                                Card(                                  elevation: 3,                                  clipBehavior: Clip.antiAlias,                                  shadowColor: Colors.redAccent,                                  color: Colors.white,                                  child: Container(                                    margin: const EdgeInsets.symmetric(                                      horizontal: 10.0,                                      vertical: 8.0,                                    ),                                    width: Utils.getWidth(context) * 0.5,                                    child: Row(                                      crossAxisAlignment:                                          CrossAxisAlignment.start,                                      children: [                                        Column(                                          crossAxisAlignment:                                              CrossAxisAlignment.start,                                          children: [                                            Text(                                              "${l1[index]['Barcode Type']}",                                              style: const TextStyle(                                                  color: Colors.black,                                                  fontWeight: FontWeight.bold),                                            ),                                            Text(                                              "${l1[index]['Data']}",                                              style: const TextStyle(                                                  color: Colors.red),                                            ),                                          ],                                        ),                                        const Expanded(                                          child: SizedBox(),                                        ),                                        Column(                                          crossAxisAlignment:                                              CrossAxisAlignment.end,                                          children: [                                            Text(                                              "${l1[index]['DateTime']}",                                              style: const TextStyle(                                                color: Colors.black,                                                fontWeight: FontWeight.bold,                                                fontSize: 10,                                              ),                                            ),                                            Text(                                              "${l1[index]['Time']}",                                              style:                                                  const TextStyle(fontSize: 10),                                            ),                                          ],                                        ),                                      ],                                    ),                                  ),                                ),                                GestureDetector(                                  onTap: () {                                    realDatabase.DeleteData(l1[index]['key']);                                  },                                  child: Card(                                    elevation: 3,                                    clipBehavior: Clip.antiAlias,                                    shadowColor: Colors.redAccent,                                    child: Container(                                      margin: const EdgeInsets.symmetric(                                          horizontal: 10.0, vertical: 8.0),                                      child: const Icon(Icons.delete),                                    ),                                  ),                                ),                                GestureDetector(                                  onTap: () {                                    _creatPDF(                                      '${l1[index]['Barcode Type']}',                                      '${l1[index]['Data']}',                                    );                                  },                                  child: Card(                                    elevation: 3,                                    clipBehavior: Clip.antiAlias,                                    shadowColor: Colors.redAccent,                                    child: Container(                                      margin: const EdgeInsets.symmetric(                                          horizontal: 10.0, vertical: 8.0),                                      child: const Icon(                                          Icons.picture_as_pdf_outlined),                                    ),                                  ),                                ),                              ],                            ),                          );                        },                      ),                    );                  }                } else if (snapshot.hasError) {                  return const Center(                    child: CircularProgressIndicator(                      color: Colors.red,                    ),                  );                }                return const Center(                  child: Text(                    "😒 Recode NotFound 😒",                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),                  ),                );              },            )          : StreamBuilder(              stream: _dateTime == true                  ? realDatabase.Read1Data()                  : realDatabase.Read1DataFilter(                      "${_dateTime.day}-${_dateTime.month}-${_dateTime.year}"),              builder: (context, AsyncSnapshot snapshot) {                if (snapshot.hasData) {                  if (snapshot.data.snapshot.value != null) {                    Map map = snapshot.data.snapshot.value;                    List l1 = [];                    map.forEach(                      (key, value) {                        l1.add({"key": key, ...value});                      },                    );                    return SizedBox(                      height: MediaQuery.of(context).size.height,                      child: ListView.builder(                        itemCount: l1.length,                        itemBuilder: (context, index) {                          return Padding(                            padding: const EdgeInsets.symmetric(                              horizontal: 10.0,                              vertical: 15.0,                            ),                            child: Row(                              children: [                                Card(                                  elevation: 3,                                  clipBehavior: Clip.antiAlias,                                  shadowColor: Colors.redAccent,                                  child: Container(                                    margin: const EdgeInsets.symmetric(                                      horizontal: 10.0,                                      vertical: 8.0,                                    ),                                    child: Text('${index + 1}'),                                  ),                                ),                                Card(                                  elevation: 3,                                  clipBehavior: Clip.antiAlias,                                  shadowColor: Colors.redAccent,                                  color: Colors.white,                                  child: Container(                                    margin: const EdgeInsets.symmetric(                                      horizontal: 10.0,                                      vertical: 8.0,                                    ),                                    width: Utils.getWidth(context) * 0.5,                                    child: Row(                                      crossAxisAlignment:                                          CrossAxisAlignment.start,                                      children: [                                        Column(                                          crossAxisAlignment:                                              CrossAxisAlignment.start,                                          children: [                                            Text(                                              "${l1[index]['Barcode Type']}",                                              style: const TextStyle(                                                  color: Colors.black,                                                  fontWeight: FontWeight.bold),                                            ),                                            Text(                                              "${l1[index]['Data']}",                                              style: const TextStyle(                                                  color: Colors.red),                                            ),                                          ],                                        ),                                        const Expanded(                                          child: SizedBox(),                                        ),                                        Column(                                          crossAxisAlignment:                                              CrossAxisAlignment.end,                                          children: [                                            Text(                                              "${l1[index]['DateTime']}",                                              style: const TextStyle(                                                color: Colors.black,                                                fontWeight: FontWeight.bold,                                                fontSize: 10,                                              ),                                            ),                                            Text(                                              "${l1[index]['Time']}",                                              style:                                                  const TextStyle(fontSize: 10),                                            ),                                          ],                                        ),                                      ],                                    ),                                  ),                                ),                                GestureDetector(                                  onTap: () {                                    realDatabase.Delete1Data(l1[index]['key']);                                  },                                  child: Card(                                    elevation: 3,                                    clipBehavior: Clip.antiAlias,                                    shadowColor: Colors.redAccent,                                    child: Container(                                      margin: const EdgeInsets.symmetric(                                          horizontal: 10.0, vertical: 8.0),                                      child: const Icon(Icons.delete),                                    ),                                  ),                                ),                                GestureDetector(                                  onTap: () {                                    _creatPDF(                                      '${l1[index]['Barcode Type']}',                                      '${l1[index]['Data']}',                                    );                                  },                                  child: Card(                                    elevation: 3,                                    clipBehavior: Clip.antiAlias,                                    shadowColor: Colors.redAccent,                                    child: Container(                                      margin: const EdgeInsets.symmetric(                                          horizontal: 10.0, vertical: 8.0),                                      child: const Icon(                                          Icons.picture_as_pdf_outlined),                                    ),                                  ),                                ),                              ],                            ),                          );                        },                      ),                    );                  }                } else if (snapshot.hasError) {                  return const Center(                    child: CircularProgressIndicator(                      color: Colors.red,                    ),                  );                }                return const Center(                  child: Text(                    "😒 Recode NotFound 😒",                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),                  ),                );              },            ),    );  }  Future<void> _creatPDF(String code, String data) async {    PdfDocument document = PdfDocument();    PdfGrid grid = PdfGrid();    grid.columns.add(count: 3);    grid.headers.add(1);    PdfGridRow header = grid.headers[0];    header.cells[0].value = 'No';    header.cells[1].value = 'Code';    header.cells[2].value = 'Data';    PdfGridRow row = grid.rows.add();    row.cells[0].value = '1';    row.cells[1].value = code;    row.cells[2].value = data;    grid.style = PdfGridStyle(      cellPadding: PdfPaddings(left: 2, right: 3, top: 4, bottom: 5),      textBrush: PdfBrushes.black,      font: PdfStandardFont(        PdfFontFamily.timesRoman,        25,      ),    );    grid.draw(      page: document.pages.add(),      bounds: const Rect.fromLTWH(0, 0, 0, 0),    );    List<int> bytes = document.save();    document.dispose();    saveAndLaunchFile(bytes, 'Abhi Fashion.PDF');  }  Future<DateTime?> buildShowDatePicker(BuildContext context) => showDatePicker(      context: context,      initialDate: _dateTime,      builder: (context, child) {        return Theme(          data: Theme.of(context).copyWith(            colorScheme: ColorScheme.light(              primary: on ? Colors.green : Colors.red,              onPrimary: Colors.white,              onSurface: Colors.black,            ),            backgroundColor: on ? Colors.green : Colors.red,            textButtonTheme: TextButtonThemeData(              style: TextButton.styleFrom(                primary: Colors.white,                backgroundColor: on ? Colors.green : Colors.red,                textStyle: const TextStyle(                  fontSize: 16,                  fontWeight: FontWeight.bold,                ),              ),            ),          ),          child: child!,        );      },      firstDate: DateTime(2020),      lastDate: DateTime.now());}