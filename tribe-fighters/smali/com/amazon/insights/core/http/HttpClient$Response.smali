.class public interface abstract Lcom/amazon/insights/core/http/HttpClient$Response;
.super Ljava/lang/Object;
.source "HttpClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/insights/core/http/HttpClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Response"
.end annotation


# virtual methods
.method public abstract addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/insights/core/http/HttpClient$Response;
.end method

.method public abstract getCode()I
.end method

.method public abstract getHeader(Ljava/lang/String;)Ljava/lang/String;
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

.method public abstract getMessage()Ljava/lang/String;
.end method

.method public abstract getOriginatingRequest()Lcom/amazon/insights/core/http/HttpClient$Request;
.end method

.method public abstract getRequestSize()J
.end method

.method public abstract getResponse()Ljava/lang/String;
.end method

.method public abstract getResponseSize()J
.end method

.method public abstract setCode(I)Lcom/amazon/insights/core/http/HttpClient$Response;
.end method

.method public abstract setMessage(Ljava/lang/String;)Lcom/amazon/insights/core/http/HttpClient$Response;
.end method

.method public abstract setOriginatingRequest(Lcom/amazon/insights/core/http/HttpClient$Request;)Lcom/amazon/insights/core/http/HttpClient$Response;
.end method

.method public abstract setRequestSize(J)Lcom/amazon/insights/core/http/HttpClient$Response;
.end method

.method public abstract setResponse(Ljava/lang/String;)Lcom/amazon/insights/core/http/HttpClient$Response;
.end method

.method public abstract setResponseSize(J)Lcom/amazon/insights/core/http/HttpClient$Response;
.end method

.method public abstract toString()Ljava/lang/String;
.end method
