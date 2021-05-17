.class public interface abstract Lcom/amazon/insights/core/http/HttpClient$Request;
.super Ljava/lang/Object;
.source "HttpClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/insights/core/http/HttpClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Request"
.end annotation


# virtual methods
.method public abstract addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/insights/core/http/HttpClient$Request;
.end method

.method public abstract addParam(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/insights/core/http/HttpClient$Request;
.end method

.method public abstract getHeaders()Ljava/util/Map;
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
.end method

.method public abstract getMethod()Lcom/amazon/insights/core/http/HttpClient$HttpMethod;
.end method

.method public abstract getParams()Ljava/util/Map;
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
.end method

.method public abstract getPostBody()Ljava/lang/String;
.end method

.method public abstract getPostBodyBytes()[B
.end method

.method public abstract getUrl()Ljava/lang/String;
.end method

.method public abstract removeHeader(Ljava/lang/String;)Lcom/amazon/insights/core/http/HttpClient$Request;
.end method

.method public abstract setMethod(Lcom/amazon/insights/core/http/HttpClient$HttpMethod;)Lcom/amazon/insights/core/http/HttpClient$Request;
.end method

.method public abstract setPostBody(Ljava/lang/String;)Lcom/amazon/insights/core/http/HttpClient$Request;
.end method

.method public abstract setPostBody([B)Lcom/amazon/insights/core/http/HttpClient$Request;
.end method

.method public abstract setUrl(Ljava/lang/String;)Lcom/amazon/insights/core/http/HttpClient$Request;
.end method

.method public abstract toString()Ljava/lang/String;
.end method
