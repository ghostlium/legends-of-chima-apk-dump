.class public Lnet/minidev/json/JSONArray;
.super Ljava/util/ArrayList;
.source "JSONArray.java"

# interfaces
.implements Ljava/util/List;
.implements Lnet/minidev/json/JSONAwareEx;
.implements Lnet/minidev/json/JSONStreamAwareEx;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/ArrayList",
        "<",
        "Ljava/lang/Object;",
        ">;",
        "Ljava/util/List",
        "<",
        "Ljava/lang/Object;",
        ">;",
        "Lnet/minidev/json/JSONAwareEx;",
        "Lnet/minidev/json/JSONStreamAwareEx;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x7e6226d42d49fb00L


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    return-void
.end method

.method public static toJSONString(Ljava/util/List;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<+",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 32
    .local p0, "list":Ljava/util/List;, "Ljava/util/List<+Ljava/lang/Object;>;"
    sget-object v0, Lnet/minidev/json/JSONValue;->COMPRESSION:Lnet/minidev/json/JSONStyle;

    invoke-static {p0, v0}, Lnet/minidev/json/JSONArray;->toJSONString(Ljava/util/List;Lnet/minidev/json/JSONStyle;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toJSONString(Ljava/util/List;Lnet/minidev/json/JSONStyle;)Ljava/lang/String;
    .locals 2
    .param p1, "compression"    # Lnet/minidev/json/JSONStyle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<+",
            "Ljava/lang/Object;",
            ">;",
            "Lnet/minidev/json/JSONStyle;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 48
    .local p0, "list":Ljava/util/List;, "Ljava/util/List<+Ljava/lang/Object;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 50
    .local v0, "sb":Ljava/lang/StringBuilder;
    :try_start_0
    invoke-static {p0, v0, p1}, Lnet/minidev/json/JSONArray;->writeJSONString(Ljava/lang/Iterable;Ljava/lang/Appendable;Lnet/minidev/json/JSONStyle;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 51
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public static writeJSONString(Ljava/lang/Iterable;Ljava/lang/Appendable;Lnet/minidev/json/JSONStyle;)V
    .locals 4
    .param p1, "out"    # Ljava/lang/Appendable;
    .param p2, "compression"    # Lnet/minidev/json/JSONStyle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<+",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/Appendable;",
            "Lnet/minidev/json/JSONStyle;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 69
    .local p0, "list":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Ljava/lang/Object;>;"
    if-nez p0, :cond_0

    .line 70
    const-string v3, "null"

    invoke-interface {p1, v3}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 95
    :goto_0
    return-void

    .line 78
    :cond_0
    const/4 v0, 0x1

    .line 79
    .local v0, "first":Z
    const/16 v3, 0x5b

    invoke-interface {p1, v3}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 80
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 81
    .local v2, "value":Ljava/lang/Object;
    if-eqz v0, :cond_1

    .line 82
    const/4 v0, 0x0

    .line 85
    :goto_2
    if-nez v2, :cond_2

    .line 86
    const-string v3, "null"

    invoke-interface {p1, v3}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto :goto_1

    .line 84
    :cond_1
    const/16 v3, 0x2c

    invoke-interface {p1, v3}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    goto :goto_2

    .line 88
    :cond_2
    invoke-static {v2, p1, p2}, Lnet/minidev/json/JSONValue;->writeJSONString(Ljava/lang/Object;Ljava/lang/Appendable;Lnet/minidev/json/JSONStyle;)V

    goto :goto_1

    .line 90
    .end local v2    # "value":Ljava/lang/Object;
    :cond_3
    const/16 v3, 0x5d

    invoke-interface {p1, v3}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    goto :goto_0
.end method

.method public static writeJSONString(Ljava/util/List;Ljava/lang/Appendable;)V
    .locals 1
    .param p1, "out"    # Ljava/lang/Appendable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<+",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/Appendable;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 98
    .local p0, "list":Ljava/util/List;, "Ljava/util/List<+Ljava/lang/Object;>;"
    sget-object v0, Lnet/minidev/json/JSONValue;->COMPRESSION:Lnet/minidev/json/JSONStyle;

    invoke-static {p0, p1, v0}, Lnet/minidev/json/JSONArray;->writeJSONString(Ljava/lang/Iterable;Ljava/lang/Appendable;Lnet/minidev/json/JSONStyle;)V

    .line 99
    return-void
.end method


# virtual methods
.method public merge(Ljava/lang/Object;)V
    .locals 0
    .param p1, "o2"    # Ljava/lang/Object;

    .prologue
    .line 102
    invoke-static {p0, p1}, Lnet/minidev/json/JSONObject;->merge(Lnet/minidev/json/JSONArray;Ljava/lang/Object;)Lnet/minidev/json/JSONArray;

    .line 103
    return-void
.end method

.method public toJSONString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 109
    sget-object v0, Lnet/minidev/json/JSONValue;->COMPRESSION:Lnet/minidev/json/JSONStyle;

    invoke-static {p0, v0}, Lnet/minidev/json/JSONArray;->toJSONString(Ljava/util/List;Lnet/minidev/json/JSONStyle;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toJSONString(Lnet/minidev/json/JSONStyle;)Ljava/lang/String;
    .locals 1
    .param p1, "compression"    # Lnet/minidev/json/JSONStyle;

    .prologue
    .line 113
    invoke-static {p0, p1}, Lnet/minidev/json/JSONArray;->toJSONString(Ljava/util/List;Lnet/minidev/json/JSONStyle;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 120
    invoke-virtual {p0}, Lnet/minidev/json/JSONArray;->toJSONString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString(Lnet/minidev/json/JSONStyle;)Ljava/lang/String;
    .locals 1
    .param p1, "compression"    # Lnet/minidev/json/JSONStyle;

    .prologue
    .line 130
    invoke-virtual {p0, p1}, Lnet/minidev/json/JSONArray;->toJSONString(Lnet/minidev/json/JSONStyle;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeJSONString(Ljava/lang/Appendable;)V
    .locals 1
    .param p1, "out"    # Ljava/lang/Appendable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 134
    sget-object v0, Lnet/minidev/json/JSONValue;->COMPRESSION:Lnet/minidev/json/JSONStyle;

    invoke-static {p0, p1, v0}, Lnet/minidev/json/JSONArray;->writeJSONString(Ljava/lang/Iterable;Ljava/lang/Appendable;Lnet/minidev/json/JSONStyle;)V

    .line 135
    return-void
.end method

.method public writeJSONString(Ljava/lang/Appendable;Lnet/minidev/json/JSONStyle;)V
    .locals 0
    .param p1, "out"    # Ljava/lang/Appendable;
    .param p2, "compression"    # Lnet/minidev/json/JSONStyle;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 138
    invoke-static {p0, p1, p2}, Lnet/minidev/json/JSONArray;->writeJSONString(Ljava/lang/Iterable;Ljava/lang/Appendable;Lnet/minidev/json/JSONStyle;)V

    .line 139
    return-void
.end method
