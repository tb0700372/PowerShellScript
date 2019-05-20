#!/usr/bin/env Python
# -*- coding: UTF-8 -*-

import os

"""
找出路径下所有空目录
"""

path = r"E:\Project\CSDN_Python\Week02\Work"
def pathSize(path):
    '''
    得到路径参数,递归查找所有空目录
    '''
    fileList = os.listdir(path)
    if len(fileList)==0:
        print(path)
    for file in fileList:
        newPath = os.path.join(path, file)
        if os.path.isdir(newPath): 
            pathSize(newPath)
    return
pathSize(path)
