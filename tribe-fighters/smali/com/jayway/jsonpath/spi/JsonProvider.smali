.class public interface abstract Lcom/jayway/jsonpath/spi/JsonProvider;
.super Ljava/lang/Object;
.source "JsonProvider.java"


# virtual methods
.method public abstract clone(Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method public abstract createList()Ljava/util/List;
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

.method public abstract createMap()Ljava/util/Map;
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

.method public abstract getMapValue(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
.end method

.method public abstract getMode()Lcom/jayway/jsonpath/spi/Mode;
.end method

.method public abstract isContainer(Ljava/lang/Object;)Z
.end method

.method public abstract isList(Ljava/lang/Object;)Z
.end method

.method public abstract isMap(Ljava/lang/Object;)Z
.end method

.method public abstract parse(Ljava/io/InputStream;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jayway/jsonpath/InvalidJsonException;
        }
    .end annotation
.end method

.method public abstract parse(Ljava/io/Reader;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jayway/jsonpath/InvalidJsonException;
        }
    .end annotation
.end method

.method public abstract parse(Ljava/lang/String;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jayway/jsonpath/InvalidJsonException;
        }
    .end annotation
.end method

.method public abstract toJson(Ljava/lang/Object;)Ljava/lang/String;
.end method

.method public abstract toList(Ljava/lang/Object;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end method

.method public abstract toMap(Ljava/lang/Object;)Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end method
