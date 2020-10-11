import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:tribus/constants.dart';
import 'package:url_launcher/url_launcher.dart';

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
                        kJoinHeading,
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
                        kJoinSubHeading,
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
                            barrierLabel: 'Dismissed',
                            context: context,
                            pageBuilder: (ctx, anim1, anim2) {
                              return JoinForm(formKey: _formKey);
                            });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 12.0),
                        child: Text(
                          kJoinBtnText,
                          style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage('images/joinus.jpg')),
            ),
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
  FilePickerResult result;
  String filename = 'No file selected';
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
            colors: [kWhiteColor, Colors.grey[350], kWhiteColor],
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
                      labelText: kNameLabel,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      prefixIcon: kNameIcon),
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
                      labelText: kEmailLabel,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      prefixIcon: kEmailIcon),
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
                        labelText: kResumeLabel,
                        hintText: 'Choose file',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        prefixIcon: kResumeIcon,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  MaterialButton(
                    height: 48,
                    color: kBlueColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 12.0),
                      child: Text(
                        kUploadBtnText,
                        style: TextStyle(
                            color: kWhiteColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    onPressed: () async {
                      result = await FilePicker.platform.pickFiles();
                      if (result != null) {
                        setState(() => filename = result.files.single.name);
                      }
                    },
                  ),
                ]),
                Text(
                  filename.split('/').last,
                  textScaleFactor: 1.5,
                  style: TextStyle(color: kBlueColor),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 5,
                ),
                MaterialButton(
                  height: 48,
                  color: kBlueColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 12.0),
                    child: Text(
                      kSubmitBtnText,
                      style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  onPressed: () {
                    if (filename == 'No file selected.' ||
                        _nameController.text == '' ||
                        _emailController.text == '') {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              child: Container(
                                height: MediaQuery.of(context).size.height / 5,
                                width: MediaQuery.of(context).size.width / 5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Some fields are empty.',
                                        textScaleFactor: 1.2,
                                      ),
                                    ),
                                    MaterialButton(
                                      textColor: Colors.white,
                                      color: kBlueColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('OK'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    } else if (filename.contains('.pdf') ||
                        filename.contains('.doc') ||
                        filename.contains('.docx')) {
                      // mail code here.
                      launch(
                          'mailto:tribustechsolutions@gmail.com?subject=Resume + ${_nameController.text}');
                    }
                  },
                ),
              ]),
        ),
      ),
    );
  }
}
