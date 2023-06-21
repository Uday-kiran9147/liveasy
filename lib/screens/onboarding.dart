import 'package:flutter/material.dart';
import 'package:liveasy/screens/phone_number.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  String? _selectedCountry = "+91";
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Onboarding'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 42,
            width: 42,
            color: Colors.green,
          ),
          Text('Please enter your mobile number'),
          Text('You\'ll receive a 6 digit code to verify next.'),
          Center(
            child: Text('Onboarding'),
          ),
          Row(
            children: [
              Container(
                // height: 40,
                // width: 40,
                child: DropdownButton<String?>(
                  hint: Text("country"),
                  value: _selectedCountry,
                  onChanged: (String? newvalue) {
                    setState(() {
                      _selectedCountry = newvalue!;
                    });
                  },
                  items: <String>["+91", "+11", "+23", "12"]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem(
                        alignment: Alignment.center,
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.green),
                        ));
                  }).toList(),
                ),
              ),
              Expanded(
                  child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                ),
              ))
            ],
          ),
          ElevatedButton(
              onPressed: () {

                
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PhoneScreen(),
                    ));
              },
              child: Text('continue'))
        ],
      ),
    );
  }
}
