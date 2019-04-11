//
//  main.m
//  cJSONTest
//
//  Created by 韩帆 on 2019/4/10.
//  Copyright © 2019 hancc. All rights reserved.
//

#import <Foundation/Foundation.h>
#include"cJSON.h"



void cJSON_test1(){
    char *data = "{\"love\":[\"LOL\",\"Go shopping\"]}";
    printf("长度:%ld\n",strlen(data));
    
    //从缓冲区中解析出JSON结构
    cJSON * json= cJSON_Parse(data);
    
    //将传入的JSON结构转化为字符串 并打印
    char *json_data = NULL;
    printf("data:%s\n",json_data = cJSON_Print(json));
    
    free(json_data);
    cJSON_Delete(json);
}
void cJSON_test2(){
    //创建一个空的文档（对象）
    cJSON *json = cJSON_CreateObject();
    
    //向文档中增加一个键值对{"name":"王大锤"}
    cJSON_AddItemToObject(json,"name",cJSON_CreateString("王大锤"));
    //向文档中添加一个键值对
    //cJSON_AddItemToObject(json,"age",cJSON_CreateNumber(29));
    cJSON_AddNumberToObject(json,"age",29);
    
    cJSON *array = NULL;
    cJSON_AddItemToObject(json,"love",array=cJSON_CreateArray());
    cJSON_AddItemToArray(array,cJSON_CreateString("LOL"));
    cJSON_AddItemToArray(array,cJSON_CreateString("NBA"));
    cJSON_AddItemToArray(array,cJSON_CreateString("Go shopping"));
    
    cJSON_AddNumberToObject(json,"score",59);
    cJSON_AddStringToObject(json,"address","beijing");
    
    //将json结构格式化到缓冲区
    char *buf = cJSON_Print(json);
    printf("data:%s\n",buf = cJSON_Print(json));
    free(buf);
    //释放json结构所占用的内存
    cJSON_Delete(json);
}
void cJSON_test3(){
     //先创建空对象
     cJSON *json = cJSON_CreateObject();
     //在对象上添加键值对
     cJSON_AddStringToObject(json,"country","china");
     //添加数组
     cJSON *array = NULL;
     cJSON_AddItemToObject(json,"stars",array=cJSON_CreateArray());
    
     //在数组上添加对象
     cJSON *obj =  cJSON_CreateObject();
     //在对象上添加键值对
     cJSON_AddItemToObject(obj,"name",cJSON_CreateString("andy"));
     cJSON_AddItemToObject(obj,"address",cJSON_CreateString("HK"));
     cJSON_AddNumberToObject(obj, "phoneNum", 18665945497);
     cJSON_AddNumberToObject(obj, "temperature", 24.5f);
     cJSON_AddItemToArray(array,obj);
    
    
     cJSON *obj1 = cJSON_CreateObject();
     cJSON_AddItemToObject(obj1,"name",cJSON_CreateString("Faye"));
     cJSON_AddStringToObject(obj1,"address","beijing");

     cJSON_AddItemToArray(array,obj1);


     cJSON *obj2 = cJSON_CreateObject();
     cJSON_AddStringToObject(obj2,"name","eddie");
     cJSON_AddStringToObject(obj2,"address","TaiWan");
     cJSON_AddItemToArray(array,obj2);

    cJSON *node = NULL;
    node = cJSON_GetObjectItem(obj,"temperature");
    if(node == NULL){
        printf("country node == NULL\n");
    }
    else{
        printf("found country node,country:%f\n",node->valuedouble);
    }
    
    
    //将json结构格式化到缓冲区
     char *buf = cJSON_Print(json);
     printf("data:%s\n",buf = cJSON_Print(json));
     free(buf);
     cJSON_Delete(json);
}

void cJSON_test4(){
         char *string = "{\"family\":[\"father\",\"mother\",\"brother\",\"sister\",\"somebody\"]}";
         //从缓冲区中解析出JSON结构
         cJSON *json = cJSON_Parse(string);
         cJSON *node = NULL;
    
        //判断是否有key是string的项 如果有返回1 否则返回0
        if(1 == cJSON_HasObjectItem(json,"family")){
            printf("found family node\n");
        }else{
            printf("not found family node\n");
        }
        if(1 == cJSON_HasObjectItem(json,"famil")){
            printf("found famil node\n");
        }else{
            printf("not found famil node\n");
        }
        node = cJSON_GetObjectItem(json,"family");
    
        // 判断是什么类型的
        if(node->type == cJSON_Array){
            //非array类型的node 被当做array获取size的大小是未定义的行为 不要使用
            printf("array size is %d\n\n",cJSON_GetArraySize(node));
        }
    
    
         cJSON *tnode = NULL;
         int size = cJSON_GetArraySize(node);
         int i;
         for(i=0;i<size;i++){
            tnode = cJSON_GetArrayItem(node,i);
            if(tnode->type == cJSON_String){
               printf("value[%d]:%s\n",i,tnode->valuestring);
            }else{
               printf("node' type is not string\n");
            }
        }
        printf("\n\n");
    
        // 遍历
        cJSON_ArrayForEach(tnode,node){
            if(tnode->type == cJSON_String){
                printf("int forEach: vale:%s\n",tnode->valuestring);
            }else{
                printf("node's type is not string\n");
            }
        }
}
void cJSON_test5(){
    char *data = "{\"love\":[\"LOL\",\"Go shopping\"]}";
    printf("长度:%ld\n",strlen(data));
    
    //从缓冲区中解析出JSON结构
    cJSON * json= cJSON_Parse(data);
    
    //将传入的JSON结构转化为字符串 并打印
    char *json_data = NULL;
    printf("data:%s\n",json_data = cJSON_Print(json));
    
    free(json_data);
    cJSON_Delete(json);
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {

//        cJSON_test1();
//        cJSON_test2();
        cJSON_test3();
//        cJSON_test4();
    }
    return 0;
}

