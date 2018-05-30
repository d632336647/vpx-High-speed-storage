//FileManager.h
#ifdef  FILE_MANGER_IMPORT
#else
#define FILE_MANGER_IMPORT extern "C" _declspec(dllimport)
#endif
#include <iostream>
#include <string>
#include <list>
#include <algorithm>
using namespace std;
//文件信息结构体
struct FileAttr
{
        string name;    //文件名
        long size;		//文件大小
        string lastmodi;//最后修改时间
        string filepath;//文件全路径
};
//文件操作类型
enum OperateType
{
        DELETE_THE_FILE = 0,
        COPY_THE_FILE = 1,
        MOVE_THE_FILE
};
//排序方式
enum SortMode
{
        BY_NAME=0,  //表示按文件名排序
        BY_FILESIZE=1,//按文件大小排序
        BY_LAST_MODIFY //按最近修改时间排序

};
typedef list<FileAttr> FileInfo;//定义全局文件信息  类型

//int z;
int EmuFiles(const char * , FileInfo& );       //遍历文件夹函数
void SortString(FileInfo& , SortMode );  //排序函数:1.表示按文件名排序 2.按文件大小排序 3.按最近修改时间排序
//string ErrorExit(LPTSTR);						//重写GetLastError()
bool ManageFile(string , string , OperateType );//参数1 为源文件名（含路径） ，参数2为目的文件（含路径）返回值表示是否成功


