.class public Lcom/amazon/insights/impl/DefaultInsightsCredentials;
.super Ljava/lang/Object;
.source "DefaultInsightsCredentials.java"

# interfaces
.implements Lcom/amazon/insights/InsightsCredentials;


# instance fields
.field final applicationKey:Ljava/lang/String;

.field final privateKey:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "applicationKey"    # Ljava/lang/String;
    .param p2, "privateKey"    # Ljava/lang/String;

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lcom/amazon/insights/impl/DefaultInsightsCredentials;->applicationKey:Ljava/lang/String;

    .line 17
    iput-object p2, p0, Lcom/amazon/insights/impl/DefaultInsightsCredentials;->privateKey:Ljava/lang/String;

    .line 18
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "otherCredentials"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 38
    if-nez p1, :cond_1

    .line 47
    :cond_0
    :goto_0
    return v2

    .line 40
    :cond_1
    if-ne p1, p0, :cond_2

    move v2, v1

    .line 41
    goto :goto_0

    .line 42
    :cond_2
    instance-of v3, p1, Lcom/amazon/insights/InsightsCredentials;

    if-eqz v3, :cond_0

    move-object v0, p1

    .line 45
    check-cast v0, Lcom/amazon/insights/InsightsCredentials;

    .line 47
    .local v0, "rhs":Lcom/amazon/insights/InsightsCredentials;
    invoke-virtual {p0}, Lcom/amazon/insights/impl/DefaultInsightsCredentials;->getApplicationKey()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0}, Lcom/amazon/insights/InsightsCredentials;->getApplicationKey()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-virtual {p0}, Lcom/amazon/insights/impl/DefaultInsightsCredentials;->getPrivateKey()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0}, Lcom/amazon/insights/InsightsCredentials;->getPrivateKey()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    :goto_1
    move v2, v1

    goto :goto_0

    :cond_3
    move v1, v2

    goto :goto_1
.end method

.method public getApplicationKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 22
    iget-object v0, p0, Lcom/amazon/insights/impl/DefaultInsightsCredentials;->applicationKey:Ljava/lang/String;

    return-object v0
.end method

.method public getPrivateKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 27
    iget-object v0, p0, Lcom/amazon/insights/impl/DefaultInsightsCredentials;->privateKey:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 32
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/amazon/insights/impl/DefaultInsightsCredentials;->getApplicationKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/amazon/insights/impl/DefaultInsightsCredentials;->getPrivateKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 33
    .local v0, "hash":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    return v1
.end method
