.class final Lcom/google/android/gms/internal/gq$e;
.super Lcom/google/android/gms/internal/gl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/gq;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "e"
.end annotation


# instance fields
.field final synthetic zA:Lcom/google/android/gms/internal/gq;

.field private final zE:Lcom/google/android/gms/plus/PlusClient$OnAccessRevokedListener;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/gq;Lcom/google/android/gms/plus/PlusClient$OnAccessRevokedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/gq$e;->zA:Lcom/google/android/gms/internal/gq;

    invoke-direct {p0}, Lcom/google/android/gms/internal/gl;-><init>()V

    iput-object p2, p0, Lcom/google/android/gms/internal/gq$e;->zE:Lcom/google/android/gms/plus/PlusClient$OnAccessRevokedListener;

    return-void
.end method


# virtual methods
.method public b(ILandroid/os/Bundle;)V
    .locals 5

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    const-string v0, "pendingIntent"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/app/PendingIntent;

    :cond_0
    new-instance v1, Lcom/google/android/gms/common/ConnectionResult;

    invoke-direct {v1, p1, v0}, Lcom/google/android/gms/common/ConnectionResult;-><init>(ILandroid/app/PendingIntent;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/gq$e;->zA:Lcom/google/android/gms/internal/gq;

    new-instance v2, Lcom/google/android/gms/internal/gq$f;

    iget-object v3, p0, Lcom/google/android/gms/internal/gq$e;->zA:Lcom/google/android/gms/internal/gq;

    iget-object v4, p0, Lcom/google/android/gms/internal/gq$e;->zE:Lcom/google/android/gms/plus/PlusClient$OnAccessRevokedListener;

    invoke-direct {v2, v3, v4, v1}, Lcom/google/android/gms/internal/gq$f;-><init>(Lcom/google/android/gms/internal/gq;Lcom/google/android/gms/plus/PlusClient$OnAccessRevokedListener;Lcom/google/android/gms/common/ConnectionResult;)V

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/gq;->a(Lcom/google/android/gms/internal/dk$b;)V

    return-void
.end method
