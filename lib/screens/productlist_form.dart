
import 'package:flutter/material.dart';
import 'package:football_shop/widgets/left_drawer.dart';

class ProductListForm extends StatefulWidget {
	const ProductListForm({super.key});

	@override
	State<ProductListForm> createState() => _ProductListFormState();
}

class _ProductListFormState extends State<ProductListForm> {
	final _formKey = GlobalKey<FormState>();
	String _name = "";
  String _price = "";
	String _description = "";
  String _thumbnail = "";
	String _category = "Jersey";	
	bool _isFeatured = false;	
  String _stock = "";
  String _brand = "No Brand";

	final List<String> _categories = [
		'Shoes',
    'Ball',
    'Jersey',
    'Shorts',
    'Accessories',
    'Equipment',
    'Training Gear',
	];

	@override
	Widget build(BuildContext context) {
			return Scaffold(
				appBar: AppBar(
					title: const Center(child: Text('Add Product Form')),
					backgroundColor: Theme.of(context).colorScheme.primary,
					foregroundColor: Colors.white,
				),
				drawer: const LeftDrawer(),
			body: Form(
				key: _formKey,
				child: SingleChildScrollView(
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						children: [
							// Name
							Padding(
								padding: const EdgeInsets.all(8.0),
								child: TextFormField(
									decoration: InputDecoration(
										hintText: "Product Name",
										labelText: "Product Name",
										border: OutlineInputBorder(
											borderRadius: BorderRadius.circular(5.0),
										),
									),
									onChanged: (value) {
										setState(() {
											_name = value;
										});
									},
									validator: (value) {
										if (value == null || value.isEmpty) {
											return "Product name cannot be empty!";
										}
										if (value.length < 3) {
											return "Product name must be at least 3 characters!";
										}
										return null;
									},
								),
							),
              // Brand
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Brand",
                    labelText: "Brand",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  initialValue: _brand,
                  onChanged: (value) {
                    setState(() {
                      _brand = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Brand cannot be empty!";
                    }
                    return null;
                  },
                ),
              ),              
							// Price
							Padding(
								padding: const EdgeInsets.all(8.0),
								child: TextFormField(
									decoration: InputDecoration(
										hintText: "Product Price",
										labelText: "Product Price",
										border: OutlineInputBorder(
											borderRadius: BorderRadius.circular(5.0),
										),
									),
									keyboardType: TextInputType.number,
									onChanged: (value) {
										setState(() {
											_price = value;
										});
									},
									validator: (value) {
										if (value == null || value.isEmpty) {
											return "Product price cannot be empty!";
										}
										final price = int.tryParse(value);
										if (price == null) {
											return "Price must be a number!";
										}
										if (price < 0) {
											return "Price cannot be negative!";
										}
										return null;
									},
								),
							),
              // Stock
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Stock",
                    labelText: "Stock",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      _stock = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Stock cannot be empty!";
                    }
                    final stock = int.tryParse(value);
                    if (stock == null) {
                      return "Stock must be a number!";
                    }
                    if (stock < 0) {
                      return "Stock cannot be negative!";
                    }
                    return null;
                  },
                ),
              ),
							// Description
							Padding(
								padding: const EdgeInsets.all(8.0),
								child: TextFormField(
									maxLines: 3,
									decoration: InputDecoration(
										hintText: "Product Description",
										labelText: "Product Description",
										border: OutlineInputBorder(
											borderRadius: BorderRadius.circular(5.0),
										),
									),
									onChanged: (value) {
										setState(() {
											_description = value;
										});
									},
									validator: (value) {
										if (value == null || value.isEmpty) {
											return "Product description cannot be empty!";
										}
										if (value.length < 5) {
											return "Description must be at least 5 characters!";
										}
										return null;
									},
								),
							),
							// Category
							Padding(
								padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Category",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  initialValue: _category,
                  items: _categories
                      .map((cat) => DropdownMenuItem(
                            value: cat,
                            child: Text(cat),
                          ))
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _category = newValue!;
                    });
                  },
                ),
							),
							// Thumbnail
							Padding(
								padding: const EdgeInsets.all(8.0),
								child: TextFormField(
									decoration: InputDecoration(
										hintText: "Thumbnail URL (optional)",
										labelText: "Thumbnail URL",
										border: OutlineInputBorder(
											borderRadius: BorderRadius.circular(5.0),
										),
									),
									onChanged: (value) {
										setState(() {
											_thumbnail = value;
										});
									},
									validator: (value) {
										if (value != null && value.isNotEmpty) {
											final urlPattern = r'^(http|https):\\/\\/.+';
											if (!RegExp(urlPattern).hasMatch(value)) {
												return "Thumbnail must be a valid URL!";
											}
										}
										return null;
									},
								),
							),
							// Is Featured
							Padding(
								padding: const EdgeInsets.all(8.0),
								child: SwitchListTile(
									title: const Text("Mark as Featured Product"),
									value: _isFeatured,
									onChanged: (value) {
										setState(() {
											_isFeatured = value;
										});
									},
								),
							),
							// Tombol Simpan
							Align(
								alignment: Alignment.bottomCenter,
								child: Padding(
									padding: const EdgeInsets.all(8.0),
									child: ElevatedButton(
										style: ButtonStyle(
											backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
												if (states.contains(WidgetState.disabled)) {
													return Theme.of(context).colorScheme.primary.withAlpha(128);
												}
												return Theme.of(context).colorScheme.primary;
											}),
										),
										onPressed: () {
											if (_formKey.currentState!.validate()) {
												showDialog(
													context: context,
													builder: (context) {
														return AlertDialog(
															title: const Text('Product saved successfully!'),
															content: SingleChildScrollView(
																child: Column(
																	crossAxisAlignment:
																			CrossAxisAlignment.start,
																	children: [
																		Text('Name: $_name'),
                                    Text('Brand: $_brand'),
																		Text('Price: $_price'),
                                    Text('Stock: $_stock'),
																		Text('Description: $_description'),
																		Text('Category: $_category'),
																		Text('Thumbnail: $_thumbnail'),
																		Text('Featured: ${_isFeatured ? "Yes" : "No"}'),
																	],
																),
															),
															actions: [
																TextButton(
																	child: const Text('OK'),
																	onPressed: () {
																		Navigator.pop(context);
																	},
																),
															],
														);
													},
												).then((_) {
                          _formKey.currentState!.reset();
                          setState(() {
                            _name = "";
                            _brand = "No Brand";
                            _price = "";
                            _stock = "";
                            _description = "";
                            _category = "Jersey";
                            _thumbnail = "";
                            _isFeatured = false;
                          });
                        });
											}
										},
										child: const Text(
											"Save",
											style: TextStyle(color: Colors.white),
										),
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
