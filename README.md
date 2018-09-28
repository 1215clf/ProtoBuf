# ProtoBuf
Protocol Buffers sample example
附带安装方法和.proto文件

# 一、安装Protobuf编译器

首先按照github上的顺序进行，
brew install automake
brew install libtool 
brew install protobuf
如果直接按照github上的步骤，会出现很多error，没有走下去。

所以记下了自己实践成功步骤：
1、git clone https://github.com/alexeyxo/protobuf-objc.git

localhost:~ clf$ git clone https://github.com/alexeyxo/protobuf-objc.git



2、cd ~/protobuf-objc
localhost:~ clf$ cd ~/protobuf-objc
3、./autogen.sh
localhost:protobuf-objc clf$ ./autogen.sh


4、./configure
localhost:protobuf-objc clf$ ./configure

5、make
localhost:protobuf-objc clf$ make


localhost:protobuf-objc clf$
完成后，在/usr/local/bin/目录下的protoc-gen-objc就是我们需要的编译器。

# 二、创建proto文件

在桌面创建一个文件夹为ProtoBuf

实际工作中，proto文件都是后台提供给前端的，前端以此编译成.h和.m文件导入到工程中。

cd ~/Desktop/ProtoBuf

touch person.proto

vi person.proto

示例：一个message就是一个整体，里面有哪些必要的内容，哪些可选的内容。

message LoginRequest
{
optional bytes type =1;
required bytes username=2;
required bytes password =3;

}
message LoginResponse
{
required int32 code = 1;

optional bytes token = 2;
}

生成OC的.h和.m文件

localhost:~ clf$ cd /Users/clf/ProtoBuf

localhost:ProtoBuf clf$ protoc --plugin=/usr/local/bin/protoc-gen-objc person.proto --objc_out="./"

localhost:ProtoBuf clf$

然后在当前目录下就生成了Person.pb.m和Person.pb.h文件。


# 三、工程中使用Protobuf

1、创建ProtoBuf工程
localhost:~ clf$ cd ~/Desktop/ProtoBuf

2、创建Podfile
localhost:~ clf$ touch Podfile

输入
platform :ios, ‘8.0’
use_frameworks!

target ‘ProtoBuf’ do
   pod 'ProtocolBuffers', '~> 1.9.11'
end

3、
pod install

4、将刚刚生成的.h和.m文件导入工程中，在工程中导入文件

#import <ProtocolBuffers/ProtocolBuffers.h>
#import "Person.pb.h"
就可以开始你的项目代码了。
   
