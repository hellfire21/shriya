import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class NewExpense extends StatefulWidget {
  const NewExpense({super.key,required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {

  //ONE WAY TO STORE THE TITLE OF THE NEWLY ADDED TITLE IN THE MODAL OVERLAY
  // var _enteredTitle='';
  //
  // void _saveTitleInput(String inputValue) {
  //    _enteredTitle=inputValue;
  //  }

  //second method
  //after using textditing controller it should be dispposed as
  //it might take up unnecessary memory
  final _titleController=TextEditingController();
  final _amountController=TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;
  void  _presentDatePicker() async{
    final now=DateTime.now();
    final firstDate=DateTime(now.year - 1,now.month,now.day);
    final pickedDate= await showDatePicker(
        context: context,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      _selectedDate=pickedDate;
    });
  }

  void _submitExpenseData(){
    final enteredAmount=double.tryParse(_amountController.text);

    final amountIsInvalid=enteredAmount==null || enteredAmount<=0;
    if(_titleController.text.trim().isEmpty
        || amountIsInvalid
        || _selectedDate==null){
      //show error message
      showDialog(context: context, 
          builder: (ctx) =>AlertDialog(
            title: Text('Invalid input'),
            content:const Text('Please make sure to enter a valid title,amount,date and category'),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(ctx);
              }, child: const Text('okay'),)
            ],
          ));
      return;
    }
    
    widget.onAddExpense(Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory,
    ),
    );
    Navigator.pop(context);//to close overlay
  }

  @override

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }
    @override
  Widget build(BuildContext context){
    final keyboardSpace=MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(builder: (ctx,constraints){
     final width=constraints.maxWidth;
      return SizedBox(
        height:double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16,48,16,keyboardSpace+16),
            child:Column(
              children: [
                if(width>=600)
                  Row(
                    crossAxisAlignment:CrossAxisAlignment.start ,
                    children: [
                    Expanded(child: TextField(
                      controller: _titleController,
                      maxLength: 50,//keyboard type can also be set
                      decoration: const InputDecoration(
                        label: Text('Title'),
                      ),
                    ),
                    ),
                    const SizedBox(width:24),
                    Expanded(child:TextField(
                        controller: _amountController,
                        maxLength:20,
                        decoration:const InputDecoration(
                            prefixText:'\$ ',
                            label:Text('Total Cost')
                        )

                    ),
                    ),
                  ],
                  )
                else
                //to enter some text
                   TextField(
                    controller: _titleController,
                    maxLength: 50,//keyboard type can also be set
                    decoration: const InputDecoration(
                      label: Text('Title'),
                  ),
                ),
                if(width>=600)
                  Row(children: [
                    DropdownButton(
                        value: _selectedCategory,
                        items: Category.values.map(
                              (category) => DropdownMenuItem(
                            value: category,
                            child: Text(
                              category.name.toUpperCase(),
                            ),
                          ),
                        ).toList(),
                        onChanged: (value) {
                          setState(() {
                            if(value == null){
                              return;
                            }
                            _selectedCategory=value;
                          });
                        }),
                    const SizedBox(width: 24,),
                    Expanded(child:Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(_selectedDate == null ? 'No date selected' : formatter.format(_selectedDate!)),
                        IconButton(
                            onPressed: _presentDatePicker,
                            icon: const Icon(
                              Icons.calendar_month,
                            ))

                      ],
                    ) )
                  ],)
                else

                Row(
                  children: [
                    Expanded(child:TextField(
                        controller: _amountController,
                        maxLength:20,
                        decoration:const InputDecoration(
                            prefixText:'\$ ',
                            label:Text('Total Cost')
                        )

                    ),
                    ),

                    const SizedBox(width: 30,),
                    Expanded(child:Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(_selectedDate == null ? 'No date selected' : formatter.format(_selectedDate!)),
                        IconButton(
                            onPressed: _presentDatePicker,
                            icon: const Icon(
                              Icons.calendar_month,
                            ))

                      ],
                    ) )
                  ],
                ),
                const SizedBox(height: 20,),
                if(width>=600)
                  Row(children: [
                    const Spacer(),
                    ElevatedButton(
                      onPressed: (){
                        print(_titleController.text);
                        print(_amountController.text);
                        _submitExpenseData();
                      },
                      child: const Text('Save Expense'),
                    ),
                    const SizedBox(width: 20,),
                    ElevatedButton(onPressed: (){
                      Navigator.pop(context);
                      //removes the current overlay from the screen
                    },
                      child: const Text('Cancel'),
                    )



                  ],)
                else

                Row(
                  children: [
                    DropdownButton(
                        value: _selectedCategory,
                        items: Category.values.map(
                              (category) => DropdownMenuItem(
                            value: category,
                            child: Text(
                              category.name.toUpperCase(),
                            ),
                          ),
                        ).toList(),
                        onChanged: (value) {
                          setState(() {
                            if(value == null){
                              return;
                            }
                            _selectedCategory=value;
                          });
                        }),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: (){
                        print(_titleController.text);
                        print(_amountController.text);
                        _submitExpenseData();
                      },
                      child: const Text('Save Expense'),
                    ),
                    const SizedBox(width: 20,),
                    ElevatedButton(onPressed: (){
                      Navigator.pop(context);
                      //removes the current overlay from the screen
                    },
                      child: const Text('Cancel'),
                    )//cancel button
                  ],
                ),

              ],
            ),
          ),
        ),
      );
    });


  }
  }

