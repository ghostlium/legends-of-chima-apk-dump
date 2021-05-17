.class public Lcom/flurry/android/AppCloudUserProxy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/android/AppCloudObserver;


# instance fields
.field private w:Lcom/flurry/android/AppCloudUser;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/flurry/android/AppCloudUserProxy;->w:Lcom/flurry/android/AppCloudUser;

    .line 16
    new-instance v0, Lcom/flurry/android/AppCloudUser;

    invoke-direct {v0}, Lcom/flurry/android/AppCloudUser;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/AppCloudUserProxy;->w:Lcom/flurry/android/AppCloudUser;

    .line 17
    return-void
.end method

.method public static login(Ljava/lang/String;Ljava/lang/String;Lcom/flurry/android/responses/AppCloudLoginResponseHandler;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 20
    invoke-static {p0, p1, p2}, Lcom/flurry/android/AppCloudUser;->login(Ljava/lang/String;Ljava/lang/String;Lcom/flurry/android/responses/AppCloudLoginResponseHandler;)V

    .line 21
    return-void
.end method

.method public static loginWithEmail(Ljava/lang/String;Ljava/lang/String;Lcom/flurry/android/responses/AppCloudLoginResponseHandler;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 24
    invoke-static {p0, p1, p2}, Lcom/flurry/android/AppCloudUser;->login(Ljava/lang/String;Ljava/lang/String;Lcom/flurry/android/responses/AppCloudLoginResponseHandler;)V

    .line 25
    return-void
.end method


# virtual methods
.method public addObserverForKey(Ljava/lang/String;Lcom/flurry/android/AppCloudValueUpdateHandler;)V
    .locals 1

    .prologue
    .line 141
    iget-object v0, p0, Lcom/flurry/android/AppCloudUserProxy;->w:Lcom/flurry/android/AppCloudUser;

    invoke-virtual {v0, p1, p2}, Lcom/flurry/android/AppCloudUser;->addObserverForKey(Ljava/lang/String;Lcom/flurry/android/AppCloudValueUpdateHandler;)V

    .line 142
    return-void
.end method

.method public containsObserver()Z
    .locals 1

    .prologue
    .line 161
    iget-object v0, p0, Lcom/flurry/android/AppCloudUserProxy;->w:Lcom/flurry/android/AppCloudUser;

    invoke-virtual {v0}, Lcom/flurry/android/AppCloudUser;->containsObserver()Z

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
    .line 136
    iget-object v0, p0, Lcom/flurry/android/AppCloudUserProxy;->w:Lcom/flurry/android/AppCloudUser;

    invoke-virtual {v0, p1, p2, p3}, Lcom/flurry/android/AppCloudUser;->decrement(Ljava/lang/String;FLcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V

    .line 137
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
    .line 129
    iget-object v0, p0, Lcom/flurry/android/AppCloudUserProxy;->w:Lcom/flurry/android/AppCloudUser;

    invoke-virtual {v0, p1, p2, p3}, Lcom/flurry/android/AppCloudUser;->decrement(Ljava/lang/String;ILcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V

    .line 131
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
    .line 81
    iget-object v0, p0, Lcom/flurry/android/AppCloudUserProxy;->w:Lcom/flurry/android/AppCloudUser;

    invoke-virtual {v0, p1}, Lcom/flurry/android/AppCloudUser;->deleteWithCompletionHandler(Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V

    .line 82
    return-void
.end method

.method public get(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lcom/flurry/android/AppCloudUserProxy;->w:Lcom/flurry/android/AppCloudUser;

    invoke-virtual {v0, p1}, Lcom/flurry/android/AppCloudUser;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getEmail()Ljava/lang/String;
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/flurry/android/AppCloudUserProxy;->w:Lcom/flurry/android/AppCloudUser;

    invoke-virtual {v0}, Lcom/flurry/android/AppCloudUser;->getEmail()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFloat(Ljava/lang/String;)F
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lcom/flurry/android/AppCloudUserProxy;->w:Lcom/flurry/android/AppCloudUser;

    invoke-virtual {v0, p1}, Lcom/flurry/android/AppCloudUser;->getFloat(Ljava/lang/String;)F

    move-result v0

    return v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 102
    iget-object v0, p0, Lcom/flurry/android/AppCloudUserProxy;->w:Lcom/flurry/android/AppCloudUser;

    invoke-virtual {v0}, Lcom/flurry/android/AppCloudUser;->getId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getInt(Ljava/lang/String;)I
    .locals 1

    .prologue
    .line 30
    iget-object v0, p0, Lcom/flurry/android/AppCloudUserProxy;->w:Lcom/flurry/android/AppCloudUser;

    invoke-virtual {v0, p1}, Lcom/flurry/android/AppCloudUser;->getInt(Ljava/lang/String;)I

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
    .line 112
    iget-object v0, p0, Lcom/flurry/android/AppCloudUserProxy;->w:Lcom/flurry/android/AppCloudUser;

    invoke-virtual {v0}, Lcom/flurry/android/AppCloudUser;->getKeyValues()Ljava/util/Vector;

    move-result-object v0

    return-object v0
.end method

.method public getPassword()Ljava/lang/String;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/flurry/android/AppCloudUserProxy;->w:Lcom/flurry/android/AppCloudUser;

    invoke-virtual {v0}, Lcom/flurry/android/AppCloudUser;->getPassword()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUsername()Ljava/lang/String;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lcom/flurry/android/AppCloudUserProxy;->w:Lcom/flurry/android/AppCloudUser;

    invoke-virtual {v0}, Lcom/flurry/android/AppCloudUser;->getUsername()Ljava/lang/String;

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
    .line 75
    iget-object v0, p0, Lcom/flurry/android/AppCloudUserProxy;->w:Lcom/flurry/android/AppCloudUser;

    invoke-virtual {v0, p1}, Lcom/flurry/android/AppCloudUser;->getWithCompletionHandler(Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V

    .line 77
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
    .line 124
    iget-object v0, p0, Lcom/flurry/android/AppCloudUserProxy;->w:Lcom/flurry/android/AppCloudUser;

    invoke-virtual {v0, p1, p2, p3}, Lcom/flurry/android/AppCloudUser;->increment(Ljava/lang/String;FLcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V

    .line 125
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
    .line 117
    iget-object v0, p0, Lcom/flurry/android/AppCloudUserProxy;->w:Lcom/flurry/android/AppCloudUser;

    invoke-virtual {v0, p1, p2, p3}, Lcom/flurry/android/AppCloudUser;->increment(Ljava/lang/String;ILcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V

    .line 119
    return-void
.end method

.method public isAutoSyncEnabled()Z
    .locals 1

    .prologue
    .line 171
    iget-object v0, p0, Lcom/flurry/android/AppCloudUserProxy;->w:Lcom/flurry/android/AppCloudUser;

    invoke-virtual {v0}, Lcom/flurry/android/AppCloudUser;->isAutoSyncEnabled()Z

    move-result v0

    return v0
.end method

.method public logoutWithCompletionHandler(Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 85
    iget-object v0, p0, Lcom/flurry/android/AppCloudUserProxy;->w:Lcom/flurry/android/AppCloudUser;

    invoke-virtual {v0, p1}, Lcom/flurry/android/AppCloudUser;->logoutWithCompletionHandler(Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V

    .line 86
    return-void
.end method

.method public removeAllObservers()Z
    .locals 1

    .prologue
    .line 146
    iget-object v0, p0, Lcom/flurry/android/AppCloudUserProxy;->w:Lcom/flurry/android/AppCloudUser;

    invoke-virtual {v0}, Lcom/flurry/android/AppCloudUser;->removeAllObservers()Z

    move-result v0

    return v0
.end method

.method public removeObserver(Lcom/flurry/android/AppCloudValueUpdateHandler;)Z
    .locals 1

    .prologue
    .line 151
    iget-object v0, p0, Lcom/flurry/android/AppCloudUserProxy;->w:Lcom/flurry/android/AppCloudUser;

    invoke-virtual {v0, p1}, Lcom/flurry/android/AppCloudUser;->removeObserver(Lcom/flurry/android/AppCloudValueUpdateHandler;)Z

    move-result v0

    return v0
.end method

.method public removeObserverForKey(Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 156
    iget-object v0, p0, Lcom/flurry/android/AppCloudUserProxy;->w:Lcom/flurry/android/AppCloudUser;

    invoke-virtual {v0, p1}, Lcom/flurry/android/AppCloudUser;->removeObserverForKey(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public resendSignupValidationEmailWithCompletionHandler(Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 89
    iget-object v0, p0, Lcom/flurry/android/AppCloudUserProxy;->w:Lcom/flurry/android/AppCloudUser;

    invoke-virtual {v0, p1}, Lcom/flurry/android/AppCloudUser;->resendSignupValidationEmailWithCompletionHandler(Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V

    .line 90
    return-void
.end method

.method public resetPasswordForUserViaEmail(Ljava/lang/String;Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 97
    invoke-static {p1, p2}, Lcom/flurry/android/AppCloudUser;->resetPasswordForUserViaUsername(Ljava/lang/String;Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V

    .line 98
    return-void
.end method

.method public resetPasswordForUserViaUsername(Ljava/lang/String;Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 93
    invoke-static {p1, p2}, Lcom/flurry/android/AppCloudUser;->resetPasswordForUserViaUsername(Ljava/lang/String;Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;)V

    .line 94
    return-void
.end method

.method public saveOrCreateWithCompletionHandler(Lcom/flurry/android/responses/AppCloudApplyOperationResonseHandler;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 70
    iget-object v0, p0, Lcom/flurry/android/AppCloudUserProxy;->w:Lcom/flurry/android/AppCloudUser;

    invoke-virtual {v0, p1}, Lcom/flurry/android/AppCloudUser;->saveOrCreateWithCompletionHandler(Lcom/flurry/android/responses/AppCloudApplyOperationResonseHandler;)V

    .line 71
    return-void
.end method

.method public setAutoSyncEnabled(Z)Z
    .locals 1

    .prologue
    .line 166
    iget-object v0, p0, Lcom/flurry/android/AppCloudUserProxy;->w:Lcom/flurry/android/AppCloudUser;

    invoke-virtual {v0, p1}, Lcom/flurry/android/AppCloudUser;->setAutoSyncEnabled(Z)Z

    move-result v0

    return v0
.end method

.method public setEmail(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lcom/flurry/android/AppCloudUserProxy;->w:Lcom/flurry/android/AppCloudUser;

    invoke-virtual {v0, p1}, Lcom/flurry/android/AppCloudUser;->setEmail(Ljava/lang/String;)V

    .line 45
    return-void
.end method

.method public setPassword(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/flurry/android/AppCloudUserProxy;->w:Lcom/flurry/android/AppCloudUser;

    invoke-virtual {v0, p1}, Lcom/flurry/android/AppCloudUser;->setPassword(Ljava/lang/String;)V

    .line 61
    return-void
.end method

.method public setUsername(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/flurry/android/AppCloudUserProxy;->w:Lcom/flurry/android/AppCloudUser;

    invoke-virtual {v0, p1}, Lcom/flurry/android/AppCloudUser;->setUsername(Ljava/lang/String;)V

    .line 53
    return-void
.end method
