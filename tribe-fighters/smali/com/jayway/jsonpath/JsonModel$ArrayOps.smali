.class public interface abstract Lcom/jayway/jsonpath/JsonModel$ArrayOps;
.super Ljava/lang/Object;
.source "JsonModel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jayway/jsonpath/JsonModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ArrayOps"
.end annotation


# virtual methods
.method public abstract add(Ljava/lang/Object;)Lcom/jayway/jsonpath/JsonModel$ArrayOps;
.end method

.method public abstract addAll(Ljava/util/Collection;)Lcom/jayway/jsonpath/JsonModel$ArrayOps;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/jayway/jsonpath/JsonModel$ArrayOps;"
        }
    .end annotation
.end method

.method public abstract each(Lcom/jayway/jsonpath/Transformer;)Lcom/jayway/jsonpath/JsonModel$ArrayOps;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/jayway/jsonpath/Transformer",
            "<",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/jayway/jsonpath/JsonModel$ArrayOps;"
        }
    .end annotation
.end method

.method public abstract getTarget()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end method

.method public abstract remove(Ljava/lang/Object;)Lcom/jayway/jsonpath/JsonModel$ArrayOps;
.end method

.method public abstract set(ILjava/lang/Object;)Lcom/jayway/jsonpath/JsonModel$ArrayOps;
.end method

.method public abstract size()I
.end method

.method public abstract toList()Lcom/jayway/jsonpath/JsonModel$ListMappingModelReader;
.end method

.method public abstract toListOf(Ljava/lang/Class;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation
.end method

.method public abstract toSetOf(Ljava/lang/Class;)Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Ljava/util/Set",
            "<TT;>;"
        }
    .end annotation
.end method

.method public abstract transform(Lcom/jayway/jsonpath/Transformer;)Lcom/jayway/jsonpath/JsonModel$ArrayOps;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/jayway/jsonpath/Transformer",
            "<",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;>;)",
            "Lcom/jayway/jsonpath/JsonModel$ArrayOps;"
        }
    .end annotation
.end method
