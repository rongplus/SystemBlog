links https://blog.csdn.net/tswc_byy/article/details/83890297?ops_request_misc=%257B%2522request%255Fid%2522%253A%2522166429325416782428647584%2522%252C%2522scm%2522%253A%252220140713.130102334..%2522%257D&request_id=166429325416782428647584&biz_id=0&utm_medium=distribute.pc_search_result.none-task-blog-2~all~top_positive~default-2-83890297-null-null.142^v50^control,201^v3^control_1&utm_term=Hadoop&spm=1018.2226.3001.4187

https://blog.csdn.net/segen_jaa/article/details/8633939/

https://www.cnblogs.com/xia520pi/archive/2012/05/16/2503949.html
Hadoop集群（第5期）_Hadoop安装配置
https://www.cnblogs.com/xia520pi/archive/2012/05/16/2503949.html
Hadoop安装-超详细
https://zhuanlan.zhihu.com/p/32561305
Hadoop环境搭建
https://blog.csdn.net/tswc_byy/article/details/83890297?ops_request_misc=%257B%2522request%255Fid%2522%253A%2522166429325416782428647584%2522%252C%2522scm%2522%253A%252220140713.130102334..%2522%257D&request_id=166429325416782428647584&biz_id=0&utm_medium=distribute.pc_search_result.none-task-blog-2~all~top_positive~default-2-83890297-null-null.142^v50^control,201^v3^control_1&utm_term=Hadoop&spm=1018.2226.3001.4187

从零开始一步步教你：用C++开发一个简单的hadoop分布式计算应用程序
https://www.codelast.com/%E5%8E%9F%E5%88%9B%E4%BB%8E%E9%9B%B6%E5%BC%80%E5%A7%8B%E4%B8%80%E6%AD%A5%E6%AD%A5%E6%95%99%E4%BD%A0%EF%BC%9A%E7%94%A8c%E5%BC%80%E5%8F%91%E4%B8%80%E4%B8%AA%E7%AE%80%E5%8D%95%E7%9A%84hadoop%E5%88%86/

https://www.cnblogs.com/lanxuezaipiao/p/3648853.html
在Hadoop 2.3上运行C++程序各种疑难杂症（Hadoop Pipes选择、错误集锦、Hadoop2.3编译等）

[原创] 从零开始一步步教你：用C++开发一个简单的hadoop分布式计算应用程序
https://www.codelast.com/%E5%8E%9F%E5%88%9B%E4%BB%8E%E9%9B%B6%E5%BC%80%E5%A7%8B%E4%B8%80%E6%AD%A5%E6%AD%A5%E6%95%99%E4%BD%A0%EF%BC%9A%E7%94%A8c%E5%BC%80%E5%8F%91%E4%B8%80%E4%B8%AA%E7%AE%80%E5%8D%95%E7%9A%84hadoop%E5%88%86/

C++ Hadoop实战备忘
https://blog.csdn.net/segen_jaa/article/details/8633939/
1)创建一个名为hadoop的用户组
      sudo addgroup hadoop
    2)创建一个名为hadoop的用户，归到hadoop用户组下
      sudo adduser --ingroup hadoop hadoop
    3)用gedit打开etc下的sudoers文件
      sudo gedit /etc/sudoers
    4)在 root   ALL=(ALL)  ALL 下面添加如下一行，然后保存关闭gedit
      hadoop  ALL=(ALL)  ALL
————————————————

原文链接：https://blog.csdn.net/segen_jaa/article/details/8633939/

--
 1 Download hadopp from apache.
    tar -zxf
    mv hadoop-3.3.4 /usr/local/hadoop
    cp /usr/local/hadoop 
    export HADOOP_HOME="/usr/local/hadoop"
 2 evn setting ~/.bashrc
    export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64/"
    echo "export HADOOP_HOME=/usr/local/hadoop"echo "export HADOOP_HOME=/usr/local/hadoop" >> /etc/bashrc
    echo "export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin" >> /etc/bashrc
 3 generate ssh key
    ssh-keygen -t rsa (ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa)
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
    chmod 0600 ~/.ssh/authorized_keys



https://phoenixnap.com/kb/install-hadoop-ubuntu
 4 hadoop
    sudo nano $HADOOP_HOME/etc/hadoop/core-site.xml
    ```
    <configuration>
<property>
<name>hadoop.tmp.dir</name>
<value>/home/hdoop/tmpdata</value>
</property>
<property>
<name>fs.default.name</name>
<value>hdfs://127.0.0.1:9000</value>
</property>
</configuration>
```

$HADOOP_HOME/etc/hadoop/hdfs-site.xml
```
<configuration>
<property>
<name>dfs.data.dir</name>
<value>/home/hdoop/dfsdata/namenode</value>
</property>
<property>
<name>dfs.data.dir</name>
<value>/home/hdoop/dfsdata/datanode</value>
</property>
<property>
<name>dfs.replication</name>
<value>1</value>
</property>
</configuration>
```
  mapred-site.xml
  ```
  <configuration>
<property>
<name>mapreduce.framework.name</name>
<value>yarn</value>
</property>
</configuration>
```


yarn-site.xml
```
<configuration>
<property>
<name>yarn.nodemanager.aux-services</name>
<value>mapreduce_shuffle</value>
</property>
<property>
<name>yarn.nodemanager.aux-services.mapreduce.shuffle.class</name>
<value>org.apache.hadoop.mapred.ShuffleHandler</value>
</property>
<property>
<name>yarn.resourcemanager.hostname</name>
<value>127.0.0.1</value>
</property>
<property>
<name>yarn.acl.enable</name>
<value>0</value>
</property>
<property>
<name>yarn.nodemanager.env-whitelist</name>   
<value>JAVA_HOME,HADOOP_COMMON_HOME,HADOOP_HDFS_HOME,HADOOP_CONF_DIR,CLASSPATH_PERPEND_DISTCACHE,HADOOP_YARN_HOME,HADOOP_MAPRED_HOME</value>
</property>
</configuration>
```


5 Format HDFS NameNode
    hdfs namenode -format




6 use hadoop
hadoop pipes -D hadoop.pipes.java.recordreader=true -D hadoop.pipes.java.recordwriter=true -program /bin/dd


--- build
g++ d.cpp -o dd  -I/usr/local/hadoop/include -L/usr/local/hadoop/lib/native -L/usr/lib/jvm/java-11-openjdk-amd64/lib/server -ljvm -lhadooppipes -lhadooputils -lpthread -lssl -lcrypto

-- put to 
hadoop fs -mkdir /bin
hadoop fs -put counter /bin
hadoop fs -ls /bin
--- add data
hadoop fs -put num.txt /data

---run
hadoop fs -rm -r /output
hadoop pipes -conf job_config.xml -input /data/num.txt -output /output -program /bin/counter

/usr/local/hadoop/share/hadoop/mapreduce$ hadoop jar hadoop-mapreduce-examples-3.3.4.jar wordcount /data  /output


hadoop jar hadoop-mapreduce-examples-3.3.4.jar wordcount -input /data  -output /output
hadoop jar hadoop-mapreduce-examples-3.3.4.jar wordcount /data /output
hadoop /bin/counter -conf job_config.xml -input /data/num.txt -output /output 

hadoop pipes -D hadoop.pipes.java.recordreader=true -D hadoop.pipes.java.recordwriter=true -input /data/num.txt -output /output_dd -program /bin/dd

运行C++程序， 需要 -input -output,
运行java程序， 不需要 -input -output,