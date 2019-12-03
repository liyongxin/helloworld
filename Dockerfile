# This my first django Dockerfile
# Version 1.0

# Base images 基础镜像
FROM centos:centos7.5.1804

#MAINTAINER 维护者信息
LABEL maintainer="liyongxin@chinatelecom.cn"

#ENV 设置环境变量
ENV VERSION v1.0

#RUN 执行以下命令
RUN yum install -y wget

RUN wget -P /etc/yum.repos.d/ http://mirrors.aliyun.com/repo/Centos-7.repo

RUN yum install -y  python36 python3-devel gcc

#工作目录
WORKDIR /opt

#拷贝文件至工作目录
COPY . /opt

RUN pip3 install -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com -r requirements.txt

RUN rm -rf ~/.cache/pip

#EXPOSE 映射端口
EXPOSE 8000

#容器启动时执行命令
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]