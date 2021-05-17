.class public final Lcom/google/android/gms/games/GamesClient$Builder;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/games/GamesClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private final jA:Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;

.field private final jB:Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;

.field private jC:[Ljava/lang/String;

.field private jD:Ljava/lang/String;

.field private final mContext:Landroid/content/Context;

.field private qF:Ljava/lang/String;

.field private qG:I

.field private qH:Landroid/view/View;

.field private qI:Z

.field private qJ:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "connectedListener"    # Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;
    .param p3, "connectionFailedListener"    # Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;

    .prologue
    const/4 v3, 0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "<<default account>>"

    iput-object v0, p0, Lcom/google/android/gms/games/GamesClient$Builder;->jD:Ljava/lang/String;

    new-array v0, v3, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "https://www.googleapis.com/auth/games"

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/google/android/gms/games/GamesClient$Builder;->jC:[Ljava/lang/String;

    const/16 v0, 0x31

    iput v0, p0, Lcom/google/android/gms/games/GamesClient$Builder;->qG:I

    iput-boolean v3, p0, Lcom/google/android/gms/games/GamesClient$Builder;->qI:Z

    const/16 v0, 0x11

    iput v0, p0, Lcom/google/android/gms/games/GamesClient$Builder;->qJ:I

    iput-object p1, p0, Lcom/google/android/gms/games/GamesClient$Builder;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/games/GamesClient$Builder;->qF:Ljava/lang/String;

    iput-object p2, p0, Lcom/google/android/gms/games/GamesClient$Builder;->jA:Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;

    iput-object p3, p0, Lcom/google/android/gms/games/GamesClient$Builder;->jB:Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;

    return-void
.end method


# virtual methods
.method public create()Lcom/google/android/gms/games/GamesClient;
    .locals 12

    new-instance v0, Lcom/google/android/gms/games/GamesClient;

    iget-object v1, p0, Lcom/google/android/gms/games/GamesClient$Builder;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/games/GamesClient$Builder;->qF:Ljava/lang/String;

    iget-object v3, p0, Lcom/google/android/gms/games/GamesClient$Builder;->jD:Ljava/lang/String;

    iget-object v4, p0, Lcom/google/android/gms/games/GamesClient$Builder;->jA:Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;

    iget-object v5, p0, Lcom/google/android/gms/games/GamesClient$Builder;->jB:Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;

    iget-object v6, p0, Lcom/google/android/gms/games/GamesClient$Builder;->jC:[Ljava/lang/String;

    iget v7, p0, Lcom/google/android/gms/games/GamesClient$Builder;->qG:I

    iget-object v8, p0, Lcom/google/android/gms/games/GamesClient$Builder;->qH:Landroid/view/View;

    iget-boolean v9, p0, Lcom/google/android/gms/games/GamesClient$Builder;->qI:Z

    iget v10, p0, Lcom/google/android/gms/games/GamesClient$Builder;->qJ:I

    const/4 v11, 0x0

    invoke-direct/range {v0 .. v11}, Lcom/google/android/gms/games/GamesClient;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;[Ljava/lang/String;ILandroid/view/View;ZILcom/google/android/gms/games/GamesClient$1;)V

    return-object v0
.end method

.method public setAccountName(Ljava/lang/String;)Lcom/google/android/gms/games/GamesClient$Builder;
    .locals 1
    .param p1, "accountName"    # Ljava/lang/String;

    .prologue
    invoke-static {p1}, Lcom/google/android/gms/internal/du;->f(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/gms/games/GamesClient$Builder;->jD:Ljava/lang/String;

    return-object p0
.end method

.method public setGravityForPopups(I)Lcom/google/android/gms/games/GamesClient$Builder;
    .locals 0
    .param p1, "gravity"    # I

    .prologue
    iput p1, p0, Lcom/google/android/gms/games/GamesClient$Builder;->qG:I

    return-object p0
.end method

.method public varargs setScopes([Ljava/lang/String;)Lcom/google/android/gms/games/GamesClient$Builder;
    .locals 0
    .param p1, "scopes"    # [Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/games/GamesClient$Builder;->jC:[Ljava/lang/String;

    return-object p0
.end method

.method public setShowConnectingPopup(Z)Lcom/google/android/gms/games/GamesClient$Builder;
    .locals 1
    .param p1, "showConnectingPopup"    # Z

    .prologue
    iput-boolean p1, p0, Lcom/google/android/gms/games/GamesClient$Builder;->qI:Z

    const/16 v0, 0x11

    iput v0, p0, Lcom/google/android/gms/games/GamesClient$Builder;->qJ:I

    return-object p0
.end method

.method public setShowConnectingPopup(ZI)Lcom/google/android/gms/games/GamesClient$Builder;
    .locals 0
    .param p1, "showConnectingPopup"    # Z
    .param p2, "gravity"    # I

    .prologue
    iput-boolean p1, p0, Lcom/google/android/gms/games/GamesClient$Builder;->qI:Z

    iput p2, p0, Lcom/google/android/gms/games/GamesClient$Builder;->qJ:I

    return-object p0
.end method

.method public setViewForPopups(Landroid/view/View;)Lcom/google/android/gms/games/GamesClient$Builder;
    .locals 1
    .param p1, "gamesContentView"    # Landroid/view/View;

    .prologue
    invoke-static {p1}, Lcom/google/android/gms/internal/du;->f(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    iput-object v0, p0, Lcom/google/android/gms/games/GamesClient$Builder;->qH:Landroid/view/View;

    return-object p0
.end method
