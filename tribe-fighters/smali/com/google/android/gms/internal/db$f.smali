.class final Lcom/google/android/gms/internal/db$f;
.super Lcom/google/android/gms/internal/dk$c;

# interfaces
.implements Lcom/google/android/gms/appstate/b$a;
.implements Lcom/google/android/gms/appstate/b$d;
.implements Lcom/google/android/gms/appstate/b$e;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/db;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "f"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/dk",
        "<",
        "Lcom/google/android/gms/internal/dd;",
        ">.c<",
        "Lcom/google/android/gms/common/api/a$c",
        "<",
        "Lcom/google/android/gms/appstate/b$e;",
        ">;>;",
        "Lcom/google/android/gms/appstate/b$a;",
        "Lcom/google/android/gms/appstate/b$d;",
        "Lcom/google/android/gms/appstate/b$e;"
    }
.end annotation


# instance fields
.field final synthetic jO:Lcom/google/android/gms/internal/db;

.field private final jP:Lcom/google/android/gms/common/api/Status;

.field private final jQ:I

.field private final jR:Lcom/google/android/gms/appstate/AppStateBuffer;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/db;Lcom/google/android/gms/common/api/a$c;ILcom/google/android/gms/common/data/DataHolder;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/appstate/b$e;",
            ">;I",
            "Lcom/google/android/gms/common/data/DataHolder;",
            ")V"
        }
    .end annotation

    iput-object p1, p0, Lcom/google/android/gms/internal/db$f;->jO:Lcom/google/android/gms/internal/db;

    invoke-direct {p0, p1, p2, p4}, Lcom/google/android/gms/internal/dk$c;-><init>(Lcom/google/android/gms/internal/dk;Ljava/lang/Object;Lcom/google/android/gms/common/data/DataHolder;)V

    iput p3, p0, Lcom/google/android/gms/internal/db$f;->jQ:I

    new-instance v0, Lcom/google/android/gms/common/api/Status;

    invoke-virtual {p4}, Lcom/google/android/gms/common/data/DataHolder;->getStatusCode()I

    move-result v1

    invoke-direct {v0, v1}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/gms/internal/db$f;->jP:Lcom/google/android/gms/common/api/Status;

    new-instance v0, Lcom/google/android/gms/appstate/AppStateBuffer;

    invoke-direct {v0, p4}, Lcom/google/android/gms/appstate/AppStateBuffer;-><init>(Lcom/google/android/gms/common/data/DataHolder;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/db$f;->jR:Lcom/google/android/gms/appstate/AppStateBuffer;

    return-void
.end method

.method private aR()Z
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/db$f;->jP:Lcom/google/android/gms/common/api/Status;

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/Status;->getStatusCode()I

    move-result v0

    const/16 v1, 0x7d0

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public a(Lcom/google/android/gms/common/api/a$c;Lcom/google/android/gms/common/data/DataHolder;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/appstate/b$e;",
            ">;",
            "Lcom/google/android/gms/common/data/DataHolder;",
            ")V"
        }
    .end annotation

    invoke-interface {p1, p0}, Lcom/google/android/gms/common/api/a$c;->a(Ljava/lang/Object;)V

    return-void
.end method

.method public bridge synthetic a(Ljava/lang/Object;Lcom/google/android/gms/common/data/DataHolder;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/common/api/a$c;

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/db$f;->a(Lcom/google/android/gms/common/api/a$c;Lcom/google/android/gms/common/data/DataHolder;)V

    return-void
.end method

.method public aK()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/db$f;->jQ:I

    return v0
.end method

.method public aL()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/db$f;->jR:Lcom/google/android/gms/appstate/AppStateBuffer;

    invoke-virtual {v0}, Lcom/google/android/gms/appstate/AppStateBuffer;->getCount()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/db$f;->jR:Lcom/google/android/gms/appstate/AppStateBuffer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/gms/appstate/AppStateBuffer;->get(I)Lcom/google/android/gms/appstate/AppState;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/appstate/AppState;->getConflictVersion()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public aM()[B
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/db$f;->jR:Lcom/google/android/gms/appstate/AppStateBuffer;

    invoke-virtual {v0}, Lcom/google/android/gms/appstate/AppStateBuffer;->getCount()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/db$f;->jR:Lcom/google/android/gms/appstate/AppStateBuffer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/gms/appstate/AppStateBuffer;->get(I)Lcom/google/android/gms/appstate/AppState;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/appstate/AppState;->getConflictData()[B

    move-result-object v0

    goto :goto_0
.end method

.method public aO()Lcom/google/android/gms/appstate/b$d;
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/db$f;->aR()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    :cond_0
    return-object p0
.end method

.method public aP()Lcom/google/android/gms/appstate/b$a;
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/db$f;->aR()Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return-object p0

    :cond_0
    const/4 p0, 0x0

    goto :goto_0
.end method

.method public getLocalData()[B
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/db$f;->jR:Lcom/google/android/gms/appstate/AppStateBuffer;

    invoke-virtual {v0}, Lcom/google/android/gms/appstate/AppStateBuffer;->getCount()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/db$f;->jR:Lcom/google/android/gms/appstate/AppStateBuffer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/gms/appstate/AppStateBuffer;->get(I)Lcom/google/android/gms/appstate/AppState;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/appstate/AppState;->getLocalData()[B

    move-result-object v0

    goto :goto_0
.end method

.method public getStatus()Lcom/google/android/gms/common/api/Status;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/db$f;->jP:Lcom/google/android/gms/common/api/Status;

    return-object v0
.end method

.method public release()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/db$f;->jR:Lcom/google/android/gms/appstate/AppStateBuffer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/db$f;->jR:Lcom/google/android/gms/appstate/AppStateBuffer;

    invoke-virtual {v0}, Lcom/google/android/gms/appstate/AppStateBuffer;->close()V

    :cond_0
    return-void
.end method
