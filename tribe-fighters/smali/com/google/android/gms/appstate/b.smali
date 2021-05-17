.class public final Lcom/google/android/gms/appstate/b;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/appstate/b$c;,
        Lcom/google/android/gms/appstate/b$b;,
        Lcom/google/android/gms/appstate/b$a;,
        Lcom/google/android/gms/appstate/b$d;,
        Lcom/google/android/gms/appstate/b$e;
    }
.end annotation


# static fields
.field public static final API:Lcom/google/android/gms/common/api/Api;

.field static final jL:Lcom/google/android/gms/common/api/Api$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/Api$b",
            "<",
            "Lcom/google/android/gms/internal/db;",
            ">;"
        }
    .end annotation
.end field

.field public static final jM:Lcom/google/android/gms/common/api/Scope;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    new-instance v0, Lcom/google/android/gms/appstate/b$1;

    invoke-direct {v0}, Lcom/google/android/gms/appstate/b$1;-><init>()V

    sput-object v0, Lcom/google/android/gms/appstate/b;->jL:Lcom/google/android/gms/common/api/Api$b;

    new-instance v0, Lcom/google/android/gms/common/api/Scope;

    const-string v1, "https://www.googleapis.com/auth/appstate"

    invoke-direct {v0, v1}, Lcom/google/android/gms/common/api/Scope;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/google/android/gms/appstate/b;->jM:Lcom/google/android/gms/common/api/Scope;

    new-instance v0, Lcom/google/android/gms/common/api/Api;

    sget-object v1, Lcom/google/android/gms/appstate/b;->jL:Lcom/google/android/gms/common/api/Api$b;

    const/4 v2, 0x1

    new-array v2, v2, [Lcom/google/android/gms/common/api/Scope;

    const/4 v3, 0x0

    sget-object v4, Lcom/google/android/gms/appstate/b;->jM:Lcom/google/android/gms/common/api/Scope;

    aput-object v4, v2, v3

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/common/api/Api;-><init>(Lcom/google/android/gms/common/api/Api$b;[Lcom/google/android/gms/common/api/Scope;)V

    sput-object v0, Lcom/google/android/gms/appstate/b;->API:Lcom/google/android/gms/common/api/Api;

    return-void
.end method
