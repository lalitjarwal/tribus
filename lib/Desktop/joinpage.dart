//import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:tribus/constants.dart';

class JoinPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.all(28),
            color: kWhiteColor,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'Join Us Today!',
                    style: TextStyle(
                      color: kBlueColor,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'We are searching for aspiring minds. If you are one of those then \nfeel free to ask us.',
                    style: TextStyle(
                      color: kBlueColor,
                      fontSize: 19,
                    ),
                  ),
                ),
                MaterialButton(
                  shape: StadiumBorder(),
                  color: kBlueColor,
                  onPressed: () {
                    showGeneralDialog(
                        barrierDismissible: true,
                        barrierLabel: 'Dissmissed',
                        context: context,
                        pageBuilder: (ctx, anim1, anim2) {
                          return JoinForm(formKey: _formKey);
                        });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 12.0),
                    child: Text(
                      'Join Us',
                      style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            )),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      'https://image.freepik.com/free-vector/hiring-employment-concept-employee-coming-office-job-interview-recruit-manager-meeting-him-empty-vacant-workplace-employment-vacancy-recruitment-topics_179970-2125.jpg',
                    ))),
            child: null,
          ),
        ),
      ],
    );
  }
}

class JoinForm extends StatefulWidget {
  const JoinForm({
    Key key,
    @required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  _JoinFormState createState() => _JoinFormState();
}

class _JoinFormState extends State<JoinForm> {
  final _resumeController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  @override
  void dispose() {
    _resumeController.dispose();
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 8.0,
      child: Container(
        padding: const EdgeInsets.all(29),
        width: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.height / 1.5,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            //colors: [kWhiteColor, Colors.grey[350], kWhiteColor],
          ),
        ),
        child: Form(
          key: widget._formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                autofocus: true,
                validator: (value) {
                  if (value.isEmpty)
                    return '*Please Enter Your Full Name';
                  else
                    return null;
                },
                style: TextStyle(fontSize: 20, color: kBlueColor),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(12.0),
                    labelText: 'Full Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    prefixIcon: Icon(Icons.person_outline)),
              ),
              SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                      .hasMatch(value);
                  if (value.isEmpty)
                    return '*Please Enter Your Working Email';
                  else if (!emailValid)
                    return '*Enter a Valid Email';
                  else
                    return null;
                },
                style: TextStyle(fontSize: 20, color: kBlueColor),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(12.0),
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    prefixIcon: Icon(Icons.email_outlined)),
              ),
              SizedBox(height: 20),
              Row(children: [
                Expanded(
                  child: TextField(
                      controller: _resumeController,
                      readOnly: true,
                      style: TextStyle(fontSize: 20, color: kBlueColor),
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(12.0),
                        labelText: 'Upload Resume',
                        hintText: 'Choose file',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        prefixIcon: Icon(Icons.file_copy),
                      )),
                ),
                SizedBox(width: 20),
                MaterialButton(
                  height: 48,
                  color: kBlueColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 12.0),
                    child: Text(
                      'Upload',
                      style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  onPressed: () async {
                    // File file;
                    // FilePickerResult result = await FilePicker.platform
                    //     .pickFiles(
                    //         allowMultiple: false,
                    //         allowedExtensions: ['pdf', 'doc', 'docx']);
                    // if (result != null)
                    //   file = File(result.files.single.bytes, 'resume');
                    // print(result.paths);
                    // print(file.relativePath);
                    // _resumeController.text = file.relativePath;
                  },
                ),
              ]),
              SizedBox(
                height: MediaQuery.of(context).size.height / 4,
              ),
              MaterialButton(
                height: 48,
                color: kBlueColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 12.0),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
