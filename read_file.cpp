// Caching of frequently accessed items
#include <iostream>
#include <string>
#include <string.h>
#include <vector>
#include <dirent.h>
#include <sys/types.h>
#include <fstream>
#include <algorithm>
#include <vector>

using namespace std;

vector<int> cache {2,30,40,80};
vector<int> items;
vector<int> reader1;

void read_from_file(char* path, char* read_file)
{
  string myText;
  ifstream MyReadFile(read_file);
  ofstream MyWriteFile1;

  MyWriteFile1.open("Items/1.txt", ios_base::app);

  while (getline(MyReadFile,myText)){
    cout<< myText << endl;
    int my_Text = stoi(myText);
    if(strcmp(path, "Writers") == 0) MyWriteFile1 << myText<< endl;
    if(strcmp(path, "Items") == 0) items.push_back(my_Text);
    if(strcmp(path, "Readers") == 0) reader1.push_back(my_Text);
  }
  MyReadFile.close();
  MyWriteFile1.close();
}

void checkforcache(){
  ofstream MyWriteFile;
  MyWriteFile.open("reader1_out.txt", ios_base::app);
  for(int i=0; i< reader1.size(); ++i){
    if(count(cache.begin(), cache.end(), reader1[i])) MyWriteFile<<reader1[i]<<endl;
    if(count(items.begin(), items.end(), reader1[i])) MyWriteFile<<reader1[i]<<endl;   
  }
  MyWriteFile.close();
}
  

void list_dir(char *path) {
  struct dirent *entry;
  DIR *dir = opendir(path);
  int count = 0;
  char* str_chr = new char[100];


  if (dir == NULL) {
    return;
  }
  while ((entry = readdir(dir)) != NULL) {
  strcpy(str_chr,path);
  strcat(str_chr,"/");
  strcat(str_chr,entry->d_name);

  read_from_file(path, str_chr);
  count++;
  }
  cout<<"size of file "<< count-2 << endl;
  closedir(dir);
}



int main(int argc, char** argv){
  cout<<argv[1]<<endl;
  for(int i=2; i< argc; ++i) list_dir(argv[i]);
  checkforcache();
  return 0;
}
