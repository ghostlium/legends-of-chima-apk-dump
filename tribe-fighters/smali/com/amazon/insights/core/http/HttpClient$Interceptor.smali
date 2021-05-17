.class public interface abstract Lcom/amazon/insights/core/http/HttpClient$Interceptor;
.super Ljava/lang/Object;
.source "HttpClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/insights/core/http/HttpClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Interceptor"
.end annotation


# virtual methods
.method public abstract after(Lcom/amazon/insights/core/http/HttpClient$Response;)V
.end method

.method public abstract before(Lcom/amazon/insights/core/http/HttpClient$Request;)V
.end method
