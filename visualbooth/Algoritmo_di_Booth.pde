class Booth extends Product{
  int input1[];
  int input2[];
  int Matrix[][];
  int result[];
  int N;
  int Array_booth[];
  
  Booth(int arr1[],int arr2[],int n){
    super(arr1,arr2,n);
    Matrix=new int[n][2*n];
    input1=arr1;
    input2=arr2;
    N=n;
    Array_booth=new int[N];
    result=new int[N*2];
    avvia();
}
  
  
  void avvia(){
    openBooth();
    Booth();
    Array_booth=getBooth();
    Matrix=moltiplicazione();
    result=getRisulta();
    closeBooth();
  }
  
}
