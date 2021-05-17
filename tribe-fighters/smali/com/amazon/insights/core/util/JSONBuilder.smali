.class public Lcom/amazon/insights/core/util/JSONBuilder;
.super Ljava/lang/Object;
.source "JSONBuilder.java"

# interfaces
.implements Lcom/amazon/insights/core/util/JSONSerializable;


# instance fields
.field private json:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 2
    .param p1, "component"    # Ljava/lang/Object;

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/amazon/insights/core/util/JSONBuilder;->json:Lorg/json/JSONObject;

    .line 15
    if-eqz p1, :cond_0

    .line 16
    const-string v0, "class"

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/amazon/insights/core/util/JSONBuilder;->withAttribute(Ljava/lang/String;Ljava/lang/Object;)Lcom/amazon/insights/core/util/JSONBuilder;

    .line 17
    const-string v0, "hashCode"

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/amazon/insights/core/util/JSONBuilder;->withAttribute(Ljava/lang/String;Ljava/lang/Object;)Lcom/amazon/insights/core/util/JSONBuilder;

    .line 19
    :cond_0
    return-void
.end method


# virtual methods
.method public toJSONObject()Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 33
    iget-object v0, p0, Lcom/amazon/insights/core/util/JSONBuilder;->json:Lorg/json/JSONObject;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 39
    :try_start_0
    iget-object v1, p0, Lcom/amazon/insights/core/util/JSONBuilder;->json:Lorg/json/JSONObject;

    if-eqz v1, :cond_0

    .line 40
    iget-object v1, p0, Lcom/amazon/insights/core/util/JSONBuilder;->json:Lorg/json/JSONObject;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v1

    .line 45
    :goto_0
    return-object v1

    .line 42
    :cond_0
    const-string v1, ""
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 44
    :catch_0
    move-exception v0

    .line 45
    .local v0, "e":Lorg/json/JSONException;
    iget-object v1, p0, Lcom/amazon/insights/core/util/JSONBuilder;->json:Lorg/json/JSONObject;

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public withAttribute(Ljava/lang/String;Ljava/lang/Object;)Lcom/amazon/insights/core/util/JSONBuilder;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 22
    instance-of v1, p2, Lcom/amazon/insights/core/util/JSONSerializable;

    if-eqz v1, :cond_0

    check-cast p2, Lcom/amazon/insights/core/util/JSONSerializable;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-interface {p2}, Lcom/amazon/insights/core/util/JSONSerializable;->toJSONObject()Lorg/json/JSONObject;

    move-result-object v0

    .line 24
    .local v0, "jsonValue":Ljava/lang/Object;
    :goto_0
    :try_start_0
    iget-object v1, p0, Lcom/amazon/insights/core/util/JSONBuilder;->json:Lorg/json/JSONObject;

    invoke-virtual {v1, p1, v0}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    :goto_1
    return-object p0

    .end local v0    # "jsonValue":Ljava/lang/Object;
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_0
    move-object v0, p2

    .line 22
    goto :goto_0

    .line 25
    .end local p2    # "value":Ljava/lang/Object;
    .restart local v0    # "jsonValue":Ljava/lang/Object;
    :catch_0
    move-exception v1

    goto :goto_1
.end method
