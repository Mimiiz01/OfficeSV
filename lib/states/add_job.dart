import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:officesv/utility/my_constrant.dart';
import 'package:officesv/widgets/show_form.dart';
import 'package:officesv/widgets/show_image.dart';
import 'package:officesv/widgets/show_text.dart';

class AddJob extends StatefulWidget {
  const AddJob({
    Key? key,
  }) : super(key: key);

  @override
  State<AddJob> createState() => _AddJobState();
}

class _AddJobState extends State<AddJob> {
  var factorKeys = <int>[
    1,
    2,
    3,
    4,
  ];

  int? chooseFactorKey;
  String? chooseAgree, addDate;

  var itemChooses = <bool>[false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyConstant.primary,
        title: const Text('Add Job'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusScopeNode()),
        behavior: HitTestBehavior.opaque,
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            children: [
              newImage(),
              newJob(),
              newDetail(),
              newFactorKey(),
              displayCalculate(),
              newAgree(),
              chooseItem(),
              newAddDate(),
            ],
          ),
        )),
      ),
    );
  }

  Container newAddDate() {
    DateTime dateTime = DateTime.now();
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    addDate = dateFormat.format(dateTime);

    return Container(
      margin: EdgeInsets.only(top: 16, bottom: 50),
      padding: const EdgeInsets.all(16),
      decoration: MyConstant().curBorder(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShowText(
            label: 'Add Date :',
            textStyle: MyConstant().h2Style(),
          ),
          SizedBox(
            width: 250,
            child: ListTile(
              title: ShowText(label: addDate ?? 'dd / MM / yyyy'),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.calendar_month_outlined,
                  size: 36,
                  color: MyConstant.dark,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container chooseItem() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: MyConstant().curBorder(),
      child: Column(
        children: [
          SizedBox(
            width: 250,
            child: ShowText(
              label: 'Item :',
              textStyle: MyConstant().h2Style(),
            ),
          ),
          newCheckbox(index: 0, label: 'Doraemon'),
          newCheckbox(index: 1, label: 'Nobita'),
          newCheckbox(index: 2, label: 'Shisuka'),
        ],
      ),
    );
  }

  SizedBox newCheckbox({required int index, required String label}) {
    return SizedBox(
      width: 250,
      child: CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: ShowText(label: label),
        value: itemChooses[0],
        onChanged: (value) {
          setState(() {
            itemChooses[index] = value!;
          });
        },
      ),
    );
  }

  Container newAgree() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.all(16),
      decoration: MyConstant().curBorder(),
      child: Column(
        children: [
          SizedBox(
            width: 250,
            child: ShowText(
              label: 'Agree :',
              textStyle: MyConstant().h2Style(),
            ),
          ),
          Container(
            width: 250,
            child: Row(
              children: [
                SizedBox(
                  width: 120,
                  child: RadioListTile(
                    title: const ShowText(label: 'Yes'),
                    value: 'yes',
                    groupValue: chooseAgree,
                    onChanged: (value) {
                      setState(() {
                        chooseAgree = value.toString();
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 120,
                  child: RadioListTile(
                    title: const ShowText(label: 'No'),
                    value: 'no',
                    groupValue: chooseAgree,
                    onChanged: (value) {
                      setState(() {
                        chooseAgree = value.toString();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget displayCalculate() {
    return chooseFactorKey == null
        ? const SizedBox()
        : Container(
            alignment: Alignment.center,
            width: 250,
            height: 40,
            decoration: MyConstant().curBorder(),
            child: ShowText(
                label: '$chooseFactorKey x 100 = ${chooseFactorKey! * 100}'),
          );
  }

  Container newFactorKey() {
    return Container(
      padding: const EdgeInsets.only(left: 16),
      width: 250,
      height: 40,
      margin: const EdgeInsets.symmetric(vertical: 15),
      decoration: MyConstant().curBorder(),
      child: DropdownButton<dynamic>(
          hint: Row(
            children: [
              Icon(
                Icons.android,
                color: MyConstant.dark,
              ),
              const SizedBox(
                width: 15,
              ),
              const ShowText(label: 'Please choose FactorKey'),
            ],
          ),
          value: chooseFactorKey,
          items: factorKeys
              .map(
                (e) => DropdownMenuItem(
                  child: Row(
                    children: [
                      Icon(
                        Icons.android,
                        color: MyConstant.dark,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      ShowText(label: 'factor key => $e'),
                    ],
                  ),
                  value: e,
                ),
              )
              .toList(),
          onChanged: (value) {
            setState(() {
              chooseFactorKey = value;
            });
            print('chooseFactorKey ==> $chooseFactorKey');
          }),
    );
  }

  ShowForm newDetail() {
    return ShowForm(
        label: 'Detail :',
        iconData: Icons.details,
        changeFunc: (String string) {});
  }

  ShowForm newJob() {
    return ShowForm(
        label: 'Job :', iconData: Icons.work, changeFunc: (String string) {});
  }

  SizedBox newImage() {
    return SizedBox(
        width: 250,
        height: 250,
        child: Stack(
          children: [
            ShowImage(
              path: '/image/picture.png',
            ),
            Positioned(
              bottom: 8,
              right: 8,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_a_photo,
                    size: 48,
                    color: MyConstant.dark,
                  )),
            ),
          ],
        ));
  }
}
