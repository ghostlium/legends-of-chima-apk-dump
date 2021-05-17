.class public interface abstract Lcom/amazon/insights/core/InsightsContext;
.super Ljava/lang/Object;
.source "InsightsContext.java"


# virtual methods
.method public abstract getConfiguration()Lcom/amazon/insights/core/configuration/Configuration;
.end method

.method public abstract getCredentials()Lcom/amazon/insights/InsightsCredentials;
.end method

.method public abstract getDeliveryClient()Lcom/amazon/insights/delivery/DeliveryClient;
.end method

.method public abstract getHttpClient()Lcom/amazon/insights/core/http/HttpClient;
.end method

.method public abstract getSDKInfo()Lcom/amazon/insights/core/util/SDKInfo;
.end method

.method public abstract getSystem()Lcom/amazon/insights/core/system/System;
.end method

.method public abstract getUniqueId()Lcom/amazon/insights/core/idresolver/Id;
.end method

.method public abstract getUserProfile()Lcom/amazon/insights/UserProfile;
.end method

.method public abstract synchronize()V
.end method
