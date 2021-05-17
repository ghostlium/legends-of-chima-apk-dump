.class public Lcom/google/android/gms/internal/gq;
.super Lcom/google/android/gms/internal/dk;

# interfaces
.implements Lcom/google/android/gms/common/GooglePlayServicesClient;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/gq$e;,
        Lcom/google/android/gms/internal/gq$c;,
        Lcom/google/android/gms/internal/gq$a;,
        Lcom/google/android/gms/internal/gq$f;,
        Lcom/google/android/gms/internal/gq$d;,
        Lcom/google/android/gms/internal/gq$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/dk",
        "<",
        "Lcom/google/android/gms/internal/gp;",
        ">;",
        "Lcom/google/android/gms/common/GooglePlayServicesClient;"
    }
.end annotation


# instance fields
.field private zx:Lcom/google/android/gms/plus/model/people/Person;

.field private zy:Lcom/google/android/gms/internal/gs;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/gs;Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)V
    .locals 1

    invoke-virtual {p2}, Lcom/google/android/gms/internal/gs;->ew()[Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, p3, p4, v0}, Lcom/google/android/gms/internal/dk;-><init>(Landroid/content/Context;Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;[Ljava/lang/String;)V

    iput-object p2, p0, Lcom/google/android/gms/internal/gq;->zy:Lcom/google/android/gms/internal/gs;

    return-void
.end method


# virtual methods
.method protected a(ILandroid/os/IBinder;Landroid/os/Bundle;)V
    .locals 1

    if-nez p1, :cond_0

    if-eqz p3, :cond_0

    const-string v0, "loaded_person"

    invoke-virtual {p3, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "loaded_person"

    invoke-virtual {p3, v0}, Landroid/os/Bundle;->getByteArray(Ljava/lang/String;)[B

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/ha;->g([B)Lcom/google/android/gms/internal/ha;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/gq;->zx:Lcom/google/android/gms/plus/model/people/Person;

    :cond_0
    invoke-super {p0, p1, p2, p3}, Lcom/google/android/gms/internal/dk;->a(ILandroid/os/IBinder;Landroid/os/Bundle;)V

    return-void
.end method

.method protected a(Lcom/google/android/gms/internal/dq;Lcom/google/android/gms/internal/dk$d;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    new-instance v7, Landroid/os/Bundle;

    invoke-direct {v7}, Landroid/os/Bundle;-><init>()V

    const-string v0, "request_visible_actions"

    iget-object v1, p0, Lcom/google/android/gms/internal/gq;->zy:Lcom/google/android/gms/internal/gs;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gs;->ex()[Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v7, v0, v1}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    const v2, 0x3f0e94

    iget-object v0, p0, Lcom/google/android/gms/internal/gq;->zy:Lcom/google/android/gms/internal/gs;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gs;->eA()Ljava/lang/String;

    move-result-object v3

    iget-object v0, p0, Lcom/google/android/gms/internal/gq;->zy:Lcom/google/android/gms/internal/gs;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gs;->ez()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lcom/google/android/gms/internal/gq;->bA()[Ljava/lang/String;

    move-result-object v5

    iget-object v0, p0, Lcom/google/android/gms/internal/gq;->zy:Lcom/google/android/gms/internal/gs;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gs;->getAccountName()Ljava/lang/String;

    move-result-object v6

    move-object v0, p1

    move-object v1, p2

    invoke-interface/range {v0 .. v7}, Lcom/google/android/gms/internal/dq;->a(Lcom/google/android/gms/internal/dp;ILjava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method

.method public a(Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;Ljava/util/Collection;)V
    .locals 3
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

    invoke-virtual {p0}, Lcom/google/android/gms/internal/gq;->bB()V

    new-instance v1, Lcom/google/android/gms/internal/gq$c;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/gq$c;-><init>(Lcom/google/android/gms/internal/gq;Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;)V

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gq;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/gp;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-interface {v0, v1, v2}, Lcom/google/android/gms/internal/gp;->a(Lcom/google/android/gms/internal/gm;Ljava/util/List;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const/16 v0, 0x8

    invoke-static {v0}, Lcom/google/android/gms/common/data/DataHolder;->empty(I)Lcom/google/android/gms/common/data/DataHolder;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lcom/google/android/gms/internal/gq$c;->a(Lcom/google/android/gms/common/data/DataHolder;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public a(Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;[Ljava/lang/String;)V
    .locals 1

    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/gq;->a(Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;Ljava/util/Collection;)V

    return-void
.end method

.method public aj(Ljava/lang/String;)Z
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/gq;->bA()[Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method protected am()Ljava/lang/String;
    .locals 1

    const-string v0, "com.google.android.gms.plus.service.START"

    return-object v0
.end method

.method protected an()Ljava/lang/String;
    .locals 1

    const-string v0, "com.google.android.gms.plus.internal.IPlusService"

    return-object v0
.end method

.method protected av(Landroid/os/IBinder;)Lcom/google/android/gms/internal/gp;
    .locals 1

    invoke-static {p1}, Lcom/google/android/gms/internal/gp$a;->au(Landroid/os/IBinder;)Lcom/google/android/gms/internal/gp;

    move-result-object v0

    return-object v0
.end method

.method public clearDefaultAccount()V
    .locals 2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/gq;->bB()V

    const/4 v0, 0x0

    :try_start_0
    iput-object v0, p0, Lcom/google/android/gms/internal/gq;->zx:Lcom/google/android/gms/plus/model/people/Person;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/gq;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/gp;

    invoke-interface {v0}, Lcom/google/android/gms/internal/gp;->clearDefaultAccount()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public getAccountName()Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/gq;->bB()V

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gq;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/gp;

    invoke-interface {v0}, Lcom/google/android/gms/internal/gp;->getAccountName()Ljava/lang/String;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    return-object v0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public getCurrentPerson()Lcom/google/android/gms/plus/model/people/Person;
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/gq;->bB()V

    iget-object v0, p0, Lcom/google/android/gms/internal/gq;->zx:Lcom/google/android/gms/plus/model/people/Person;

    return-object v0
.end method

.method public loadMoments(Lcom/google/android/gms/plus/PlusClient$OnMomentsLoadedListener;)V
    .locals 7
    .param p1, "listener"    # Lcom/google/android/gms/plus/PlusClient$OnMomentsLoadedListener;

    .prologue
    const/4 v3, 0x0

    const/16 v2, 0x14

    const-string v6, "me"

    move-object v0, p0

    move-object v1, p1

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/gms/internal/gq;->loadMoments(Lcom/google/android/gms/plus/PlusClient$OnMomentsLoadedListener;ILjava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public loadMoments(Lcom/google/android/gms/plus/PlusClient$OnMomentsLoadedListener;ILjava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "listener"    # Lcom/google/android/gms/plus/PlusClient$OnMomentsLoadedListener;
    .param p2, "maxResults"    # I
    .param p3, "pageToken"    # Ljava/lang/String;
    .param p4, "targetUrl"    # Landroid/net/Uri;
    .param p5, "type"    # Ljava/lang/String;
    .param p6, "userId"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/gq;->bB()V

    if-eqz p1, :cond_0

    new-instance v1, Lcom/google/android/gms/internal/gq$a;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/gq$a;-><init>(Lcom/google/android/gms/internal/gq;Lcom/google/android/gms/plus/PlusClient$OnMomentsLoadedListener;)V

    :goto_0
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gq;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/gp;

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-interface/range {v0 .. v6}, Lcom/google/android/gms/internal/gp;->a(Lcom/google/android/gms/internal/gm;ILjava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    return-void

    :cond_0
    move-object v1, v7

    goto :goto_0

    :catch_0
    move-exception v0

    const/16 v0, 0x8

    invoke-static {v0}, Lcom/google/android/gms/common/data/DataHolder;->empty(I)Lcom/google/android/gms/common/data/DataHolder;

    move-result-object v0

    invoke-virtual {v1, v0, v7, v7}, Lcom/google/android/gms/internal/gq$a;->a(Lcom/google/android/gms/common/data/DataHolder;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method

.method public loadVisiblePeople(Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;ILjava/lang/String;)V
    .locals 6
    .param p1, "listener"    # Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;
    .param p2, "orderBy"    # I
    .param p3, "pageToken"    # Ljava/lang/String;

    .prologue
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gq;->bB()V

    new-instance v1, Lcom/google/android/gms/internal/gq$c;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/gq$c;-><init>(Lcom/google/android/gms/internal/gq;Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;)V

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gq;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/gp;

    const/4 v2, 0x1

    const/4 v4, -0x1

    move v3, p2

    move-object v5, p3

    invoke-interface/range {v0 .. v5}, Lcom/google/android/gms/internal/gp;->a(Lcom/google/android/gms/internal/gm;IIILjava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const/16 v0, 0x8

    invoke-static {v0}, Lcom/google/android/gms/common/data/DataHolder;->empty(I)Lcom/google/android/gms/common/data/DataHolder;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lcom/google/android/gms/internal/gq$c;->a(Lcom/google/android/gms/common/data/DataHolder;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public loadVisiblePeople(Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;Ljava/lang/String;)V
    .locals 1
    .param p1, "listener"    # Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;
    .param p2, "pageToken"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lcom/google/android/gms/internal/gq;->loadVisiblePeople(Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;ILjava/lang/String;)V

    return-void
.end method

.method protected synthetic p(Landroid/os/IBinder;)Landroid/os/IInterface;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/gq;->av(Landroid/os/IBinder;)Lcom/google/android/gms/internal/gp;

    move-result-object v0

    return-object v0
.end method

.method public removeMoment(Ljava/lang/String;)V
    .locals 2
    .param p1, "momentId"    # Ljava/lang/String;

    .prologue
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gq;->bB()V

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gq;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/gp;

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/gp;->removeMoment(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public revokeAccessAndDisconnect(Lcom/google/android/gms/plus/PlusClient$OnAccessRevokedListener;)V
    .locals 3
    .param p1, "listener"    # Lcom/google/android/gms/plus/PlusClient$OnAccessRevokedListener;

    .prologue
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gq;->bB()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/gq;->clearDefaultAccount()V

    new-instance v1, Lcom/google/android/gms/internal/gq$e;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/gq$e;-><init>(Lcom/google/android/gms/internal/gq;Lcom/google/android/gms/plus/PlusClient$OnAccessRevokedListener;)V

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gq;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/gp;

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/gp;->b(Lcom/google/android/gms/internal/gm;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const/16 v0, 0x8

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lcom/google/android/gms/internal/gq$e;->b(ILandroid/os/Bundle;)V

    goto :goto_0
.end method

.method public writeMoment(Lcom/google/android/gms/plus/model/moments/Moment;)V
    .locals 2
    .param p1, "moment"    # Lcom/google/android/gms/plus/model/moments/Moment;

    .prologue
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gq;->bB()V

    :try_start_0
    check-cast p1, Lcom/google/android/gms/internal/gx;

    .end local p1    # "moment":Lcom/google/android/gms/plus/model/moments/Moment;
    invoke-static {p1}, Lcom/google/android/gms/internal/ek;->a(Lcom/google/android/gms/internal/ee;)Lcom/google/android/gms/internal/ek;

    move-result-object v1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/gq;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/gp;

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/gp;->a(Lcom/google/android/gms/internal/ek;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
