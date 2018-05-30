#include "getfilelist.h"

GetFileList::GetFileList(QObject *parent) : QObject(parent)
{
    ListFileList fileListItem[22];
    fileListItem[0] ={"0","asingname","网络","12M",QDate(2018,3,5)};
    fileListItem[1] ={"1","bsingname","本地","11M",QDate(2018,4,15)};
    fileListItem[2] ={"2","csingname","闪烁","14M",QDate(2017,3,25)};
    fileListItem[3] ={"3","dsingname","本地","2M" ,QDate(2018,5,26)};
    fileListItem[4] ={"4","esingname","网络","12M",QDate(2018,3,30)};
    fileListItem[5] ={"5","fsingname","本地","11M",QDate(2018,2,15)};
    fileListItem[6] ={"6","gsingname","闪烁","14M",QDate(2014,3,22)};
    fileListItem[7] ={"7","hsingname","本地","2M" ,QDate(2013,3,3)};
    fileListItem[8] ={"8","isingname","网络","12M",QDate(2018,1,5)};
    fileListItem[9] ={"9","jsingname","本地","11M",QDate(2018,8,8)};
    fileListItem[10]={"10","jkingname","闪烁","14M",QDate(2017,10,31)};
    fileListItem[11]={"11","jaingname","本地","2M" ,QDate(2018,2,20)};
    fileListItem[12] ={"2","csingname","闪烁","14M",QDate(2017,3,25)};
    fileListItem[13] ={"3","dsingname","本地","2M" ,QDate(2018,5,26)};
    fileListItem[14] ={"4","esingname","网络","12M",QDate(2018,3,30)};
    fileListItem[15] ={"5","fsingname","本地","11M",QDate(2018,2,15)};
    fileListItem[16] ={"6","gsingname","闪烁","14M",QDate(2014,3,22)};
    fileListItem[17] ={"7","hsingname","本地","2M" ,QDate(2013,3,3)};
    fileListItem[18] ={"8","isingname","网络","12M",QDate(2018,1,5)};
    fileListItem[19] ={"9","jsingname","本地","11M",QDate(2018,8,8)};
    fileListItem[20]={"10","jkingname","闪烁","14M",QDate(2017,10,31)};
    fileListItem[21]={"11","jaingname","本地","2M" ,QDate(2018,2,20)};

    fileList.append(fileListItem[0]);
    fileList.append(fileListItem[1]);
    fileList.append(fileListItem[2]);
    fileList.append(fileListItem[3]);
    fileList.append(fileListItem[4]);
    fileList.append(fileListItem[5]);
    fileList.append(fileListItem[6]);
    fileList.append(fileListItem[7]);
    fileList.append(fileListItem[8]);
    fileList.append(fileListItem[9]);
    fileList.append(fileListItem[10]);
    fileList.append(fileListItem[11]);
    fileList.append(fileListItem[12]);
    fileList.append(fileListItem[13]);
    fileList.append(fileListItem[14]);
    fileList.append(fileListItem[15]);
    fileList.append(fileListItem[16]);
    fileList.append(fileListItem[17]);
    fileList.append(fileListItem[18]);
    fileList.append(fileListItem[19]);
    fileList.append(fileListItem[20]);
    fileList.append(fileListItem[21]);
//    ListFileList downListItem[11];
//    downListItem[0] ={"0","asingname","网络","12M",QDate(2018,3,5)};
//    downListItem[1] ={"1","bsingname","本地","11M",QDate(2018,4,15)};
//    downListItem[2] ={"2","csingname","闪烁","14M",QDate(2017,3,25)};
//    downListItem[3] ={"3","dsingname","本地","2M" ,QDate(2018,5,26)};
//    downListItem[4] ={"4","esingname","网络","12M",QDate(2018,3,30)};
//    downListItem[5] ={"5","fsingname","本地","11M",QDate(2018,2,15)};
//    downListItem[6] ={"6","gsingname","闪烁","14M",QDate(2014,3,22)};
//    downListItem[7] ={"7","hsingname","本地","2M" ,QDate(2013,3,3)};
//    downListItem[8] ={"8","isingname","网络","12M",QDate(2018,1,5)};
//    downListItem[9] ={"9","jsingname","本地","11M",QDate(2018,8,8)};
//    downListItem[10]={"10","jkingname","闪烁","14M",QDate(2017,10,31)};

//    downList.append(downListItem[0]);
//    downList.append(downListItem[1]);
//    downList.append(downListItem[2]);
//    downList.append(downListItem[3]);
//    downList.append(downListItem[4]);
//    downList.append(downListItem[5]);
//    downList.append(downListItem[6]);
//    downList.append(downListItem[7]);
//    downList.append(downListItem[8]);
//    downList.append(downListItem[9]);
//    downList.append(downListItem[10]);

}
void GetFileList::setSe(sequence num)
{
    se = num;
}
//文件表列及下载表列 清除、添加、删除 多选项的功能实现 以option 枚举值区分

void GetFileList::AppendIndexToList(int index,option ch)
{
    if(ch == option::FileList)
    {
        indexList.append(index);
    }
    else
    {
        qDebug()<<QString::number(index);
        indexListD.append(index);
    }
}
void GetFileList::ClearIndexToList(option ch)
{
    if(ch == option::FileList)
    {
        indexList.clear();
    }
    else{
        indexListD.clear();
    }
}
void GetFileList::SendIndexFromList(option ch)
{
    qDebug("option:%d",ch);
    if(ch == option::FileList)
    {
        foreach (int i , indexList)
        {
            qDebug("index:%d",i);
            downList.append(fileList.at(i));
            //int length = downList.length();
            //downList[length].index = QString::number(length);
        }
        SortListD();
        emit listDCountChanged();
        updateListD();
    }
    else{
        foreach (int i , indexListD)
        {
            qDebug("indexD:%d",i);

            downList.removeAt(i);       //这里的i 必须是倒序的  不然删除时要越位删除 因为删掉一个前面就少一个 但是排序没变 因此这里的indexListD在qml中是倒叙添加的
        }
        SortListD();
        emit listDCountChanged();
        //updateListD();
    }
}
void GetFileList::fileTodownList()
{

}
//重构函数需要定义为全局变量
//序号排列
bool IndexLessThan(const ListFileList &s1, const ListFileList &s2)
{
    return s1.index.toInt() < s2.index.toInt();
}
//名字排列
bool NameFirstLessThan(const ListFileList &s1, const ListFileList &s2)
{
    return s1.name.toLower() < s2.name.toLower();
}
//模式排列
bool ModeFirstLessThan(const ListFileList &s1, const ListFileList &s2)
{
    return s1.mode.toLower() < s2.mode.toLower();
}
//时间排列
bool TimeLessThan(const ListFileList &s1, const ListFileList &s2)
{
    return s1.time < s2.time;
}
//实验排列
bool ususususus(const QString &s1, const QString &s2)
{
    return s1.toLower() < s2.toLower();
}
//设置排序方式
void GetFileList::SortList()
{
    qDebug()<<QString::number(se);

    if(se == sequence::IndexSe)
    {
        qDebug()<<"---INDEX---";
        qSort(fileList.begin(), fileList.end(), IndexLessThan);
        foreach (ListFileList i , fileList)
        {
         qDebug()<<i.index;
        }
        emit updateList();
    }
    else if(se == sequence::NameSe)
    {
        qDebug()<<"---NAME---";
        qSort(fileList.begin(), fileList.end(), NameFirstLessThan);
        foreach (ListFileList i , fileList)
        {
         qDebug()<<i.name;
        }
        emit updateList();
    }
    else if(se == sequence::ModeSe)
    {
        qDebug()<<"---MODE---";
        qSort(fileList.begin(), fileList.end(), ModeFirstLessThan);
        foreach (ListFileList i , fileList)
        {
         qDebug()<<i.mode;
        }
        emit updateList();
    }
    else if(se == sequence::TimeSe)
    {
        qDebug()<<"---TIME---";
        qSort(fileList.begin(), fileList.end(), TimeLessThan);
        foreach (ListFileList i , fileList)
        {
         qDebug()<<i.time;
        }
        emit updateList();
    }
}
//设置排序方式
void GetFileList::SortListD()
{
    qDebug()<<QString::number(se);

    if(se == sequence::IndexSe)
    {
        qDebug()<<"---INDEX---";
        qSort(downList.begin(), downList.end(), IndexLessThan);
        foreach (ListFileList i , downList)
        {
         qDebug()<<i.index;
        }
        emit updateListD();
    }
    else if(se == sequence::NameSe)
    {
        qDebug()<<"---NAME---";
        qSort(downList.begin(), downList.end(), NameFirstLessThan);
        foreach (ListFileList i , downList)
        {
         qDebug()<<i.name;
        }
        emit updateListD();
    }
    else if(se == sequence::ModeSe)
    {
        qDebug()<<"---MODE---";
        qSort(downList.begin(), downList.end(), ModeFirstLessThan);
        foreach (ListFileList i , downList)
        {
         qDebug()<<i.mode;
        }
        emit updateListD();
    }
    else if(se == sequence::TimeSe)
    {
        qDebug()<<"---TIME---";
        qSort(downList.begin(), downList.end(), TimeLessThan);
        foreach (ListFileList i , downList)
        {
         qDebug()<<i.time;
        }
        emit updateListD();
    }
}
//FileListView
QString GetFileList::GetlistIndex(int index)
{
    return fileList.at(index).index;
}
QString GetFileList::GetlistName(int index)
{
    return fileList.at(index).name;
}
QString GetFileList::GetlistMode(int index)
{
    return fileList.at(index).mode;
}
QString GetFileList::GetlistSize(int index)
{
    return fileList.at(index).size;
}
QString GetFileList::GetlistTime(int index)
{
    return fileList.at(index).time.toString("yyyy / MM / dd");
}
int GetFileList::GetlistCount()
{
    return fileList.length();
}

//DownListView
QString GetFileList::GetlistIndexD(int index)
{
    return downList.at(index).index;
}
QString GetFileList::GetlistNameD(int index)
{
    return downList.at(index).name;
}
QString GetFileList::GetlistModeD(int index)
{
    return downList.at(index).mode;
}
QString GetFileList::GetlistSizeD(int index)
{
    return downList.at(index).size;
}
QString GetFileList::GetlistTimeD(int index)
{
    return downList.at(index).time.toString("yyyy / MM / dd");
}
int GetFileList::GetlistCountD()
{
    return downList.length();
}

void  GetFileList::AppendItemTo_fileList(ListFileList &Item)
{
    fileList.append(Item);
    emit listCountChanged();
    SortList();
}
void  GetFileList::AppendItemTo_downList(ListFileList &Item)
{
    downList.append(Item);
    emit listDCountChanged();
    SortListD();
}
void  GetFileList::touchUpdateList(option ch)
{

    if(ch == option::FileList)
    {
        emit updateList();
    }
    else
    {
        emit updateListD();
    }
}
