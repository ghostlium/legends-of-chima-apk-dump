.class public interface abstract Lcom/jayway/jsonpath/JsonModel$ObjectOps;
.super Ljava/lang/Object;
.source "JsonModel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jayway/jsonpath/JsonModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ObjectOps"
.end annotation


# virtual methods
.method public abstract containsKey(Ljava/lang/String;)Z
.end method

.method public abstract get(Ljava/lang/String;)Ljava/lang/Object;
.end method

.method public abstract getDouble(Ljava/lang/String;)Ljava/lang/Double;
.end method

.method public abstract getInteger(Ljava/lang/String;)Ljava/lang/Integer;
.end method

.method public abstract getLong(Ljava/lang/String;)Ljava/lang/Long;
.end method

.method public abstract getString(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getTarget()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end method

.method public abstract put(Ljava/lang/String;Ljava/lang/Object;)Lcom/jayway/jsonpath/JsonModel$ObjectOps;
.end method

.method public abstract putAll(Ljava/util/Map;)Lcom/jayway/jsonpath/JsonModel$ObjectOps;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/jayway/jsonpath/JsonModel$ObjectOps;"
        }
    .end annotation
.end method

.method public abstract putIfAbsent(Ljava/lang/String;Ljava/lang/Object;)Lcom/jayway/jsonpath/JsonModel$ObjectOps;
.end method

.method public abstract remove(Ljava/lang/String;)Lcom/jayway/jsonpath/JsonModel$ObjectOps;
.end method

.method public abstract to(Ljava/lang/Class;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation
.end method

.method public abstract transform(Lcom/jayway/jsonpath/Transformer;)Lcom/jayway/jsonpath/JsonModel$ObjectOps;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/jayway/jsonpath/Transformer",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;)",
            "Lcom/jayway/jsonpath/JsonModel$ObjectOps;"
        }
    .end annotation
.end method
