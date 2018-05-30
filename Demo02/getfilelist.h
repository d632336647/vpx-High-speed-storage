#ifndef GETFILELIST_H
#define GETFILELIST_H

#include <QDebug>
#include <QObject>
#include <QList>
#include <QStringList>
#include <QDate>
//全局结构体定义
struct ListFileList
{
    QString index;
    QString name;
    QString mode;
    QString size;
    QDate time;
};
class GetFileList : public QObject
{
    Q_OBJECT
    Q_ENUMS(option)
    Q_ENUMS(sequence)
public:
    enum option{
        FileList = 0,
        DownList = 1,
    };
    enum sequence{
        IndexSe=0,
        NameSe =1,
        ModeSe =2,
        TimeSe =3,
    };
    int times =0 ;
    sequence se = IndexSe;
    Q_INVOKABLE void setSe(sequence num);

    explicit GetFileList(QObject *parent = nullptr);
    QList<int> indexList;
    QList<int> indexListD;
    QList<ListFileList> fileList;
    QList<ListFileList> downList;
    Q_INVOKABLE void AppendIndexToList(int index,option ch =FileList);
    Q_INVOKABLE void ClearIndexToList(option ch=FileList);
    Q_INVOKABLE void SendIndexFromList(option ch=FileList);
    Q_INVOKABLE void fileTodownList();
    //排序
    Q_INVOKABLE void SortList();
    Q_INVOKABLE void SortListD();
    //填充列表函数
    Q_INVOKABLE int GetlistCount();
    Q_INVOKABLE QString GetlistIndex(int index);
    Q_INVOKABLE QString GetlistName(int index);
    Q_INVOKABLE QString GetlistMode(int index);
    Q_INVOKABLE QString GetlistSize(int index);
    Q_INVOKABLE QString GetlistTime(int index);

    //填充列表函数
    Q_INVOKABLE int GetlistCountD();
    Q_INVOKABLE QString GetlistIndexD(int index);
    Q_INVOKABLE QString GetlistNameD(int index);
    Q_INVOKABLE QString GetlistModeD(int index);
    Q_INVOKABLE QString GetlistSizeD(int index);
    Q_INVOKABLE QString GetlistTimeD(int index);
    //用于在qml中触发更新
    Q_INVOKABLE void touchUpdateList(option ch=FileList);

    //填充fileList外部接口函数
    void AppendItemTo_fileList(ListFileList &Item);     //流程 AppendItemTo_fileList->SortList->updateList->QML
    //填充downList外部接口函数
    void AppendItemTo_downList(ListFileList &Item);


signals:
    void updateList();
    void updateListD();
    void listCountChanged();
    void listDCountChanged();
public slots:
};

#endif // GETFILELIST_H
