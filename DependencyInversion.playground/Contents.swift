import UIKit


/*
 Reference: https://dotnettutorials.net/lesson/dependency-inversion-principle/
 DIP-> Dependency Inversion Principle
 High level modules should not depend upon low level modules. Both should depend upon abstractions.
 
 Abstractions should not depend upon details. Details should depend upon abstractions.
 */

class Client: CustomStringConvertible {
    var description: String {
        return "iPhone application"
    }
    // High Level Module
    
    func needProduct() {
        let developer = Factory.create()
        developer.generatingProduct()
    }
}

class Client2: CustomStringConvertible {
    var description: String {
        return "Android application"
    }
    private var producable: Producable!
    
    public func customInit(_ producable: Producable) {
        self.producable = producable
    }
    
    public func generatingProduct() -> Product {
        return Product(name: "Android application")
    }
    
}

class Factory {
    static func create() -> Developer {
        return Developer()
    }
}

protocol Producable {
    func generatingProduct() -> Product
}


class Developer: Producable { // Low level Modules
    func generatingProduct() -> Product {
        return Product(name: "iPhone application")
    }
}

struct Product {
    var name: String
}


let client = Client()
client.needProduct()
print(client.description)


let client2 = Client2()
client2.generatingProduct()
print(client2.description)



class ViewModel {
    var name: String!
    
    func getName() -> String {
        return name
    }
}

class Vc {
    private var vm: ViewModel!
    
   // private var vm = ViewModel() // This would have been a bad implementation

    init(vm: ViewModel) {
        self.vm = vm
    }
    
    func getName() {
        print("name: \(vm.name)")
    }
    
}

let vm = ViewModel()
    
let vc = Vc(vm: vm) /// Added a dependency injection.
print(vc.getName())


public class Employee { // Low level Modules
    public var  ID: Int
    public var name: String
    public  var department: String
    public var  salary: Int
    
    init(ID: Int, name: String, department: String, salary: Int) {
        self.ID = ID
        self.name = name
        self.department = department
        self.salary = salary
    }
}

protocol IEmployeeDataAccess { // In other languages it's interface
    func getEmployeeDetails(id: Int) -> Employee
}

public class EmployeeDataAccess : IEmployeeDataAccess
{
    public  func getEmployeeDetails(id: Int) -> Employee
    {
        // In real time get the employee details from db
        //but here we are hardcoded the employee details
        let emp = Employee(ID: id, name: "Pranaya", department: "IT", salary: 20000)
        return emp
    }
}

public class DataAccessFactory
{
    static func getEmployeeDataAccessObj() -> IEmployeeDataAccess
    {
        return EmployeeDataAccess()
    }
}


public class EmployeeBusinessLogic /// High level Module
{
    var employeeDataAccess: IEmployeeDataAccess!
    public func employeeBusinessLogic()
    {
        employeeDataAccess =  DataAccessFactory.getEmployeeDataAccessObj()
    }
    
    public func getEmployeeDetails(id: Int) -> Employee
    {
        return employeeDataAccess.getEmployeeDetails(id: 123)
    }
}







//public class EmployeeDataAccess
//    {
//    public func getEmployeeDetails(id: Int) -> Employee
//        {
//            // In real time get the employee details from db
//            //but here we are hard coded the employee details
//            var emp = Employee(ID: id, name: "Pranaya", department: "IT", salary: 20000)
//            return emp;
//        }
//    }


//public class DataAccessFactory
//    {
//        public static func getEmployeeDataAccessObj() -> EmployeeDataAccess
//        {
//            return EmployeeDataAccess()
//        }
//    }


//public class EmployeeBusinessLogic
//    {
//    var employeeDataAccess: EmployeeDataAccess!
//
//        public func employeeBusinessLogic()
//        {
//            employeeDataAccess = DataAccessFactory.getEmployeeDataAccessObj()
//        }
//
//    public  func getEmployeeDetails(id: Int) -> Employee
//        {
//            return employeeDataAccess.getEmployeeDetails(id: 12)
//        }
//    }


