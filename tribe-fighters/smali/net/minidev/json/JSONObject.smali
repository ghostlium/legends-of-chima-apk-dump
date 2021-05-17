.class public Lnet/minidev/json/JSONObject;
.super Ljava/util/HashMap;
.source "JSONObject.java"

# interfaces
.implements Lnet/minidev/json/JSONAware;
.implements Lnet/minidev/json/JSONAwareEx;
.implements Lnet/minidev/json/JSONStreamAwareEx;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/HashMap",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Object;",
        ">;",
        "Lnet/minidev/json/JSONAware;",
        "Lnet/minidev/json/JSONAwareEx;",
        "Lnet/minidev/json/JSONStreamAwareEx;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x6fc977743e77bbcL


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 34
    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "*>;)V"
        }
    .end annotation

    .prologue
    .line 131
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;*>;"
    invoke-direct {p0, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 132
    return-void
.end method

.method public static escape(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 52
    invoke-static {p0}, Lnet/minidev/json/JSONValue;->escape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected static merge(Lnet/minidev/json/JSONArray;Ljava/lang/Object;)Lnet/minidev/json/JSONArray;
    .locals 1
    .param p0, "o1"    # Lnet/minidev/json/JSONArray;
    .param p1, "o2"    # Ljava/lang/Object;

    .prologue
    .line 235
    if-nez p1, :cond_0

    .line 240
    .end local p0    # "o1":Lnet/minidev/json/JSONArray;
    .end local p1    # "o2":Ljava/lang/Object;
    :goto_0
    return-object p0

    .line 237
    .restart local p0    # "o1":Lnet/minidev/json/JSONArray;
    .restart local p1    # "o2":Ljava/lang/Object;
    :cond_0
    instance-of v0, p0, Lnet/minidev/json/JSONArray;

    if-eqz v0, :cond_1

    .line 238
    check-cast p1, Lnet/minidev/json/JSONArray;

    .end local p1    # "o2":Ljava/lang/Object;
    invoke-static {p0, p1}, Lnet/minidev/json/JSONObject;->merge(Lnet/minidev/json/JSONArray;Lnet/minidev/json/JSONArray;)Lnet/minidev/json/JSONArray;

    move-result-object p0

    goto :goto_0

    .line 239
    .restart local p1    # "o2":Ljava/lang/Object;
    :cond_1
    invoke-virtual {p0, p1}, Lnet/minidev/json/JSONArray;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method private static merge(Lnet/minidev/json/JSONArray;Lnet/minidev/json/JSONArray;)Lnet/minidev/json/JSONArray;
    .locals 0
    .param p0, "o1"    # Lnet/minidev/json/JSONArray;
    .param p1, "o2"    # Lnet/minidev/json/JSONArray;

    .prologue
    .line 244
    invoke-virtual {p0, p1}, Lnet/minidev/json/JSONArray;->addAll(Ljava/util/Collection;)Z

    .line 245
    return-object p0
.end method

.method protected static merge(Lnet/minidev/json/JSONObject;Ljava/lang/Object;)Lnet/minidev/json/JSONObject;
    .locals 3
    .param p0, "o1"    # Lnet/minidev/json/JSONObject;
    .param p1, "o2"    # Ljava/lang/Object;

    .prologue
    .line 199
    if-nez p1, :cond_0

    .line 202
    .end local p0    # "o1":Lnet/minidev/json/JSONObject;
    .end local p1    # "o2":Ljava/lang/Object;
    :goto_0
    return-object p0

    .line 201
    .restart local p0    # "o1":Lnet/minidev/json/JSONObject;
    .restart local p1    # "o2":Ljava/lang/Object;
    :cond_0
    instance-of v0, p1, Lnet/minidev/json/JSONObject;

    if-eqz v0, :cond_1

    .line 202
    check-cast p1, Lnet/minidev/json/JSONObject;

    .end local p1    # "o2":Ljava/lang/Object;
    invoke-static {p0, p1}, Lnet/minidev/json/JSONObject;->merge(Lnet/minidev/json/JSONObject;Lnet/minidev/json/JSONObject;)Lnet/minidev/json/JSONObject;

    move-result-object p0

    goto :goto_0

    .line 203
    .restart local p1    # "o2":Ljava/lang/Object;
    :cond_1
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "JSON megre can not merge JSONObject with "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static merge(Lnet/minidev/json/JSONObject;Lnet/minidev/json/JSONObject;)Lnet/minidev/json/JSONObject;
    .locals 7
    .param p0, "o1"    # Lnet/minidev/json/JSONObject;
    .param p1, "o2"    # Lnet/minidev/json/JSONObject;

    .prologue
    .line 207
    if-nez p1, :cond_1

    .line 231
    :cond_0
    return-object p0

    .line 209
    :cond_1
    invoke-virtual {p0}, Lnet/minidev/json/JSONObject;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_2
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 210
    .local v1, "key":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lnet/minidev/json/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 211
    .local v2, "value1":Ljava/lang/Object;
    invoke-virtual {p1, v1}, Lnet/minidev/json/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 212
    .local v3, "value2":Ljava/lang/Object;
    if-eqz v3, :cond_2

    .line 214
    instance-of v4, v2, Lnet/minidev/json/JSONArray;

    if-eqz v4, :cond_3

    .line 215
    check-cast v2, Lnet/minidev/json/JSONArray;

    .end local v2    # "value1":Ljava/lang/Object;
    invoke-static {v2, v3}, Lnet/minidev/json/JSONObject;->merge(Lnet/minidev/json/JSONArray;Ljava/lang/Object;)Lnet/minidev/json/JSONArray;

    move-result-object v4

    invoke-virtual {p0, v1, v4}, Lnet/minidev/json/JSONObject;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 218
    .restart local v2    # "value1":Ljava/lang/Object;
    :cond_3
    instance-of v4, v2, Lnet/minidev/json/JSONObject;

    if-eqz v4, :cond_4

    .line 219
    check-cast v2, Lnet/minidev/json/JSONObject;

    .end local v2    # "value1":Ljava/lang/Object;
    invoke-static {v2, v3}, Lnet/minidev/json/JSONObject;->merge(Lnet/minidev/json/JSONObject;Ljava/lang/Object;)Lnet/minidev/json/JSONObject;

    move-result-object v4

    invoke-virtual {p0, v1, v4}, Lnet/minidev/json/JSONObject;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 222
    .restart local v2    # "value1":Ljava/lang/Object;
    :cond_4
    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 224
    new-instance v4, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "JSON megre can not merge "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " with "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 226
    .end local v1    # "key":Ljava/lang/String;
    .end local v2    # "value1":Ljava/lang/Object;
    .end local v3    # "value2":Ljava/lang/Object;
    :cond_5
    invoke-virtual {p1}, Lnet/minidev/json/JSONObject;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_6
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 227
    .restart local v1    # "key":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lnet/minidev/json/JSONObject;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_6

    .line 229
    invoke-virtual {p1, v1}, Lnet/minidev/json/JSONObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p0, v1, v4}, Lnet/minidev/json/JSONObject;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1
.end method

.method public static toJSONString(Ljava/util/Map;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "+",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 56
    .local p0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;+Ljava/lang/Object;>;"
    sget-object v0, Lnet/minidev/json/JSONValue;->COMPRESSION:Lnet/minidev/json/JSONStyle;

    invoke-static {p0, v0}, Lnet/minidev/json/JSONObject;->toJSONString(Ljava/util/Map;Lnet/minidev/json/JSONStyle;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toJSONString(Ljava/util/Map;Lnet/minidev/json/JSONStyle;)Ljava/lang/String;
    .locals 2
    .param p1, "compression"    # Lnet/minidev/json/JSONStyle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "+",
            "Ljava/lang/Object;",
            ">;",
            "Lnet/minidev/json/JSONStyle;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 70
    .local p0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;+Ljava/lang/Object;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 72
    .local v0, "sb":Ljava/lang/StringBuilder;
    :try_start_0
    invoke-static {p0, v0, p1}, Lnet/minidev/json/JSONObject;->writeJSON(Ljava/util/Map;Ljava/lang/Appendable;Lnet/minidev/json/JSONStyle;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 73
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public static writeJSON(Ljava/util/Map;Ljava/lang/Appendable;)V
    .locals 1
    .param p1, "out"    # Ljava/lang/Appendable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
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
    .line 135
    .local p0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    sget-object v0, Lnet/minidev/json/JSONValue;->COMPRESSION:Lnet/minidev/json/JSONStyle;

    invoke-static {p0, p1, v0}, Lnet/minidev/json/JSONObject;->writeJSON(Ljava/util/Map;Ljava/lang/Appendable;Lnet/minidev/json/JSONStyle;)V

    .line 136
    return-void
.end method

.method public static writeJSON(Ljava/util/Map;Ljava/lang/Appendable;Lnet/minidev/json/JSONStyle;)V
    .locals 5
    .param p1, "out"    # Ljava/lang/Appendable;
    .param p2, "compression"    # Lnet/minidev/json/JSONStyle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "+",
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
    .line 147
    .local p0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;+Ljava/lang/Object;>;"
    if-nez p0, :cond_0

    .line 148
    const-string v3, "null"

    invoke-interface {p1, v3}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 178
    :goto_0
    return-void

    .line 153
    :cond_0
    const/4 v1, 0x1

    .line 158
    .local v1, "first":Z
    const/16 v3, 0x7b

    invoke-interface {p1, v3}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 162
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 163
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<**>;"
    if-eqz v1, :cond_1

    .line 164
    const/4 v1, 0x0

    .line 169
    :goto_2
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-static {v3, v4, p1, p2}, Lnet/minidev/json/JSONObject;->writeJSONKV(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Appendable;Lnet/minidev/json/JSONStyle;)V

    goto :goto_1

    .line 166
    :cond_1
    const/16 v3, 0x2c

    invoke-interface {p1, v3}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    goto :goto_2

    .line 174
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<**>;"
    :cond_2
    const/16 v3, 0x7d

    invoke-interface {p1, v3}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    goto :goto_0
.end method

.method public static writeJSONKV(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Appendable;Lnet/minidev/json/JSONStyle;)V
    .locals 2
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "out"    # Ljava/lang/Appendable;
    .param p3, "compression"    # Lnet/minidev/json/JSONStyle;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v1, 0x22

    .line 83
    if-nez p0, :cond_0

    .line 84
    const-string v0, "null"

    invoke-interface {p2, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 92
    :goto_0
    const/16 v0, 0x3a

    invoke-interface {p2, v0}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 93
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_3

    move-object v0, p1

    .line 94
    check-cast v0, Ljava/lang/String;

    invoke-virtual {p3, v0}, Lnet/minidev/json/JSONStyle;->mustProtectValue(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 95
    check-cast p1, Ljava/lang/String;

    .end local p1    # "value":Ljava/lang/Object;
    invoke-interface {p2, p1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 103
    :goto_1
    return-void

    .line 85
    .restart local p1    # "value":Ljava/lang/Object;
    :cond_0
    invoke-virtual {p3, p0}, Lnet/minidev/json/JSONStyle;->mustProtectKey(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 86
    invoke-interface {p2, p0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto :goto_0

    .line 88
    :cond_1
    invoke-interface {p2, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 89
    invoke-static {p0, p2, p3}, Lnet/minidev/json/JSONValue;->escape(Ljava/lang/String;Ljava/lang/Appendable;Lnet/minidev/json/JSONStyle;)V

    .line 90
    invoke-interface {p2, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    goto :goto_0

    .line 97
    :cond_2
    invoke-interface {p2, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 98
    check-cast p1, Ljava/lang/String;

    .end local p1    # "value":Ljava/lang/Object;
    invoke-static {p1, p2, p3}, Lnet/minidev/json/JSONValue;->escape(Ljava/lang/String;Ljava/lang/Appendable;Lnet/minidev/json/JSONStyle;)V

    .line 99
    invoke-interface {p2, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    goto :goto_1

    .line 102
    .restart local p1    # "value":Ljava/lang/Object;
    :cond_3
    invoke-static {p1, p2, p3}, Lnet/minidev/json/JSONValue;->writeJSONString(Ljava/lang/Object;Ljava/lang/Appendable;Lnet/minidev/json/JSONStyle;)V

    goto :goto_1
.end method


# virtual methods
.method public merge(Ljava/lang/Object;)V
    .locals 0
    .param p1, "o2"    # Ljava/lang/Object;

    .prologue
    .line 195
    invoke-static {p0, p1}, Lnet/minidev/json/JSONObject;->merge(Lnet/minidev/json/JSONObject;Ljava/lang/Object;)Lnet/minidev/json/JSONObject;

    .line 196
    return-void
.end method

.method public toJSONString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 249
    sget-object v0, Lnet/minidev/json/JSONValue;->COMPRESSION:Lnet/minidev/json/JSONStyle;

    invoke-static {p0, v0}, Lnet/minidev/json/JSONObject;->toJSONString(Ljava/util/Map;Lnet/minidev/json/JSONStyle;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toJSONString(Lnet/minidev/json/JSONStyle;)Ljava/lang/String;
    .locals 1
    .param p1, "compression"    # Lnet/minidev/json/JSONStyle;

    .prologue
    .line 253
    invoke-static {p0, p1}, Lnet/minidev/json/JSONObject;->toJSONString(Ljava/util/Map;Lnet/minidev/json/JSONStyle;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 261
    sget-object v0, Lnet/minidev/json/JSONValue;->COMPRESSION:Lnet/minidev/json/JSONStyle;

    invoke-static {p0, v0}, Lnet/minidev/json/JSONObject;->toJSONString(Ljava/util/Map;Lnet/minidev/json/JSONStyle;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString(Lnet/minidev/json/JSONStyle;)Ljava/lang/String;
    .locals 1
    .param p1, "compression"    # Lnet/minidev/json/JSONStyle;

    .prologue
    .line 257
    invoke-static {p0, p1}, Lnet/minidev/json/JSONObject;->toJSONString(Ljava/util/Map;Lnet/minidev/json/JSONStyle;)Ljava/lang/String;

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
    .line 184
    sget-object v0, Lnet/minidev/json/JSONValue;->COMPRESSION:Lnet/minidev/json/JSONStyle;

    invoke-static {p0, p1, v0}, Lnet/minidev/json/JSONObject;->writeJSON(Ljava/util/Map;Ljava/lang/Appendable;Lnet/minidev/json/JSONStyle;)V

    .line 185
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
    .line 191
    invoke-static {p0, p1, p2}, Lnet/minidev/json/JSONObject;->writeJSON(Ljava/util/Map;Ljava/lang/Appendable;Lnet/minidev/json/JSONStyle;)V

    .line 192
    return-void
.end method
