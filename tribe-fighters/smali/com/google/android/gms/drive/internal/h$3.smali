.class Lcom/google/android/gms/drive/internal/h$3;
.super Lcom/google/android/gms/drive/internal/h$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/drive/internal/h;->discardContents(Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/drive/Contents;)Lcom/google/android/gms/common/api/PendingResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic or:Lcom/google/android/gms/drive/internal/h;

.field final synthetic os:Lcom/google/android/gms/drive/Contents;


# direct methods
.method constructor <init>(Lcom/google/android/gms/drive/internal/h;Lcom/google/android/gms/drive/Contents;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/drive/internal/h$3;->or:Lcom/google/android/gms/drive/internal/h;

    iput-object p2, p0, Lcom/google/android/gms/drive/internal/h$3;->os:Lcom/google/android/gms/drive/Contents;

    invoke-direct {p0, p1}, Lcom/google/android/gms/drive/internal/h$b;-><init>(Lcom/google/android/gms/drive/internal/h;)V

    return-void
.end method


# virtual methods
.method protected a(Lcom/google/android/gms/drive/internal/j;)V
    .locals 4

    :try_start_0
    invoke-virtual {p1}, Lcom/google/android/gms/drive/internal/j;->cu()Lcom/google/android/gms/drive/internal/o;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/drive/internal/CloseContentsRequest;

    iget-object v2, p0, Lcom/google/android/gms/drive/internal/h$3;->os:Lcom/google/android/gms/drive/Contents;

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lcom/google/android/gms/drive/internal/CloseContentsRequest;-><init>(Lcom/google/android/gms/drive/Contents;Z)V

    new-instance v2, Lcom/google/android/gms/drive/internal/z;

    invoke-direct {v2, p0}, Lcom/google/android/gms/drive/internal/z;-><init>(Lcom/google/android/gms/common/api/a$c;)V

    invoke-interface {v0, v1, v2}, Lcom/google/android/gms/drive/internal/o;->a(Lcom/google/android/gms/drive/internal/CloseContentsRequest;Lcom/google/android/gms/drive/internal/p;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    new-instance v1, Lcom/google/android/gms/common/api/Status;

    const/16 v2, 0x8

    invoke-virtual {v0}, Landroid/os/RemoteException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v0

    const/4 v3, 0x0

    invoke-direct {v1, v2, v0, v3}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;Landroid/app/PendingIntent;)V

    invoke-virtual {p0, v1}, Lcom/google/android/gms/drive/internal/h$3;->a(Lcom/google/android/gms/common/api/Result;)V

    goto :goto_0
.end method

.method protected synthetic b(Lcom/google/android/gms/common/api/Api$a;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/drive/internal/j;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/drive/internal/h$3;->a(Lcom/google/android/gms/drive/internal/j;)V

    return-void
.end method