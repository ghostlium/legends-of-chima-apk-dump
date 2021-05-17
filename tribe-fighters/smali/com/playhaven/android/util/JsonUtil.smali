.class public Lcom/playhaven/android/util/JsonUtil;
.super Ljava/lang/Object;
.source "JsonUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/playhaven/android/util/JsonUtil$JSONIterator;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static asDouble(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Double;
    .locals 2
    .param p0, "json"    # Ljava/lang/String;
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 162
    invoke-static {p0, p1}, Lcom/playhaven/android/util/JsonUtil;->asString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 163
    .local v0, "s":Ljava/lang/String;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    .line 164
    :goto_0
    return-object v1

    :cond_0
    invoke-static {v0}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v1

    goto :goto_0
.end method

.method public static asInt(Ljava/lang/String;Ljava/lang/String;I)I
    .locals 1
    .param p0, "json"    # Ljava/lang/String;
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "defaultValue"    # I

    .prologue
    .line 141
    invoke-static {p0, p1}, Lcom/playhaven/android/util/JsonUtil;->asInteger(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    .line 142
    .local v0, "val":Ljava/lang/Integer;
    if-nez v0, :cond_0

    .line 143
    .end local p2    # "defaultValue":I
    :goto_0
    return p2

    .restart local p2    # "defaultValue":I
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result p2

    goto :goto_0
.end method

.method public static asInt(Lnet/minidev/json/JSONObject;Ljava/lang/String;I)I
    .locals 1
    .param p0, "json"    # Lnet/minidev/json/JSONObject;
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "defaultValue"    # I

    .prologue
    .line 134
    invoke-static {p0, p1}, Lcom/playhaven/android/util/JsonUtil;->asInteger(Lnet/minidev/json/JSONObject;Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    .line 135
    .local v0, "val":Ljava/lang/Integer;
    if-nez v0, :cond_0

    .line 136
    .end local p2    # "defaultValue":I
    :goto_0
    return p2

    .restart local p2    # "defaultValue":I
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result p2

    goto :goto_0
.end method

.method public static asInteger(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Integer;
    .locals 2
    .param p0, "json"    # Ljava/lang/String;
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 155
    invoke-static {p0, p1}, Lcom/playhaven/android/util/JsonUtil;->asString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 156
    .local v0, "s":Ljava/lang/String;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    .line 157
    :goto_0
    return-object v1

    :cond_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_0
.end method

.method public static asInteger(Lnet/minidev/json/JSONObject;Ljava/lang/String;)Ljava/lang/Integer;
    .locals 2
    .param p0, "json"    # Lnet/minidev/json/JSONObject;
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 148
    invoke-static {p0, p1}, Lcom/playhaven/android/util/JsonUtil;->asString(Lnet/minidev/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 149
    .local v0, "s":Ljava/lang/String;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    .line 150
    :goto_0
    return-object v1

    :cond_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_0
.end method

.method public static asLong(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Long;
    .locals 2
    .param p0, "json"    # Ljava/lang/String;
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 169
    invoke-static {p0, p1}, Lcom/playhaven/android/util/JsonUtil;->asString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 170
    .local v0, "s":Ljava/lang/String;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    .line 171
    :goto_0
    return-object v1

    :cond_0
    invoke-static {v0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v1

    goto :goto_0
.end method

.method public static asString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "json"    # Ljava/lang/String;
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 127
    const/4 v1, 0x0

    new-array v1, v1, [Lcom/jayway/jsonpath/Filter;

    invoke-static {p0, p1, v1}, Lcom/jayway/jsonpath/JsonPath;->read(Ljava/lang/String;Ljava/lang/String;[Lcom/jayway/jsonpath/Filter;)Ljava/lang/Object;

    move-result-object v0

    .line 128
    .local v0, "o":Ljava/lang/Object;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    .line 129
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static asString(Lnet/minidev/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "json"    # Lnet/minidev/json/JSONObject;
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 121
    invoke-virtual {p0}, Lnet/minidev/json/JSONObject;->toJSONString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/playhaven/android/util/JsonUtil;->asString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static forEach(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Iterable;
    .locals 2
    .param p0, "json"    # Ljava/lang/String;
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Iterable",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 102
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    :cond_0
    const/4 v1, 0x0

    .line 105
    :goto_0
    return-object v1

    .line 103
    :cond_1
    const/4 v1, 0x0

    new-array v1, v1, [Lcom/jayway/jsonpath/Filter;

    invoke-static {p0, p1, v1}, Lcom/jayway/jsonpath/JsonPath;->read(Ljava/lang/String;Ljava/lang/String;[Lcom/jayway/jsonpath/Filter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 105
    .local v0, "jsonObjects":Ljava/util/List;, "Ljava/util/List<Lnet/minidev/json/JSONObject;>;"
    new-instance v1, Lcom/playhaven/android/util/JsonUtil$1;

    invoke-direct {v1, v0}, Lcom/playhaven/android/util/JsonUtil$1;-><init>(Ljava/util/List;)V

    goto :goto_0
.end method

.method public static getPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .locals 3
    .param p0, "json"    # Ljava/lang/String;
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 35
    const/4 v2, 0x0

    :try_start_0
    new-array v2, v2, [Lcom/jayway/jsonpath/Filter;

    invoke-static {p0, p1, v2}, Lcom/jayway/jsonpath/JsonPath;->read(Ljava/lang/String;Ljava/lang/String;[Lcom/jayway/jsonpath/Filter;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/jayway/jsonpath/InvalidPathException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v1

    .line 39
    :goto_0
    return-object v1

    .line 36
    :catch_0
    move-exception v0

    .line 37
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    goto :goto_0

    .line 38
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :catch_1
    move-exception v0

    .line 39
    .local v0, "e":Lcom/jayway/jsonpath/InvalidPathException;
    goto :goto_0
.end method

.method public static getPath(Lnet/minidev/json/JSONObject;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p0, "json"    # Lnet/minidev/json/JSONObject;
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lnet/minidev/json/JSONObject;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 29
    if-nez p0, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-static {v0, p1}, Lcom/playhaven/android/util/JsonUtil;->getPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :cond_0
    invoke-virtual {p0}, Lnet/minidev/json/JSONObject;->toJSONString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static hasPath(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3
    .param p0, "json"    # Ljava/lang/String;
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 46
    const/4 v2, 0x0

    :try_start_0
    new-array v2, v2, [Lcom/jayway/jsonpath/Filter;

    invoke-static {p0, p1, v2}, Lcom/jayway/jsonpath/JsonPath;->read(Ljava/lang/String;Ljava/lang/String;[Lcom/jayway/jsonpath/Filter;)Ljava/lang/Object;
    :try_end_0
    .catch Lcom/jayway/jsonpath/InvalidPathException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    .line 48
    :cond_0
    :goto_0
    return v1

    .line 47
    :catch_0
    move-exception v0

    .line 48
    .local v0, "e":Lcom/jayway/jsonpath/InvalidPathException;
    goto :goto_0
.end method
