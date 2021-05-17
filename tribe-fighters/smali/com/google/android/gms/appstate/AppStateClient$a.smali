.class final Lcom/google/android/gms/appstate/AppStateClient$a;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/api/a$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/appstate/AppStateClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/common/api/a$c",
        "<",
        "Lcom/google/android/gms/appstate/b$e;",
        ">;"
    }
.end annotation


# instance fields
.field private final jE:Lcom/google/android/gms/appstate/OnStateLoadedListener;


# direct methods
.method constructor <init>(Lcom/google/android/gms/appstate/OnStateLoadedListener;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/appstate/AppStateClient$a;->jE:Lcom/google/android/gms/appstate/OnStateLoadedListener;

    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/gms/appstate/b$e;)V
    .locals 5

    iget-object v0, p0, Lcom/google/android/gms/appstate/AppStateClient$a;->jE:Lcom/google/android/gms/appstate/OnStateLoadedListener;

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-interface {p1}, Lcom/google/android/gms/appstate/b$e;->getStatus()Lcom/google/android/gms/common/api/Status;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/Status;->getStatusCode()I

    move-result v0

    const/16 v1, 0x7d0

    if-ne v0, v1, :cond_1

    invoke-interface {p1}, Lcom/google/android/gms/appstate/b$e;->aP()Lcom/google/android/gms/appstate/b$a;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/dg;->d(Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/google/android/gms/appstate/AppStateClient$a;->jE:Lcom/google/android/gms/appstate/OnStateLoadedListener;

    invoke-interface {v0}, Lcom/google/android/gms/appstate/b$a;->aK()I

    move-result v2

    invoke-interface {v0}, Lcom/google/android/gms/appstate/b$a;->aL()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0}, Lcom/google/android/gms/appstate/b$a;->getLocalData()[B

    move-result-object v4

    invoke-interface {v0}, Lcom/google/android/gms/appstate/b$a;->aM()[B

    move-result-object v0

    invoke-interface {v1, v2, v3, v4, v0}, Lcom/google/android/gms/appstate/OnStateLoadedListener;->onStateConflict(ILjava/lang/String;[B[B)V

    goto :goto_0

    :cond_1
    invoke-interface {p1}, Lcom/google/android/gms/appstate/b$e;->aO()Lcom/google/android/gms/appstate/b$d;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/dg;->d(Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/google/android/gms/appstate/AppStateClient$a;->jE:Lcom/google/android/gms/appstate/OnStateLoadedListener;

    invoke-interface {v0}, Lcom/google/android/gms/appstate/b$d;->getStatus()Lcom/google/android/gms/common/api/Status;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/common/api/Status;->getStatusCode()I

    move-result v2

    invoke-interface {v0}, Lcom/google/android/gms/appstate/b$d;->aK()I

    move-result v3

    invoke-interface {v0}, Lcom/google/android/gms/appstate/b$d;->getLocalData()[B

    move-result-object v0

    invoke-interface {v1, v2, v3, v0}, Lcom/google/android/gms/appstate/OnStateLoadedListener;->onStateLoaded(II[B)V

    goto :goto_0
.end method

.method public bridge synthetic a(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/appstate/b$e;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/appstate/AppStateClient$a;->a(Lcom/google/android/gms/appstate/b$e;)V

    return-void
.end method
