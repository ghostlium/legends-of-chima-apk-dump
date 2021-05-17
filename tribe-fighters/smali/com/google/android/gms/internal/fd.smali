.class public Lcom/google/android/gms/internal/fd;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/fd$1;,
        Lcom/google/android/gms/internal/fd$a;,
        Lcom/google/android/gms/internal/fd$b;
    }
.end annotation


# instance fields
.field protected qm:Lcom/google/android/gms/internal/ex;

.field protected rG:Lcom/google/android/gms/internal/fd$a;


# direct methods
.method private constructor <init>(Lcom/google/android/gms/internal/ex;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/fd;->qm:Lcom/google/android/gms/internal/ex;

    invoke-virtual {p0, p2}, Lcom/google/android/gms/internal/fd;->as(I)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/internal/ex;ILcom/google/android/gms/internal/fd$1;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/fd;-><init>(Lcom/google/android/gms/internal/ex;I)V

    return-void
.end method

.method public static a(Lcom/google/android/gms/internal/ex;I)Lcom/google/android/gms/internal/fd;
    .locals 1

    invoke-static {}, Lcom/google/android/gms/internal/es;->cl()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/google/android/gms/internal/fd$b;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/internal/fd$b;-><init>(Lcom/google/android/gms/internal/ex;I)V

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/fd;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/internal/fd;-><init>(Lcom/google/android/gms/internal/ex;I)V

    goto :goto_0
.end method


# virtual methods
.method protected as(I)V
    .locals 3

    new-instance v0, Lcom/google/android/gms/internal/fd$a;

    new-instance v1, Landroid/os/Binder;

    invoke-direct {v1}, Landroid/os/Binder;-><init>()V

    const/4 v2, 0x0

    invoke-direct {v0, p1, v1, v2}, Lcom/google/android/gms/internal/fd$a;-><init>(ILandroid/os/IBinder;Lcom/google/android/gms/internal/fd$1;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/fd;->rG:Lcom/google/android/gms/internal/fd$a;

    return-void
.end method

.method public cZ()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/fd;->qm:Lcom/google/android/gms/internal/ex;

    iget-object v1, p0, Lcom/google/android/gms/internal/fd;->rG:Lcom/google/android/gms/internal/fd$a;

    iget-object v1, v1, Lcom/google/android/gms/internal/fd$a;->rH:Landroid/os/IBinder;

    iget-object v2, p0, Lcom/google/android/gms/internal/fd;->rG:Lcom/google/android/gms/internal/fd$a;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/fd$a;->dc()Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/ex;->a(Landroid/os/IBinder;Landroid/os/Bundle;)V

    return-void
.end method

.method public da()Landroid/os/Bundle;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/fd;->rG:Lcom/google/android/gms/internal/fd$a;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/fd$a;->dc()Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method public db()Landroid/os/IBinder;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/fd;->rG:Lcom/google/android/gms/internal/fd$a;

    iget-object v0, v0, Lcom/google/android/gms/internal/fd$a;->rH:Landroid/os/IBinder;

    return-object v0
.end method

.method public e(Landroid/view/View;)V
    .locals 0

    return-void
.end method

.method public setGravity(I)V
    .locals 1
    .param p1, "gravity"    # I

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/internal/fd;->rG:Lcom/google/android/gms/internal/fd$a;

    iput p1, v0, Lcom/google/android/gms/internal/fd$a;->gravity:I

    return-void
.end method
