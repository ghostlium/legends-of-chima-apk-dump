.class public Lcom/amazon/insights/core/http/DefaultHttpClient$DefaultResponse;
.super Ljava/lang/Object;
.source "DefaultHttpClient.java"

# interfaces
.implements Lcom/amazon/insights/core/http/HttpClient$Response;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/insights/core/http/DefaultHttpClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DefaultResponse"
.end annotation


# instance fields
.field protected code:I

.field protected headersMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected message:Ljava/lang/String;

.field protected originatingRequest:Lcom/amazon/insights/core/http/HttpClient$Request;

.field protected requestSize:J

.field protected response:Ljava/lang/String;

.field protected responseSize:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const-wide/16 v0, 0x0

    .line 182
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 174
    iput-wide v0, p0, Lcom/amazon/insights/core/http/DefaultHttpClient$DefaultResponse;->requestSize:J

    .line 175
    iput-wide v0, p0, Lcom/amazon/insights/core/http/DefaultHttpClient$DefaultResponse;->responseSize:J

    .line 183
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/amazon/insights/core/http/DefaultHttpClient$DefaultResponse;->headersMap:Ljava/util/Map;

    .line 184
    return-void
.end method

.method static createResponse()Lcom/amazon/insights/core/http/HttpClient$Response;
    .locals 1

    .prologue
    .line 179
    new-instance v0, Lcom/amazon/insights/core/http/DefaultHttpClient$DefaultResponse;

    invoke-direct {v0}, Lcom/amazon/insights/core/http/DefaultHttpClient$DefaultResponse;-><init>()V

    return-object v0
.end method


# virtual methods
.method public addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/insights/core/http/HttpClient$Response;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 188
    iget-object v0, p0, Lcom/amazon/insights/core/http/DefaultHttpClient$DefaultResponse;->headersMap:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    return-object p0
.end method

.method public getCode()I
    .locals 1

    .prologue
    .line 261
    iget v0, p0, Lcom/amazon/insights/core/http/DefaultHttpClient$DefaultResponse;->code:I

    return v0
.end method

.method public getHeader(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 248
    const/4 v2, 0x0

    .line 249
    .local v2, "value":Ljava/lang/String;
    invoke-static {p1}, Lcom/amazon/insights/core/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 250
    iget-object v3, p0, Lcom/amazon/insights/core/http/DefaultHttpClient$DefaultResponse;->headersMap:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 251
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v3, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 252
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "value":Ljava/lang/String;
    check-cast v2, Ljava/lang/String;

    .line 257
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v1    # "i$":Ljava/util/Iterator;
    .restart local v2    # "value":Ljava/lang/String;
    :cond_1
    return-object v2
.end method

.method public getHeaders()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 243
    iget-object v0, p0, Lcom/amazon/insights/core/http/DefaultHttpClient$DefaultResponse;->headersMap:Ljava/util/Map;

    return-object v0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 265
    iget-object v0, p0, Lcom/amazon/insights/core/http/DefaultHttpClient$DefaultResponse;->message:Ljava/lang/String;

    return-object v0
.end method

.method public getOriginatingRequest()Lcom/amazon/insights/core/http/HttpClient$Request;
    .locals 1

    .prologue
    .line 215
    iget-object v0, p0, Lcom/amazon/insights/core/http/DefaultHttpClient$DefaultResponse;->originatingRequest:Lcom/amazon/insights/core/http/HttpClient$Request;

    return-object v0
.end method

.method public getRequestSize()J
    .locals 2

    .prologue
    .line 226
    iget-wide v0, p0, Lcom/amazon/insights/core/http/DefaultHttpClient$DefaultResponse;->requestSize:J

    return-wide v0
.end method

.method public getResponse()Ljava/lang/String;
    .locals 1

    .prologue
    .line 269
    iget-object v0, p0, Lcom/amazon/insights/core/http/DefaultHttpClient$DefaultResponse;->response:Ljava/lang/String;

    return-object v0
.end method

.method public getResponseSize()J
    .locals 2

    .prologue
    .line 237
    iget-wide v0, p0, Lcom/amazon/insights/core/http/DefaultHttpClient$DefaultResponse;->responseSize:J

    return-wide v0
.end method

.method public setCode(I)Lcom/amazon/insights/core/http/HttpClient$Response;
    .locals 0
    .param p1, "code"    # I

    .prologue
    .line 193
    iput p1, p0, Lcom/amazon/insights/core/http/DefaultHttpClient$DefaultResponse;->code:I

    .line 194
    return-object p0
.end method

.method public setMessage(Ljava/lang/String;)Lcom/amazon/insights/core/http/HttpClient$Response;
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 198
    iput-object p1, p0, Lcom/amazon/insights/core/http/DefaultHttpClient$DefaultResponse;->message:Ljava/lang/String;

    .line 199
    return-object p0
.end method

.method public setOriginatingRequest(Lcom/amazon/insights/core/http/HttpClient$Request;)Lcom/amazon/insights/core/http/HttpClient$Response;
    .locals 0
    .param p1, "originatingRequest"    # Lcom/amazon/insights/core/http/HttpClient$Request;

    .prologue
    .line 209
    iput-object p1, p0, Lcom/amazon/insights/core/http/DefaultHttpClient$DefaultResponse;->originatingRequest:Lcom/amazon/insights/core/http/HttpClient$Request;

    .line 210
    return-object p0
.end method

.method public setRequestSize(J)Lcom/amazon/insights/core/http/HttpClient$Response;
    .locals 0
    .param p1, "requestSize"    # J

    .prologue
    .line 220
    iput-wide p1, p0, Lcom/amazon/insights/core/http/DefaultHttpClient$DefaultResponse;->requestSize:J

    .line 221
    return-object p0
.end method

.method public setResponse(Ljava/lang/String;)Lcom/amazon/insights/core/http/HttpClient$Response;
    .locals 0
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 203
    iput-object p1, p0, Lcom/amazon/insights/core/http/DefaultHttpClient$DefaultResponse;->response:Ljava/lang/String;

    .line 204
    return-object p0
.end method

.method public setResponseSize(J)Lcom/amazon/insights/core/http/HttpClient$Response;
    .locals 0
    .param p1, "responseSize"    # J

    .prologue
    .line 231
    iput-wide p1, p0, Lcom/amazon/insights/core/http/DefaultHttpClient$DefaultResponse;->responseSize:J

    .line 232
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .prologue
    .line 274
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 275
    .local v2, "sb":Ljava/lang/StringBuffer;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "{\n\t\"code\" : \""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/amazon/insights/core/http/DefaultHttpClient$DefaultResponse;->code:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\",\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\t\"message\" : \""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/amazon/insights/core/http/DefaultHttpClient$DefaultResponse;->message:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\",\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\t\"response\" : \""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/amazon/insights/core/http/DefaultHttpClient$DefaultResponse;->response:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\",\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\t\"headers\" : {\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 279
    iget-object v3, p0, Lcom/amazon/insights/core/http/DefaultHttpClient$DefaultResponse;->headersMap:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 280
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\t\t\""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\" : \""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\",\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 282
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    const-string v3, "\t}\n}\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 283
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
