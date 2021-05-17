.class public final Lcom/google/android/gms/internal/dk$d;
.super Lcom/google/android/gms/internal/dp$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/dk;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "d"
.end annotation


# instance fields
.field private mJ:Lcom/google/android/gms/internal/dk;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/dk;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/dp$a;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/dk$d;->mJ:Lcom/google/android/gms/internal/dk;

    return-void
.end method


# virtual methods
.method public b(ILandroid/os/IBinder;Landroid/os/Bundle;)V
    .locals 2

    const-string v0, "onPostInitComplete can be called only once per call to getServiceFromBroker"

    iget-object v1, p0, Lcom/google/android/gms/internal/dk$d;->mJ:Lcom/google/android/gms/internal/dk;

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/du;->c(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/dk$d;->mJ:Lcom/google/android/gms/internal/dk;

    invoke-virtual {v0, p1, p2, p3}, Lcom/google/android/gms/internal/dk;->a(ILandroid/os/IBinder;Landroid/os/Bundle;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/dk$d;->mJ:Lcom/google/android/gms/internal/dk;

    return-void
.end method
