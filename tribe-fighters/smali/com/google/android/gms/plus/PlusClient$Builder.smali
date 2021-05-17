.class public Lcom/google/android/gms/plus/PlusClient$Builder;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/plus/PlusClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private final jB:Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;

.field private final mContext:Landroid/content/Context;

.field private final zm:Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;

.field private final zn:Lcom/google/android/gms/internal/gt;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "connectionCallbacks"    # Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;
    .param p3, "connectionFailedListener"    # Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/plus/PlusClient$Builder;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/plus/PlusClient$Builder;->zm:Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;

    iput-object p3, p0, Lcom/google/android/gms/plus/PlusClient$Builder;->jB:Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;

    new-instance v0, Lcom/google/android/gms/internal/gt;

    iget-object v1, p0, Lcom/google/android/gms/plus/PlusClient$Builder;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/gt;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/google/android/gms/plus/PlusClient$Builder;->zn:Lcom/google/android/gms/internal/gt;

    return-void
.end method


# virtual methods
.method public build()Lcom/google/android/gms/plus/PlusClient;
    .locals 6

    new-instance v0, Lcom/google/android/gms/plus/PlusClient;

    new-instance v1, Lcom/google/android/gms/internal/gq;

    iget-object v2, p0, Lcom/google/android/gms/plus/PlusClient$Builder;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/google/android/gms/plus/PlusClient$Builder;->zn:Lcom/google/android/gms/internal/gt;

    invoke-virtual {v3}, Lcom/google/android/gms/internal/gt;->eE()Lcom/google/android/gms/internal/gs;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/gms/plus/PlusClient$Builder;->zm:Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;

    iget-object v5, p0, Lcom/google/android/gms/plus/PlusClient$Builder;->jB:Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/google/android/gms/internal/gq;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/gs;Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)V

    invoke-direct {v0, v1}, Lcom/google/android/gms/plus/PlusClient;-><init>(Lcom/google/android/gms/internal/gq;)V

    return-object v0
.end method

.method public clearScopes()Lcom/google/android/gms/plus/PlusClient$Builder;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient$Builder;->zn:Lcom/google/android/gms/internal/gt;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gt;->eD()Lcom/google/android/gms/internal/gt;

    return-object p0
.end method

.method public setAccountName(Ljava/lang/String;)Lcom/google/android/gms/plus/PlusClient$Builder;
    .locals 1
    .param p1, "accountName"    # Ljava/lang/String;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient$Builder;->zn:Lcom/google/android/gms/internal/gt;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gt;->ak(Ljava/lang/String;)Lcom/google/android/gms/internal/gt;

    return-object p0
.end method

.method public varargs setActions([Ljava/lang/String;)Lcom/google/android/gms/plus/PlusClient$Builder;
    .locals 1
    .param p1, "actions"    # [Ljava/lang/String;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient$Builder;->zn:Lcom/google/android/gms/internal/gt;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gt;->e([Ljava/lang/String;)Lcom/google/android/gms/internal/gt;

    return-object p0
.end method

.method public varargs setScopes([Ljava/lang/String;)Lcom/google/android/gms/plus/PlusClient$Builder;
    .locals 1
    .param p1, "scopes"    # [Ljava/lang/String;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient$Builder;->zn:Lcom/google/android/gms/internal/gt;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gt;->d([Ljava/lang/String;)Lcom/google/android/gms/internal/gt;

    return-object p0
.end method
