.class Lcom/google/android/gms/internal/as$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/as;->a(JJ)Lcom/google/android/gms/internal/ay;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic fB:Lcom/google/android/gms/internal/ay;

.field final synthetic fC:Lcom/google/android/gms/internal/as;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/as;Lcom/google/android/gms/internal/ay;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/as$1;->fC:Lcom/google/android/gms/internal/as;

    iput-object p2, p0, Lcom/google/android/gms/internal/as$1;->fB:Lcom/google/android/gms/internal/ay;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/as$1;->fB:Lcom/google/android/gms/internal/ay;

    iget-object v0, v0, Lcom/google/android/gms/internal/ay;->gb:Lcom/google/android/gms/internal/bc;

    invoke-interface {v0}, Lcom/google/android/gms/internal/bc;->destroy()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v1, "Could not destroy mediation adapter."

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/cs;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
