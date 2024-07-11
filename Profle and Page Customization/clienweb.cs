using system;

namespace runfrombc{
    class program{
        static void Main(string[] args){
            Console.writeLine("Hello Business central");
            foreach(var s in args)
                console.writeLine("Parameter:{0}",s);
            console.ReadLine();
        }
    }
}