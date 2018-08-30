# README

Ruby version: 2.5.1

Database is postgres - database user is datatables_demo
Test suite is in rspec - run `rspec spec/`

The down low:
This project is for demonstrating a project where I applied jQuery datatables to a large app with around 90 models. Most models were pretty simple, standard Rails models, some were more complex. The datatables plugin added sort and search capability to the tables on the client side. 
In this project I have just 2 models, but hopefully it's clear that the optimizations for two tables would be extremely useful when extended to a larger number of models.

To convert a standard HTML table into a jquery datatable, we call the function DataTable on the object returned by the jQuery selector:

$('#table_id').DataTable()

In order to specify custom behavior on the table such as fields to search by or the type of ordering (default lexicographical ordering is not appropriate for numerical data for example). Specifying the parameters and calling the function for each table results in a great deal of boilerplate code. I created a function that composes the custom function parameters from semantically named data attributes in each table, and calls the the function on that table. This function is defined in application.js, and is called for every table with the 'datatable' class.

For small data sets, all that's necessary is to render all the records in the html table with no filtering or pagination, call DataTable on that table, and then let jQuery do all the work on the client side. However, for large record sets, rendering the entire set in the client is impractical, so the datatable is configured to make ajax calls to the (Rails) backend to return a JSON object that is handled by jQuery. In the Rails controllers, it is assumed that a call to the #index action with format=:json will need to return a JSON object formatted appropriately for use by the jQuery datatable. ApplicationController defines the method render_datatable_json for this purpose. ApplicationController also defines the methods serializer_class and presenter_class which "guess" the names of the appropriate serializer and presenter classes to use in rendering the JSON response. 

The serializer and presenter classes extend base classes with custom methods or values. The serializers just need to specify the fields to serialize, and the presenters define functions that the serializers call.

Each model defines a 'search' method which is called by the controller's index function, and includes a module called 'datatables_support' which includes methods supporting the search functionality.

