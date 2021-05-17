.class public Lcom/google/android/gms/plus/PlusClient;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/GooglePlayServicesClient;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/plus/PlusClient$Builder;,
        Lcom/google/android/gms/plus/PlusClient$OnAccessRevokedListener;,
        Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;,
        Lcom/google/android/gms/plus/PlusClient$OrderBy;,
        Lcom/google/android/gms/plus/PlusClient$OnMomentsLoadedListener;
    }
.end annotation


# instance fields
.field final zl:Lcom/google/android/gms/internal/gq;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/gq;)V
    .locals 0
    .param p1, "plusClientImpl"    # Lcom/google/android/gms/internal/gq;

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/plus/PlusClient;->zl:Lcom/google/android/gms/internal/gq;

    return-void
.end method


# virtual methods
.method public clearDefaultAccount()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->zl:Lcom/google/android/gms/internal/gq;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gq;->clearDefaultAccount()V

    return-void
.end method

.method public connect()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->zl:Lcom/google/android/gms/internal/gq;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gq;->connect()V

    return-void
.end method

.method public disconnect()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->zl:Lcom/google/android/gms/internal/gq;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gq;->disconnect()V

    return-void
.end method

.method ep()Lcom/google/android/gms/internal/gq;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->zl:Lcom/google/android/gms/internal/gq;

    return-object v0
.end method

.method public getAccountName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->zl:Lcom/google/android/gms/internal/gq;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gq;->getAccountName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentPerson()Lcom/google/android/gms/plus/model/people/Person;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->zl:Lcom/google/android/gms/internal/gq;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gq;->getCurrentPerson()Lcom/google/android/gms/plus/model/people/Person;

    move-result-object v0

    return-object v0
.end method

.method public isConnected()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->zl:Lcom/google/android/gms/internal/gq;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gq;->isConnected()Z

    move-result v0

    return v0
.end method

.method public isConnecting()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->zl:Lcom/google/android/gms/internal/gq;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gq;->isConnecting()Z

    move-result v0

    return v0
.end method

.method public isConnectionCallbacksRegistered(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)Z
    .locals 1
    .param p1, "listener"    # Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->zl:Lcom/google/android/gms/internal/gq;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gq;->isConnectionCallbacksRegistered(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)Z

    move-result v0

    return v0
.end method

.method public isConnectionFailedListenerRegistered(Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)Z
    .locals 1
    .param p1, "listener"    # Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->zl:Lcom/google/android/gms/internal/gq;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gq;->isConnectionFailedListenerRegistered(Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)Z

    move-result v0

    return v0
.end method

.method public loadMoments(Lcom/google/android/gms/plus/PlusClient$OnMomentsLoadedListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/google/android/gms/plus/PlusClient$OnMomentsLoadedListener;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->zl:Lcom/google/android/gms/internal/gq;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gq;->loadMoments(Lcom/google/android/gms/plus/PlusClient$OnMomentsLoadedListener;)V

    return-void
.end method

.method public loadMoments(Lcom/google/android/gms/plus/PlusClient$OnMomentsLoadedListener;ILjava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "listener"    # Lcom/google/android/gms/plus/PlusClient$OnMomentsLoadedListener;
    .param p2, "maxResults"    # I
    .param p3, "pageToken"    # Ljava/lang/String;
    .param p4, "targetUrl"    # Landroid/net/Uri;
    .param p5, "type"    # Ljava/lang/String;
    .param p6, "userId"    # Ljava/lang/String;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->zl:Lcom/google/android/gms/internal/gq;

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/gms/internal/gq;->loadMoments(Lcom/google/android/gms/plus/PlusClient$OnMomentsLoadedListener;ILjava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public loadPeople(Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;Ljava/util/Collection;)V
    .locals 1
    .param p1, "listener"    # Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p2, "personIds":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->zl:Lcom/google/android/gms/internal/gq;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gms/internal/gq;->a(Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;Ljava/util/Collection;)V

    return-void
.end method

.method public varargs loadPeople(Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;[Ljava/lang/String;)V
    .locals 1
    .param p1, "listener"    # Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;
    .param p2, "personIds"    # [Ljava/lang/String;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->zl:Lcom/google/android/gms/internal/gq;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gms/internal/gq;->a(Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;[Ljava/lang/String;)V

    return-void
.end method

.method public loadVisiblePeople(Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;ILjava/lang/String;)V
    .locals 1
    .param p1, "listener"    # Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;
    .param p2, "orderBy"    # I
    .param p3, "pageToken"    # Ljava/lang/String;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->zl:Lcom/google/android/gms/internal/gq;

    invoke-virtual {v0, p1, p2, p3}, Lcom/google/android/gms/internal/gq;->loadVisiblePeople(Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;ILjava/lang/String;)V

    return-void
.end method

.method public loadVisiblePeople(Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;Ljava/lang/String;)V
    .locals 1
    .param p1, "listener"    # Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;
    .param p2, "pageToken"    # Ljava/lang/String;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->zl:Lcom/google/android/gms/internal/gq;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gms/internal/gq;->loadVisiblePeople(Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;Ljava/lang/String;)V

    return-void
.end method

.method public registerConnectionCallbacks(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)V
    .locals 1
    .param p1, "listener"    # Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->zl:Lcom/google/android/gms/internal/gq;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gq;->registerConnectionCallbacks(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)V

    return-void
.end method

.method public registerConnectionFailedListener(Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->zl:Lcom/google/android/gms/internal/gq;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gq;->registerConnectionFailedListener(Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)V

    return-void
.end method

.method public removeMoment(Ljava/lang/String;)V
    .locals 1
    .param p1, "momentId"    # Ljava/lang/String;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->zl:Lcom/google/android/gms/internal/gq;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gq;->removeMoment(Ljava/lang/String;)V

    return-void
.end method

.method public revokeAccessAndDisconnect(Lcom/google/android/gms/plus/PlusClient$OnAccessRevokedListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/google/android/gms/plus/PlusClient$OnAccessRevokedListener;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->zl:Lcom/google/android/gms/internal/gq;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gq;->revokeAccessAndDisconnect(Lcom/google/android/gms/plus/PlusClient$OnAccessRevokedListener;)V

    return-void
.end method

.method public unregisterConnectionCallbacks(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)V
    .locals 1
    .param p1, "listener"    # Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->zl:Lcom/google/android/gms/internal/gq;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gq;->unregisterConnectionCallbacks(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)V

    return-void
.end method

.method public unregisterConnectionFailedListener(Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->zl:Lcom/google/android/gms/internal/gq;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gq;->unregisterConnectionFailedListener(Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)V

    return-void
.end method

.method public writeMoment(Lcom/google/android/gms/plus/model/moments/Moment;)V
    .locals 1
    .param p1, "moment"    # Lcom/google/android/gms/plus/model/moments/Moment;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->zl:Lcom/google/android/gms/internal/gq;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gq;->writeMoment(Lcom/google/android/gms/plus/model/moments/Moment;)V

    return-void
.end method
