(1) 创建hadoop用户：

sudo addgroup hadoop   #创建hadoop用户组
sudo adduser -ingroup hadoop hadoop # 向hadoop用户组中添加hadoop用户，回车后会提示输入新的UNIX密码，这是新建用户hadoop的密码，输入回车即可
sudo adduser hadoop sudo  #为hadoop增加管理员权限



(2) 关闭防火墙：

sudo ufw status  #查看防火墙的状态inactive表示防火墙处于关闭状态active表示处于开启状态
sudo ufw disable #关闭防火墙，enable打开防火墙

(3) 更改主机名，完成IP地址与主机名的映射

sudo hostnamectl set-hostname master(主机名自己定义)
sudo vi /etc/hosts  #按i后可输入，输入完成后先按Esc键再输入：wq（保存退出）\:q!(不保存退出)
 
ping master  #测试是否映射成功，ctrl+c 强制中断

(4) ssh免密登录

sudo apt-get update   #更新apt
sudo apt-get install openssh-server  #安装ssh
cd ~/.ssh/  #如果没有该目录，先执行ssh localhost
ssh-keygen -t rsa  #生成密钥
cp ~/.ssh/id_rsa.pub ~/.ssh/authorized_keys  #拷贝生成ssh要求的公钥文件名
ssh master(或者IP地址)  #不需要密码登录成功，若需要密码可能上面那一步出错
exit  #退出登录

(5) 安装jdk
用xftp连上Ubuntu中的hadoop用户，把jdk安装包复制（拖动）到虚拟机中。

sudo tar -zxvf /home/hadoop/jdk-8u181-linux-x64.tar.gz -C /usr/local/   #把jdk的tar包解压并放到/usr/local目录下
cd /usr/local   #进入/usr/local目录下
sudo mv jdk1.8.0_181/ java   #把文件名改为java
vi ~/.bashrc   #进入bashrc配置环境变量，编辑此文件配置两行内容
export JAVA_HOME=/usr/local/java
export PATH=.:$JAVA_HOME/bin:$PATH
source ~/.bashrc  #使环境变量生效



可输入java，javac测试看环境变量是否配好
(6) 安装hadoop
用xftp连上Ubuntu中的hadoop用户，把hadoop安装包复制（拖动）到虚拟机中（同jdk）。

sudo tar -zxvf /home/hadoop/hadoop-3.1.0.tar.gz -C /usr/local/   #把hadoop的tar包解压并放到/usr/local目录下
cd /usr/local   #进入/usr/local目录下
sudo mv hadoop-3.1.0/ hadoop   #把文件名改为hadoop
sudo chown -R hadoop:hadoop /usr/local/hadoop   #chown命令，在将文件拷贝到另一个用户的名录下之后，让用户拥有使用该文件的权限
vi ~/.bashrc  #进入bashrc配置环境变量，编辑此文件配置两行内容
export HADOOP_HOME=/usr/local/hadoop
export PATH=.:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$PATH
source ~/.bashrc  #使环境变量生效



可输入hadoop测试看环境变量是否配好
修改 /usr/local/hadoop/etc/Hadoop/hadoop-env.sh 文件，配置jdk的路径
sudo vi hadoop-env.sh
export JAVA_HOME= jdk实际安装路径
在hadoop下/etc/hadoop/hadoop-env.sh文件下第52行后面添加下方配置：

export HADOOP_OPTS="-Djava.library.path=${HADOOP_HOME}/lib/native"

修改/usr/local/hadoop/etc/hadoop/yarn-env.sh 文件，配置jdk的路径
sudo vi yarn-env.sh
export JAVA_HOME=jdk实际安装路径
修改Hadoop配置文件，这些配置文件都放在/usr/local/hadoop/etc/hadoop目录下
sudo vi core-site.xml

<configuration>
<property>
<name>fs.defaultFS</name>
<value>hdfs://主节点主机名:8020</value>
</property>
<property>
  <name>hadoop.tmp.dir</name>
  <value>/usr/local/hadoop/tmp</value>
</property>
</configuration>
1
2
3
4
5
6
7
8
9
10
sudo vi hdfs-site.xml

<configuration>
    <property>
        <name>dfs.replication</name>
        <value>1</value>
    </property>
</configuration>
1
2
3
4
5
6
修改MapReduce配置文件
sudo vi mapred-site.xml

<configuration>
<property>
    <name>mapreduce.framework.name</name>
    <value>yarn</value>
</property>
</configuration>
1
2
3
4
5
6
sudo vi yarn-site.xml

<configuration>
<property>
    <name>yarn.nodemanager.aux-services</name>
    <value>mapreduce_shuffle</value>
</property>
<property>
  <name>yarn.resourcemanager.address</name>
  <value>主节点主机名:8032</value>
</property>
</configuration>
1
2
3
4
5
6
7
8
9
10
(8) hadoop初始化和启动
格式化hadoop文件系统：hadoop namenode -format或hdfs namenode -format
启动所有进程start-all.sh,关闭所有进程stop-all.sh
输入jps查看进程是否启动成功显示以下五个进程则成功


分开启动进程只启动hdfs：start-dfs.sh,关闭hdfs：stop-dfs.sh
输入jps查看进程只显示下面三个进程


MapReduce：start-yarn.sh,关闭：stop-yarn.sh
输入jps查看进程只显示下面两个进程
————————————————
版权声明：本文为CSDN博主「小懒胖熊」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/weixin_41895381/article/details/109032926



 ./stop-all.sh
 hdfs namenode -format
 ./start-all.sh