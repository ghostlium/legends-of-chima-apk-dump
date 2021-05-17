.class public Lcom/flurry/android/AppCloudObjectProxy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/android/AppCloudObserver;


# instance fields
.field private dD:Lcom/flurry/android/AppCloudObject;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/flurry/android/AppCloudObjectProxy;->dD:Lcom/flurry/android/AppCloudObject;

    .line 15
    invoke-static {p1}, Lcom/flurry/android/AppCloudObject;->create(Ljava/lang/String;)Lcom/flurry/android/AppCloudObject;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/android/AppCloudObjectProxy;->dD:Lcom/flurry/android/AppCloudObject;

    .line 16
    return-void
.end method


# virtual methods
.method public addObserverForKey(Ljava/lang/String;Lcom/flurry/android/AppCloudValueUpdateHandler;)V
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lcom/flurry/android/AppCloudObjectProxy;->dD:Lcom/flurry/android/AppCloudObject;

    invoke-virtual {v0, p1, p2}, Lcom/flurry/android/AppCloudObject;->addObserverForKey(Ljava/lang/String;Lcom/flurry/android/AppCloudValueUpdateHandler;)V

    .line 91
    return-void
.end method

.method public containsObserver()Z
    .locals 1

    .prologue
    .line 110
    iget-object v0, p0, Lcom/flurry/android/AppCloudObjectProxy;->dD:Lcom/flurry/android/AppCloudObject;

    invoke-virtual {v0}, Lcom/flurry/android/AppCloudObject;->containsObserver()Z

    move-result v0

    return v0
.end method

.method public decrement(Ljava/lang/String;FLcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 85
    iget-object v0, p0, Lcom/flurry/android/AppCloudObjectProxy;->dD:Lcom/flurry/android/AppCloudObject;

    invoke-virtual {v0, p1, p2, p3}, Lcom/flurry/android/AppCloudObject;->decrement(Ljava/lang/String;FLcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V

    .line 86
    return-void
.end method

.method public decrement(Ljava/lang/String;ILcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 79
    iget-object v0, p0, Lcom/flurry/android/AppCloudObjectProxy;->dD:Lcom/flurry/android/AppCloudObject;

    invoke-virtual {v0, p1, p2, p3}, Lcom/flurry/android/AppCloudObject;->decrement(Ljava/lang/String;ILcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V

    .line 81
    return-void
.end method

.method public deleteWithCompletionHandler(Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 46
    iget-object v0, p0, Lcom/flurry/android/AppCloudObjectProxy;->dD:Lcom/flurry/android/AppCloudObject;

    invoke-virtual {v0, p1}, Lcom/flurry/android/AppCloudObject;->deleteWithCompletionHandler(Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V

    .line 47
    return-void
.end method

.method public get(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 30
    iget-object v0, p0, Lcom/flurry/android/AppCloudObjectProxy;->dD:Lcom/flurry/android/AppCloudObject;

    invoke-virtual {v0, p1}, Lcom/flurry/android/AppCloudObject;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCollectionName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/flurry/android/AppCloudObjectProxy;->dD:Lcom/flurry/android/AppCloudObject;

    invoke-virtual {v0}, Lcom/flurry/android/AppCloudObject;->getCollectionName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFloat(Ljava/lang/String;)F
    .locals 1

    .prologue
    .line 25
    iget-object v0, p0, Lcom/flurry/android/AppCloudObjectProxy;->dD:Lcom/flurry/android/AppCloudObject;

    invoke-virtual {v0, p1}, Lcom/flurry/android/AppCloudObject;->getFloat(Ljava/lang/String;)F

    move-result v0

    return v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/flurry/android/AppCloudObjectProxy;->dD:Lcom/flurry/android/AppCloudObject;

    invoke-virtual {v0}, Lcom/flurry/android/AppCloudObject;->getId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getInt(Ljava/lang/String;)I
    .locals 1

    .prologue
    .line 20
    iget-object v0, p0, Lcom/flurry/android/AppCloudObjectProxy;->dD:Lcom/flurry/android/AppCloudObject;

    invoke-virtual {v0, p1}, Lcom/flurry/android/AppCloudObject;->getInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getKeyValues()Ljava/util/Vector;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Vector",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;"
        }
    .end annotation

    .prologue
    .line 62
    iget-object v0, p0, Lcom/flurry/android/AppCloudObjectProxy;->dD:Lcom/flurry/android/AppCloudObject;

    invoke-virtual {v0}, Lcom/flurry/android/AppCloudObject;->getKeyValues()Ljava/util/Vector;

    move-result-object v0

    return-object v0
.end method

.method public getWithCompletionHandler(Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 40
    iget-object v0, p0, Lcom/flurry/android/AppCloudObjectProxy;->dD:Lcom/flurry/android/AppCloudObject;

    invoke-virtual {v0, p1}, Lcom/flurry/android/AppCloudObject;->getWithCompletionHandler(Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V

    .line 42
    return-void
.end method

.method public increment(Ljava/lang/String;FLcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 74
    iget-object v0, p0, Lcom/flurry/android/AppCloudObjectProxy;->dD:Lcom/flurry/android/AppCloudObject;

    invoke-virtual {v0, p1, p2, p3}, Lcom/flurry/android/AppCloudObject;->increment(Ljava/lang/String;FLcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V

    .line 75
    return-void
.end method

.method public increment(Ljava/lang/String;ILcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 67
    iget-object v0, p0, Lcom/flurry/android/AppCloudObjectProxy;->dD:Lcom/flurry/android/AppCloudObject;

    invoke-virtual {v0, p1, p2, p3}, Lcom/flurry/android/AppCloudObject;->increment(Ljava/lang/String;ILcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V

    .line 69
    return-void
.end method

.method public isAutoSyncEnabled()Z
    .locals 1

    .prologue
    .line 120
    iget-object v0, p0, Lcom/flurry/android/AppCloudObjectProxy;->dD:Lcom/flurry/android/AppCloudObject;

    invoke-virtual {v0}, Lcom/flurry/android/AppCloudObject;->isAutoSyncEnabled()Z

    move-result v0

    return v0
.end method

.method public removeAllObservers()Z
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lcom/flurry/android/AppCloudObjectProxy;->dD:Lcom/flurry/android/AppCloudObject;

    invoke-virtual {v0}, Lcom/flurry/android/AppCloudObject;->removeAllObservers()Z

    move-result v0

    return v0
.end method

.method public removeObserver(Lcom/flurry/android/AppCloudValueUpdateHandler;)Z
    .locals 1

    .prologue
    .line 100
    iget-object v0, p0, Lcom/flurry/android/AppCloudObjectProxy;->dD:Lcom/flurry/android/AppCloudObject;

    invoke-virtual {v0, p1}, Lcom/flurry/android/AppCloudObject;->removeObserver(Lcom/flurry/android/AppCloudValueUpdateHandler;)Z

    move-result v0

    return v0
.end method

.method public removeObserverForKey(Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 105
    iget-object v0, p0, Lcom/flurry/android/AppCloudObjectProxy;->dD:Lcom/flurry/android/AppCloudObject;

    invoke-virtual {v0, p1}, Lcom/flurry/android/AppCloudObject;->removeObserverForKey(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public saveOrCreateWithCompletionHandler(Lcom/flurry/android/responses/AppCloudApplyOperationResonseHandler;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 35
    iget-object v0, p0, Lcom/flurry/android/AppCloudObjectProxy;->dD:Lcom/flurry/android/AppCloudObject;

    invoke-virtual {v0, p1}, Lcom/flurry/android/AppCloudObject;->saveOrCreateWithCompletionHandler(Lcom/flurry/android/responses/AppCloudApplyOperationResonseHandler;)V

    .line 36
    return-void
.end method

.method public setAutoSyncEnabled(Z)Z
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lcom/flurry/android/AppCloudObjectProxy;->dD:Lcom/flurry/android/AppCloudObject;

    invoke-virtual {v0, p1}, Lcom/flurry/android/AppCloudObject;->setAutoSyncEnabled(Z)Z

    move-result v0

    return v0
.end method
