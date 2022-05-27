class Bitpair extends Product{
  int input1[];
  int input2[];
  int Matrix[][];
  int result[];
  int N;
  int Booth_Array[];
  int Bit_Pair_Array[];
  
  Bitpair(int arr1[],int arr2[],int n){
    super(arr1,arr2,n);
    Matrix=new int[n][2*n];
    input1=arr1;
    input2=arr2;
    N=n;
    Booth_Array=new int[N];
    Bit_Pair_Array=new int[N];
    avvia();
  }
  
  void avvia(){
    openBooth();
    Booth();
    Booth_Array=getBooth();
    bitPair();
    Matrix=moltiplicazione();
    result=getRisulta();
    Bit_Pair_Array=getBitarra();
    closeBooth();
  }
}
