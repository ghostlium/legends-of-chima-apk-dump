.class public final Lcom/google/android/gms/panorama/a;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/panorama/a$b;,
        Lcom/google/android/gms/panorama/a$a;
    }
.end annotation


# static fields
.field public static final API:Lcom/google/android/gms/common/api/Api;

.field static final jL:Lcom/google/android/gms/common/api/Api$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/Api$b",
            "<",
            "Lcom/google/android/gms/internal/gk;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/google/android/gms/panorama/a$1;

    invoke-direct {v0}, Lcom/google/android/gms/panorama/a$1;-><init>()V

    sput-object v0, Lcom/google/android/gms/panorama/a;->jL:Lcom/google/android/gms/common/api/Api$b;

    new-instance v0, Lcom/google/android/gms/common/api/Api;

    sget-object v1, Lcom/google/android/gms/panorama/a;->jL:Lcom/google/android/gms/common/api/Api$b;

    const/4 v2, 0x0

    new-array v2, v2, [Lcom/google/android/gms/common/api/Scope;

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/common/api/Api;-><init>(Lcom/google/android/gms/common/api/Api$b;[Lcom/google/android/gms/common/api/Scope;)V

    sput-object v0, Lcom/google/android/gms/panorama/a;->API:Lcom/google/android/gms/common/api/Api;

    return-void
.end method
