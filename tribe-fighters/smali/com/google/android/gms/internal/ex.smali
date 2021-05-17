.class public final Lcom/google/android/gms/internal/ex;
.super Lcom/google/android/gms/internal/dk;

# interfaces
.implements Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;
.implements Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/ex$av;,
        Lcom/google/android/gms/internal/ex$am;,
        Lcom/google/android/gms/internal/ex$z;,
        Lcom/google/android/gms/internal/ex$ab;,
        Lcom/google/android/gms/internal/ex$aa;,
        Lcom/google/android/gms/internal/ex$ae;,
        Lcom/google/android/gms/internal/ex$ac;,
        Lcom/google/android/gms/internal/ex$ad;,
        Lcom/google/android/gms/internal/ex$ah;,
        Lcom/google/android/gms/internal/ex$ag;,
        Lcom/google/android/gms/internal/ex$af;,
        Lcom/google/android/gms/internal/ex$i;,
        Lcom/google/android/gms/internal/ex$h;,
        Lcom/google/android/gms/internal/ex$ap;,
        Lcom/google/android/gms/internal/ex$as;,
        Lcom/google/android/gms/internal/ex$ar;,
        Lcom/google/android/gms/internal/ex$v;,
        Lcom/google/android/gms/internal/ex$q;,
        Lcom/google/android/gms/internal/ex$at;,
        Lcom/google/android/gms/internal/ex$a;,
        Lcom/google/android/gms/internal/ex$c;,
        Lcom/google/android/gms/internal/ex$b;,
        Lcom/google/android/gms/internal/ex$ba;,
        Lcom/google/android/gms/internal/ex$be;,
        Lcom/google/android/gms/internal/ex$bi;,
        Lcom/google/android/gms/internal/ex$bc;,
        Lcom/google/android/gms/internal/ex$bg;,
        Lcom/google/android/gms/internal/ex$ay;,
        Lcom/google/android/gms/internal/ex$ax;,
        Lcom/google/android/gms/internal/ex$al;,
        Lcom/google/android/gms/internal/ex$bk;,
        Lcom/google/android/gms/internal/ex$w;,
        Lcom/google/android/gms/internal/ex$y;,
        Lcom/google/android/gms/internal/ex$n;,
        Lcom/google/android/gms/internal/ex$m;,
        Lcom/google/android/gms/internal/ex$p;,
        Lcom/google/android/gms/internal/ex$aj;,
        Lcom/google/android/gms/internal/ex$s;,
        Lcom/google/android/gms/internal/ex$u;,
        Lcom/google/android/gms/internal/ex$k;,
        Lcom/google/android/gms/internal/ex$e;,
        Lcom/google/android/gms/internal/ex$g;,
        Lcom/google/android/gms/internal/ex$ao;,
        Lcom/google/android/gms/internal/ex$au;,
        Lcom/google/android/gms/internal/ex$an;,
        Lcom/google/android/gms/internal/ex$aq;,
        Lcom/google/android/gms/internal/ex$az;,
        Lcom/google/android/gms/internal/ex$bd;,
        Lcom/google/android/gms/internal/ex$bh;,
        Lcom/google/android/gms/internal/ex$bb;,
        Lcom/google/android/gms/internal/ex$bf;,
        Lcom/google/android/gms/internal/ex$bj;,
        Lcom/google/android/gms/internal/ex$aw;,
        Lcom/google/android/gms/internal/ex$ak;,
        Lcom/google/android/gms/internal/ex$x;,
        Lcom/google/android/gms/internal/ex$l;,
        Lcom/google/android/gms/internal/ex$o;,
        Lcom/google/android/gms/internal/ex$ai;,
        Lcom/google/android/gms/internal/ex$r;,
        Lcom/google/android/gms/internal/ex$t;,
        Lcom/google/android/gms/internal/ex$j;,
        Lcom/google/android/gms/internal/ex$d;,
        Lcom/google/android/gms/internal/ex$f;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/dk",
        "<",
        "Lcom/google/android/gms/internal/fc;",
        ">;",
        "Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;",
        "Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;"
    }
.end annotation


# instance fields
.field private final jD:Ljava/lang/String;

.field private qI:Z

.field private qJ:I

.field private final qM:Ljava/lang/String;

.field private final qN:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/fe;",
            ">;"
        }
    .end annotation
.end field

.field private qO:Lcom/google/android/gms/games/PlayerEntity;

.field private qP:Lcom/google/android/gms/games/GameEntity;

.field private final qQ:Lcom/google/android/gms/internal/fd;

.field private qR:Z

.field private final qS:Landroid/os/Binder;

.field private final qT:J

.field private final qU:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;[Ljava/lang/String;ILandroid/view/View;ZZI)V
    .locals 2

    const/4 v0, 0x0

    invoke-direct {p0, p1, p4, p5, p6}, Lcom/google/android/gms/internal/dk;-><init>(Landroid/content/Context;Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;[Ljava/lang/String;)V

    iput-boolean v0, p0, Lcom/google/android/gms/internal/ex;->qR:Z

    iput-boolean v0, p0, Lcom/google/android/gms/internal/ex;->qI:Z

    iput-object p2, p0, Lcom/google/android/gms/internal/ex;->qM:Ljava/lang/String;

    invoke-static {p3}, Lcom/google/android/gms/internal/du;->f(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/gms/internal/ex;->jD:Ljava/lang/String;

    new-instance v0, Landroid/os/Binder;

    invoke-direct {v0}, Landroid/os/Binder;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/ex;->qS:Landroid/os/Binder;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/ex;->qN:Ljava/util/Map;

    invoke-static {p0, p7}, Lcom/google/android/gms/internal/fd;->a(Lcom/google/android/gms/internal/ex;I)Lcom/google/android/gms/internal/fd;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/ex;->qQ:Lcom/google/android/gms/internal/fd;

    invoke-virtual {p0, p8}, Lcom/google/android/gms/internal/ex;->setViewForPopups(Landroid/view/View;)V

    iput-boolean p10, p0, Lcom/google/android/gms/internal/ex;->qI:Z

    iput p11, p0, Lcom/google/android/gms/internal/ex;->qJ:I

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    int-to-long v0, v0

    iput-wide v0, p0, Lcom/google/android/gms/internal/ex;->qT:J

    iput-boolean p9, p0, Lcom/google/android/gms/internal/ex;->qU:Z

    invoke-virtual {p0, p0}, Lcom/google/android/gms/internal/ex;->registerConnectionCallbacks(Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;)V

    invoke-virtual {p0, p0}, Lcom/google/android/gms/internal/ex;->registerConnectionFailedListener(Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V

    return-void
.end method

.method private D(Lcom/google/android/gms/common/data/DataHolder;)Lcom/google/android/gms/games/multiplayer/realtime/Room;
    .locals 3

    new-instance v1, Lcom/google/android/gms/games/multiplayer/realtime/b;

    invoke-direct {v1, p1}, Lcom/google/android/gms/games/multiplayer/realtime/b;-><init>(Lcom/google/android/gms/common/data/DataHolder;)V

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {v1}, Lcom/google/android/gms/games/multiplayer/realtime/b;->getCount()I

    move-result v2

    if-lez v2, :cond_0

    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Lcom/google/android/gms/games/multiplayer/realtime/b;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/games/multiplayer/realtime/Room;

    invoke-interface {v0}, Lcom/google/android/gms/games/multiplayer/realtime/Room;->freeze()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/games/multiplayer/realtime/Room;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    invoke-virtual {v1}, Lcom/google/android/gms/games/multiplayer/realtime/b;->close()V

    return-object v0

    :catchall_0
    move-exception v0

    invoke-virtual {v1}, Lcom/google/android/gms/games/multiplayer/realtime/b;->close()V

    throw v0
.end method

.method private R(Ljava/lang/String;)Lcom/google/android/gms/internal/fe;
    .locals 5

    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/fc;->T(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    move-object v0, v1

    :goto_0
    return-object v0

    :cond_0
    new-instance v2, Landroid/net/LocalSocket;

    invoke-direct {v2}, Landroid/net/LocalSocket;-><init>()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    new-instance v3, Landroid/net/LocalSocketAddress;

    invoke-direct {v3, v0}, Landroid/net/LocalSocketAddress;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Landroid/net/LocalSocket;->connect(Landroid/net/LocalSocketAddress;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    :try_start_2
    new-instance v0, Lcom/google/android/gms/internal/fe;

    invoke-direct {v0, v2, p1}, Lcom/google/android/gms/internal/fe;-><init>(Landroid/net/LocalSocket;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/google/android/gms/internal/ex;->qN:Ljava/util/Map;

    invoke-interface {v2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v2, "Unable to create socket. Service died."

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/fa;->b(Ljava/lang/String;Ljava/lang/String;)V

    move-object v0, v1

    goto :goto_0

    :catch_1
    move-exception v0

    :try_start_3
    const-string v2, "GamesClientImpl"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "connect() call failed on socket: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/google/android/gms/internal/fa;->b(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_0

    move-object v0, v1

    goto :goto_0
.end method

.method static synthetic a(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/common/data/DataHolder;)Lcom/google/android/gms/games/multiplayer/realtime/Room;
    .locals 1

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/ex;->D(Lcom/google/android/gms/common/data/DataHolder;)Lcom/google/android/gms/games/multiplayer/realtime/Room;

    move-result-object v0

    return-object v0
.end method

.method private cL()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/ex;->qO:Lcom/google/android/gms/games/PlayerEntity;

    return-void
.end method

.method private cM()V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/ex;->qN:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fe;

    :try_start_0
    invoke-virtual {v0}, Lcom/google/android/gms/internal/fe;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v2, "GamesClientImpl"

    const-string v3, "IOException:"

    invoke-static {v2, v3, v0}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/ex;->qN:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    return-void
.end method


# virtual methods
.method protected D(Landroid/os/IBinder;)Lcom/google/android/gms/internal/fc;
    .locals 1

    invoke-static {p1}, Lcom/google/android/gms/internal/fc$a;->F(Landroid/os/IBinder;)Lcom/google/android/gms/internal/fc;

    move-result-object v0

    return-object v0
.end method

.method public a(Lcom/google/android/gms/games/multiplayer/realtime/a$a;[BLjava/lang/String;Ljava/lang/String;)I
    .locals 2

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    new-instance v1, Lcom/google/android/gms/internal/ex$an;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/ex$an;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/games/multiplayer/realtime/a$a;)V

    invoke-interface {v0, v1, p2, p3, p4}, Lcom/google/android/gms/internal/fc;->a(Lcom/google/android/gms/internal/fb;[BLjava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    :goto_0
    return v0

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, -0x1

    goto :goto_0
.end method

.method public a([BLjava/lang/String;[Ljava/lang/String;)I
    .locals 2

    const-string v0, "Participant IDs must not be null"

    invoke-static {p3, v0}, Lcom/google/android/gms/internal/du;->c(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    invoke-interface {v0, p1, p2, p3}, Lcom/google/android/gms/internal/fc;->b([BLjava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    :goto_0
    return v0

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, -0x1

    goto :goto_0
.end method

.method protected a(ILandroid/os/IBinder;Landroid/os/Bundle;)V
    .locals 1

    if-nez p1, :cond_0

    if-eqz p3, :cond_0

    const-string v0, "show_welcome_popup"

    invoke-virtual {p3, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/ex;->qR:Z

    :cond_0
    invoke-super {p0, p1, p2, p3}, Lcom/google/android/gms/internal/dk;->a(ILandroid/os/IBinder;Landroid/os/Bundle;)V

    return-void
.end method

.method public a(Landroid/os/IBinder;Landroid/os/Bundle;)V
    .locals 2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    invoke-interface {v0, p1, p2}, Lcom/google/android/gms/internal/fc;->a(Landroid/os/IBinder;Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public a(Lcom/google/android/gms/common/api/a$c;IZZ)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/games/f$a;",
            ">;IZZ)V"
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    new-instance v1, Lcom/google/android/gms/internal/ex$ak;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/ex$ak;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/common/api/a$c;)V

    invoke-interface {v0, v1, p2, p3, p4}, Lcom/google/android/gms/internal/fc;->a(Lcom/google/android/gms/internal/fb;IZZ)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public a(Lcom/google/android/gms/common/api/a$c;Lcom/google/android/gms/games/leaderboard/LeaderboardScoreBuffer;II)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/games/leaderboard/h$c;",
            ">;",
            "Lcom/google/android/gms/games/leaderboard/LeaderboardScoreBuffer;",
            "II)V"
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    new-instance v1, Lcom/google/android/gms/internal/ex$r;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/ex$r;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/common/api/a$c;)V

    invoke-virtual {p2}, Lcom/google/android/gms/games/leaderboard/LeaderboardScoreBuffer;->de()Lcom/google/android/gms/games/leaderboard/c;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/games/leaderboard/c;->df()Landroid/os/Bundle;

    move-result-object v2

    invoke-interface {v0, v1, v2, p3, p4}, Lcom/google/android/gms/internal/fc;->a(Lcom/google/android/gms/internal/fb;Landroid/os/Bundle;II)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public a(Lcom/google/android/gms/common/api/a$c;Lcom/google/android/gms/games/multiplayer/turnbased/TurnBasedMatchConfig;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/games/multiplayer/turnbased/b$b;",
            ">;",
            "Lcom/google/android/gms/games/multiplayer/turnbased/TurnBasedMatchConfig;",
            ")V"
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    new-instance v1, Lcom/google/android/gms/internal/ex$bb;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/ex$bb;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/common/api/a$c;)V

    invoke-virtual {p2}, Lcom/google/android/gms/games/multiplayer/turnbased/TurnBasedMatchConfig;->getVariant()I

    move-result v2

    invoke-virtual {p2}, Lcom/google/android/gms/games/multiplayer/turnbased/TurnBasedMatchConfig;->getMinPlayers()I

    move-result v3

    invoke-virtual {p2}, Lcom/google/android/gms/games/multiplayer/turnbased/TurnBasedMatchConfig;->getInvitedPlayerIds()[Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2}, Lcom/google/android/gms/games/multiplayer/turnbased/TurnBasedMatchConfig;->getAutoMatchCriteria()Landroid/os/Bundle;

    move-result-object v5

    invoke-interface/range {v0 .. v5}, Lcom/google/android/gms/internal/fc;->a(Lcom/google/android/gms/internal/fb;II[Ljava/lang/String;Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public a(Lcom/google/android/gms/common/api/a$c;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/games/f$a;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    new-instance v1, Lcom/google/android/gms/internal/ex$ak;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/ex$ak;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/common/api/a$c;)V

    invoke-interface {v0, v1, p2}, Lcom/google/android/gms/internal/fc;->c(Lcom/google/android/gms/internal/fb;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public a(Lcom/google/android/gms/common/api/a$c;Ljava/lang/String;I)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/games/achievement/b$b;",
            ">;",
            "Ljava/lang/String;",
            "I)V"
        }
    .end annotation

    if-nez p1, :cond_0

    const/4 v1, 0x0

    :goto_0
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    iget-object v2, p0, Lcom/google/android/gms/internal/ex;->qQ:Lcom/google/android/gms/internal/fd;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/fd;->db()Landroid/os/IBinder;

    move-result-object v4

    iget-object v2, p0, Lcom/google/android/gms/internal/ex;->qQ:Lcom/google/android/gms/internal/fd;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/fd;->da()Landroid/os/Bundle;

    move-result-object v5

    move-object v2, p2

    move v3, p3

    invoke-interface/range {v0 .. v5}, Lcom/google/android/gms/internal/fc;->a(Lcom/google/android/gms/internal/fb;Ljava/lang/String;ILandroid/os/IBinder;Landroid/os/Bundle;)V

    :goto_1
    return-void

    :cond_0
    new-instance v1, Lcom/google/android/gms/internal/ex$d;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/ex$d;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/common/api/a$c;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method

.method public a(Lcom/google/android/gms/common/api/a$c;Ljava/lang/String;IIIZ)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/games/leaderboard/h$c;",
            ">;",
            "Ljava/lang/String;",
            "IIIZ)V"
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    new-instance v1, Lcom/google/android/gms/internal/ex$r;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/ex$r;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/common/api/a$c;)V

    move-object v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-interface/range {v0 .. v6}, Lcom/google/android/gms/internal/fc;->a(Lcom/google/android/gms/internal/fb;Ljava/lang/String;IIIZ)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public a(Lcom/google/android/gms/common/api/a$c;Ljava/lang/String;JLjava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/games/leaderboard/h$d;",
            ">;",
            "Ljava/lang/String;",
            "J",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    if-nez p1, :cond_0

    const/4 v1, 0x0

    :goto_0
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    move-object v2, p2

    move-wide v3, p3

    move-object v5, p5

    invoke-interface/range {v0 .. v5}, Lcom/google/android/gms/internal/fc;->a(Lcom/google/android/gms/internal/fb;Ljava/lang/String;JLjava/lang/String;)V

    :goto_1
    return-void

    :cond_0
    new-instance v1, Lcom/google/android/gms/internal/ex$aw;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/ex$aw;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/common/api/a$c;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method

.method public a(Lcom/google/android/gms/common/api/a$c;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/games/multiplayer/turnbased/b$c;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    new-instance v1, Lcom/google/android/gms/internal/ex$bd;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/ex$bd;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/common/api/a$c;)V

    invoke-interface {v0, v1, p2, p3}, Lcom/google/android/gms/internal/fc;->d(Lcom/google/android/gms/internal/fb;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public a(Lcom/google/android/gms/common/api/a$c;Ljava/lang/String;Ljava/lang/String;II)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/games/leaderboard/h$b;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "II)V"
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    new-instance v1, Lcom/google/android/gms/internal/ex$ai;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/ex$ai;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/common/api/a$c;)V

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move v5, p5

    invoke-interface/range {v0 .. v5}, Lcom/google/android/gms/internal/fc;->a(Lcom/google/android/gms/internal/fb;Ljava/lang/String;Ljava/lang/String;II)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public a(Lcom/google/android/gms/common/api/a$c;Ljava/lang/String;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/games/leaderboard/h$a;",
            ">;",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    new-instance v1, Lcom/google/android/gms/internal/ex$t;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/ex$t;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/common/api/a$c;)V

    invoke-interface {v0, v1, p2, p3}, Lcom/google/android/gms/internal/fc;->c(Lcom/google/android/gms/internal/fb;Ljava/lang/String;Z)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public a(Lcom/google/android/gms/common/api/a$c;Ljava/lang/String;[BLjava/lang/String;[Lcom/google/android/gms/games/multiplayer/ParticipantResult;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/games/multiplayer/turnbased/b$f;",
            ">;",
            "Ljava/lang/String;",
            "[B",
            "Ljava/lang/String;",
            "[",
            "Lcom/google/android/gms/games/multiplayer/ParticipantResult;",
            ")V"
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    new-instance v1, Lcom/google/android/gms/internal/ex$bh;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/ex$bh;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/common/api/a$c;)V

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-interface/range {v0 .. v5}, Lcom/google/android/gms/internal/fc;->a(Lcom/google/android/gms/internal/fb;Ljava/lang/String;[BLjava/lang/String;[Lcom/google/android/gms/games/multiplayer/ParticipantResult;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public a(Lcom/google/android/gms/common/api/a$c;Ljava/lang/String;[B[Lcom/google/android/gms/games/multiplayer/ParticipantResult;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/games/multiplayer/turnbased/b$f;",
            ">;",
            "Ljava/lang/String;",
            "[B[",
            "Lcom/google/android/gms/games/multiplayer/ParticipantResult;",
            ")V"
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    new-instance v1, Lcom/google/android/gms/internal/ex$bh;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/ex$bh;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/common/api/a$c;)V

    invoke-interface {v0, v1, p2, p3, p4}, Lcom/google/android/gms/internal/fc;->a(Lcom/google/android/gms/internal/fb;Ljava/lang/String;[B[Lcom/google/android/gms/games/multiplayer/ParticipantResult;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public a(Lcom/google/android/gms/common/api/a$c;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/games/leaderboard/h$a;",
            ">;Z)V"
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    new-instance v1, Lcom/google/android/gms/internal/ex$t;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/ex$t;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/common/api/a$c;)V

    invoke-interface {v0, v1, p2}, Lcom/google/android/gms/internal/fc;->c(Lcom/google/android/gms/internal/fb;Z)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public a(Lcom/google/android/gms/common/api/a$c;[I)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/games/multiplayer/turnbased/b$e;",
            ">;[I)V"
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    new-instance v1, Lcom/google/android/gms/internal/ex$bj;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/ex$bj;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/common/api/a$c;)V

    invoke-interface {v0, v1, p2}, Lcom/google/android/gms/internal/fc;->a(Lcom/google/android/gms/internal/fb;[I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected a(Lcom/google/android/gms/internal/dq;Lcom/google/android/gms/internal/dk$d;)V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget-object v0, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v8

    new-instance v9, Landroid/os/Bundle;

    invoke-direct {v9}, Landroid/os/Bundle;-><init>()V

    const-string v0, "com.google.android.gms.games.key.isHeadless"

    iget-boolean v1, p0, Lcom/google/android/gms/internal/ex;->qU:Z

    invoke-virtual {v9, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v0, "com.google.android.gms.games.key.showConnectingPopup"

    iget-boolean v1, p0, Lcom/google/android/gms/internal/ex;->qI:Z

    invoke-virtual {v9, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v0, "com.google.android.gms.games.key.connectingPopupGravity"

    iget v1, p0, Lcom/google/android/gms/internal/ex;->qJ:I

    invoke-virtual {v9, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const v2, 0x3f0e94

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/gms/internal/ex;->jD:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bA()[Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/google/android/gms/internal/ex;->qM:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/internal/ex;->qQ:Lcom/google/android/gms/internal/fd;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/fd;->db()Landroid/os/IBinder;

    move-result-object v7

    move-object v0, p1

    move-object v1, p2

    invoke-interface/range {v0 .. v9}, Lcom/google/android/gms/internal/dq;->a(Lcom/google/android/gms/internal/dp;ILjava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Landroid/os/IBinder;Ljava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method

.method protected varargs a([Ljava/lang/String;)V
    .locals 7

    const/4 v4, 0x1

    const/4 v1, 0x0

    move v0, v1

    move v2, v1

    move v3, v1

    :goto_0
    array-length v5, p1

    if-ge v0, v5, :cond_2

    aget-object v5, p1, v0

    const-string v6, "https://www.googleapis.com/auth/games"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    move v3, v4

    :cond_0
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const-string v6, "https://www.googleapis.com/auth/games.firstparty"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    move v2, v4

    goto :goto_1

    :cond_2
    if-eqz v2, :cond_4

    if-nez v3, :cond_3

    move v0, v4

    :goto_2
    const-string v2, "Cannot have both %s and %s!"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const-string v5, "https://www.googleapis.com/auth/games"

    aput-object v5, v3, v1

    const-string v1, "https://www.googleapis.com/auth/games.firstparty"

    aput-object v1, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/du;->a(ZLjava/lang/Object;)V

    :goto_3
    return-void

    :cond_3
    move v0, v1

    goto :goto_2

    :cond_4
    const-string v0, "Games APIs requires %s to function."

    new-array v2, v4, [Ljava/lang/Object;

    const-string v4, "https://www.googleapis.com/auth/games"

    aput-object v4, v2, v1

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/google/android/gms/internal/du;->a(ZLjava/lang/Object;)V

    goto :goto_3
.end method

.method protected am()Ljava/lang/String;
    .locals 1

    const-string v0, "com.google.android.gms.games.service.START"

    return-object v0
.end method

.method protected an()Ljava/lang/String;
    .locals 1

    const-string v0, "com.google.android.gms.games.internal.IGamesService"

    return-object v0
.end method

.method public b(Lcom/google/android/gms/common/api/a$c;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;)V"
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    new-instance v1, Lcom/google/android/gms/internal/ex$au;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/ex$au;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/common/api/a$c;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/fc;->a(Lcom/google/android/gms/internal/fb;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public b(Lcom/google/android/gms/common/api/a$c;Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/games/achievement/b$b;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    if-nez p1, :cond_0

    const/4 v0, 0x0

    move-object v1, v0

    :goto_0
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    iget-object v2, p0, Lcom/google/android/gms/internal/ex;->qQ:Lcom/google/android/gms/internal/fd;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/fd;->db()Landroid/os/IBinder;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/internal/ex;->qQ:Lcom/google/android/gms/internal/fd;

    invoke-virtual {v3}, Lcom/google/android/gms/internal/fd;->da()Landroid/os/Bundle;

    move-result-object v3

    invoke-interface {v0, v1, p2, v2, v3}, Lcom/google/android/gms/internal/fc;->a(Lcom/google/android/gms/internal/fb;Ljava/lang/String;Landroid/os/IBinder;Landroid/os/Bundle;)V

    :goto_1
    return-void

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/ex$d;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/internal/ex$d;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/common/api/a$c;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v1, v0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method

.method public b(Lcom/google/android/gms/common/api/a$c;Ljava/lang/String;I)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/games/achievement/b$b;",
            ">;",
            "Ljava/lang/String;",
            "I)V"
        }
    .end annotation

    if-nez p1, :cond_0

    const/4 v1, 0x0

    :goto_0
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    iget-object v2, p0, Lcom/google/android/gms/internal/ex;->qQ:Lcom/google/android/gms/internal/fd;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/fd;->db()Landroid/os/IBinder;

    move-result-object v4

    iget-object v2, p0, Lcom/google/android/gms/internal/ex;->qQ:Lcom/google/android/gms/internal/fd;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/fd;->da()Landroid/os/Bundle;

    move-result-object v5

    move-object v2, p2

    move v3, p3

    invoke-interface/range {v0 .. v5}, Lcom/google/android/gms/internal/fc;->b(Lcom/google/android/gms/internal/fb;Ljava/lang/String;ILandroid/os/IBinder;Landroid/os/Bundle;)V

    :goto_1
    return-void

    :cond_0
    new-instance v1, Lcom/google/android/gms/internal/ex$d;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/ex$d;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/common/api/a$c;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method

.method public b(Lcom/google/android/gms/common/api/a$c;Ljava/lang/String;IIIZ)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/games/leaderboard/h$c;",
            ">;",
            "Ljava/lang/String;",
            "IIIZ)V"
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    new-instance v1, Lcom/google/android/gms/internal/ex$r;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/ex$r;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/common/api/a$c;)V

    move-object v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-interface/range {v0 .. v6}, Lcom/google/android/gms/internal/fc;->b(Lcom/google/android/gms/internal/fb;Ljava/lang/String;IIIZ)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public b(Lcom/google/android/gms/common/api/a$c;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/games/achievement/b$a;",
            ">;Z)V"
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    new-instance v1, Lcom/google/android/gms/internal/ex$f;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/ex$f;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/common/api/a$c;)V

    invoke-interface {v0, v1, p2}, Lcom/google/android/gms/internal/fc;->b(Lcom/google/android/gms/internal/fb;Z)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public bc()Landroid/os/Bundle;
    .locals 2

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    invoke-interface {v0}, Lcom/google/android/gms/internal/fc;->bc()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    const-class v1, Lcom/google/android/gms/internal/ex;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    goto :goto_0
.end method

.method public c(Lcom/google/android/gms/common/api/a$c;Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/games/achievement/b$b;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    if-nez p1, :cond_0

    const/4 v0, 0x0

    move-object v1, v0

    :goto_0
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    iget-object v2, p0, Lcom/google/android/gms/internal/ex;->qQ:Lcom/google/android/gms/internal/fd;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/fd;->db()Landroid/os/IBinder;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/internal/ex;->qQ:Lcom/google/android/gms/internal/fd;

    invoke-virtual {v3}, Lcom/google/android/gms/internal/fd;->da()Landroid/os/Bundle;

    move-result-object v3

    invoke-interface {v0, v1, p2, v2, v3}, Lcom/google/android/gms/internal/fc;->b(Lcom/google/android/gms/internal/fb;Ljava/lang/String;Landroid/os/IBinder;Landroid/os/Bundle;)V

    :goto_1
    return-void

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/ex$d;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/internal/ex$d;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/common/api/a$c;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v1, v0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method

.method public cN()V
    .locals 2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    invoke-interface {v0}, Lcom/google/android/gms/internal/fc;->cN()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public clearNotifications(I)V
    .locals 2
    .param p1, "notificationTypes"    # I

    .prologue
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/fc;->clearNotifications(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public connect()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/ex;->cL()V

    invoke-super {p0}, Lcom/google/android/gms/internal/dk;->connect()V

    return-void
.end method

.method public createRoom(Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig;)V
    .locals 9
    .param p1, "config"    # Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig;

    .prologue
    :try_start_0
    new-instance v1, Lcom/google/android/gms/internal/ex$aq;

    invoke-virtual {p1}, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig;->getRoomUpdateListener()Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig;->getRoomStatusUpdateListener()Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;

    move-result-object v2

    invoke-virtual {p1}, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig;->getMessageReceivedListener()Lcom/google/android/gms/games/multiplayer/realtime/RealTimeMessageReceivedListener;

    move-result-object v3

    invoke-direct {v1, p0, v0, v2, v3}, Lcom/google/android/gms/internal/ex$aq;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;Lcom/google/android/gms/games/multiplayer/realtime/RealTimeMessageReceivedListener;)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    iget-object v2, p0, Lcom/google/android/gms/internal/ex;->qS:Landroid/os/Binder;

    invoke-virtual {p1}, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig;->getVariant()I

    move-result v3

    invoke-virtual {p1}, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig;->getInvitedPlayerIds()[Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig;->getAutoMatchCriteria()Landroid/os/Bundle;

    move-result-object v5

    invoke-virtual {p1}, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig;->isSocketEnabled()Z

    move-result v6

    iget-wide v7, p0, Lcom/google/android/gms/internal/ex;->qT:J

    invoke-interface/range {v0 .. v8}, Lcom/google/android/gms/internal/fc;->a(Lcom/google/android/gms/internal/fb;Landroid/os/IBinder;I[Ljava/lang/String;Landroid/os/Bundle;ZJ)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public d(Lcom/google/android/gms/common/api/a$c;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/games/c$a;",
            ">;)V"
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    new-instance v1, Lcom/google/android/gms/internal/ex$j;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/ex$j;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/common/api/a$c;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/fc;->d(Lcom/google/android/gms/internal/fb;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public d(Lcom/google/android/gms/common/api/a$c;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/games/multiplayer/turnbased/b$b;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    new-instance v1, Lcom/google/android/gms/internal/ex$bb;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/ex$bb;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/common/api/a$c;)V

    invoke-interface {v0, v1, p2}, Lcom/google/android/gms/internal/fc;->n(Lcom/google/android/gms/internal/fb;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public disconnect()V
    .locals 3

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/ex;->qR:Z

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    invoke-interface {v0}, Lcom/google/android/gms/internal/fc;->cN()V

    iget-wide v1, p0, Lcom/google/android/gms/internal/ex;->qT:J

    invoke-interface {v0, v1, v2}, Lcom/google/android/gms/internal/fc;->f(J)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    invoke-direct {p0}, Lcom/google/android/gms/internal/ex;->cM()V

    invoke-super {p0}, Lcom/google/android/gms/internal/dk;->disconnect()V

    return-void

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "Failed to notify client disconnect."

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public dismissTurnBasedMatch(Ljava/lang/String;)V
    .locals 2
    .param p1, "matchId"    # Ljava/lang/String;

    .prologue
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/fc;->X(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public e(Lcom/google/android/gms/common/api/a$c;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/games/multiplayer/c$a;",
            ">;)V"
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    new-instance v1, Lcom/google/android/gms/internal/ex$o;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/ex$o;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/common/api/a$c;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/fc;->e(Lcom/google/android/gms/internal/fb;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public e(Lcom/google/android/gms/common/api/a$c;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/games/multiplayer/turnbased/b$b;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    new-instance v1, Lcom/google/android/gms/internal/ex$bb;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/ex$bb;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/common/api/a$c;)V

    invoke-interface {v0, v1, p2}, Lcom/google/android/gms/internal/fc;->o(Lcom/google/android/gms/internal/fb;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public f(Lcom/google/android/gms/common/api/a$c;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/games/multiplayer/turnbased/b$c;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    new-instance v1, Lcom/google/android/gms/internal/ex$bd;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/ex$bd;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/common/api/a$c;)V

    invoke-interface {v0, v1, p2}, Lcom/google/android/gms/internal/fc;->q(Lcom/google/android/gms/internal/fb;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public g(Lcom/google/android/gms/common/api/a$c;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/games/multiplayer/turnbased/b$a;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    new-instance v1, Lcom/google/android/gms/internal/ex$az;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/ex$az;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/common/api/a$c;)V

    invoke-interface {v0, v1, p2}, Lcom/google/android/gms/internal/fc;->p(Lcom/google/android/gms/internal/fb;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public getAchievementsIntent()Landroid/content/Intent;
    .locals 2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bB()V

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.google.android.gms.games.VIEW_ACHIEVEMENTS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v1, 0x4000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-static {v0}, Lcom/google/android/gms/internal/ez;->c(Landroid/content/Intent;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public getAllLeaderboardsIntent()Landroid/content/Intent;
    .locals 3

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bB()V

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.google.android.gms.games.VIEW_LEADERBOARDS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.google.android.gms.games.GAME_PACKAGE_NAME"

    iget-object v2, p0, Lcom/google/android/gms/internal/ex;->qM:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v1, 0x4000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-static {v0}, Lcom/google/android/gms/internal/ez;->c(Landroid/content/Intent;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public getAppId()Ljava/lang/String;
    .locals 2

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    invoke-interface {v0}, Lcom/google/android/gms/internal/fc;->getAppId()Ljava/lang/String;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getCurrentAccountName()Ljava/lang/String;
    .locals 2

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    invoke-interface {v0}, Lcom/google/android/gms/internal/fc;->getCurrentAccountName()Ljava/lang/String;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getCurrentGame()Lcom/google/android/gms/games/Game;
    .locals 2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bB()V

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/ex;->qP:Lcom/google/android/gms/games/GameEntity;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-nez v0, :cond_1

    :try_start_1
    new-instance v1, Lcom/google/android/gms/games/GameBuffer;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    invoke-interface {v0}, Lcom/google/android/gms/internal/fc;->cX()Lcom/google/android/gms/common/data/DataHolder;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/google/android/gms/games/GameBuffer;-><init>(Lcom/google/android/gms/common/data/DataHolder;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    invoke-virtual {v1}, Lcom/google/android/gms/games/GameBuffer;->getCount()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Lcom/google/android/gms/games/GameBuffer;->get(I)Lcom/google/android/gms/games/Game;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/games/Game;->freeze()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/games/GameEntity;

    iput-object v0, p0, Lcom/google/android/gms/internal/ex;->qP:Lcom/google/android/gms/games/GameEntity;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_0
    :try_start_3
    invoke-virtual {v1}, Lcom/google/android/gms/games/GameBuffer;->close()V
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :cond_1
    :goto_0
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    iget-object v0, p0, Lcom/google/android/gms/internal/ex;->qP:Lcom/google/android/gms/games/GameEntity;

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_5
    invoke-virtual {v1}, Lcom/google/android/gms/games/GameBuffer;->close()V

    throw v0
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :catch_0
    move-exception v0

    :try_start_6
    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :catchall_1
    move-exception v0

    monitor-exit p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    throw v0
.end method

.method public getCurrentPlayer()Lcom/google/android/gms/games/Player;
    .locals 2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bB()V

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/ex;->qO:Lcom/google/android/gms/games/PlayerEntity;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-nez v0, :cond_1

    :try_start_1
    new-instance v1, Lcom/google/android/gms/games/PlayerBuffer;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    invoke-interface {v0}, Lcom/google/android/gms/internal/fc;->cV()Lcom/google/android/gms/common/data/DataHolder;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/google/android/gms/games/PlayerBuffer;-><init>(Lcom/google/android/gms/common/data/DataHolder;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    invoke-virtual {v1}, Lcom/google/android/gms/games/PlayerBuffer;->getCount()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Lcom/google/android/gms/games/PlayerBuffer;->get(I)Lcom/google/android/gms/games/Player;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/games/Player;->freeze()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/games/PlayerEntity;

    iput-object v0, p0, Lcom/google/android/gms/internal/ex;->qO:Lcom/google/android/gms/games/PlayerEntity;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_0
    :try_start_3
    invoke-virtual {v1}, Lcom/google/android/gms/games/PlayerBuffer;->close()V
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :cond_1
    :goto_0
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    iget-object v0, p0, Lcom/google/android/gms/internal/ex;->qO:Lcom/google/android/gms/games/PlayerEntity;

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_5
    invoke-virtual {v1}, Lcom/google/android/gms/games/PlayerBuffer;->close()V

    throw v0
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :catch_0
    move-exception v0

    :try_start_6
    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :catchall_1
    move-exception v0

    monitor-exit p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    throw v0
.end method

.method public getCurrentPlayerId()Ljava/lang/String;
    .locals 2

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    invoke-interface {v0}, Lcom/google/android/gms/internal/fc;->getCurrentPlayerId()Ljava/lang/String;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getInvitationInboxIntent()Landroid/content/Intent;
    .locals 3

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bB()V

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.google.android.gms.games.SHOW_INVITATIONS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.google.android.gms.games.GAME_PACKAGE_NAME"

    iget-object v2, p0, Lcom/google/android/gms/internal/ex;->qM:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {v0}, Lcom/google/android/gms/internal/ez;->c(Landroid/content/Intent;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public getLeaderboardIntent(Ljava/lang/String;)Landroid/content/Intent;
    .locals 2
    .param p1, "leaderboardId"    # Ljava/lang/String;

    .prologue
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bB()V

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.google.android.gms.games.VIEW_LEADERBOARD_SCORES"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.google.android.gms.games.LEADERBOARD_ID"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v1, 0x4000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-static {v0}, Lcom/google/android/gms/internal/ez;->c(Landroid/content/Intent;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public getMatchInboxIntent()Landroid/content/Intent;
    .locals 3

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bB()V

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.google.android.gms.games.SHOW_MULTIPLAYER_INBOX"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.google.android.gms.games.GAME_PACKAGE_NAME"

    iget-object v2, p0, Lcom/google/android/gms/internal/ex;->qM:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {v0}, Lcom/google/android/gms/internal/ez;->c(Landroid/content/Intent;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public getMaxTurnBasedMatchDataSize()I
    .locals 3

    const/4 v1, 0x2

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    invoke-interface {v0}, Lcom/google/android/gms/internal/fc;->getMaxTurnBasedMatchDataSize()I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    :goto_0
    return v0

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v2, "service died"

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    move v0, v1

    goto :goto_0
.end method

.method public getPlayerSearchIntent()Landroid/content/Intent;
    .locals 2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bB()V

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.google.android.gms.games.PLAYER_SEARCH"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/google/android/gms/internal/ez;->c(Landroid/content/Intent;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public getRealTimeSocketForParticipant(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/games/multiplayer/realtime/RealTimeSocket;
    .locals 2
    .param p1, "roomId"    # Ljava/lang/String;
    .param p2, "participantId"    # Ljava/lang/String;

    .prologue
    if-eqz p2, :cond_0

    invoke-static {p2}, Lcom/google/android/gms/games/multiplayer/ParticipantUtils;->Y(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Bad participant ID"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/ex;->qN:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fe;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/google/android/gms/internal/fe;->isClosed()Z

    move-result v1

    if-eqz v1, :cond_3

    :cond_2
    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/ex;->R(Ljava/lang/String;)Lcom/google/android/gms/internal/fe;

    move-result-object v0

    :cond_3
    return-object v0
.end method

.method public getRealTimeWaitingRoomIntent(Lcom/google/android/gms/games/multiplayer/realtime/Room;I)Landroid/content/Intent;
    .locals 3
    .param p1, "room"    # Lcom/google/android/gms/games/multiplayer/realtime/Room;
    .param p2, "minParticipantsToStart"    # I

    .prologue
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bB()V

    new-instance v1, Landroid/content/Intent;

    const-string v0, "com.google.android.gms.games.SHOW_REAL_TIME_WAITING_ROOM"

    invoke-direct {v1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v0, "Room parameter must not be null"

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/du;->c(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "room"

    invoke-interface {p1}, Lcom/google/android/gms/games/multiplayer/realtime/Room;->freeze()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Parcelable;

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    if-ltz p2, :cond_0

    const/4 v0, 0x1

    :goto_0
    const-string v2, "minParticipantsToStart must be >= 0"

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/du;->a(ZLjava/lang/Object;)V

    const-string v0, "com.google.android.gms.games.MIN_PARTICIPANTS_TO_START"

    invoke-virtual {v1, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-static {v1}, Lcom/google/android/gms/internal/ez;->c(Landroid/content/Intent;)Landroid/content/Intent;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getSelectPlayersIntent(IIZ)Landroid/content/Intent;
    .locals 2
    .param p1, "minPlayers"    # I
    .param p2, "maxPlayers"    # I
    .param p3, "allowAutomatch"    # Z

    .prologue
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bB()V

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.google.android.gms.games.SELECT_PLAYERS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.google.android.gms.games.MIN_SELECTIONS"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v1, "com.google.android.gms.games.MAX_SELECTIONS"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v1, "com.google.android.gms.games.SHOW_AUTOMATCH"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-static {v0}, Lcom/google/android/gms/internal/ez;->c(Landroid/content/Intent;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public getSettingsIntent()Landroid/content/Intent;
    .locals 3

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bB()V

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.google.android.gms.games.SHOW_SETTINGS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.google.android.gms.games.GAME_PACKAGE_NAME"

    iget-object v2, p0, Lcom/google/android/gms/internal/ex;->qM:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v1, 0x4000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-static {v0}, Lcom/google/android/gms/internal/ez;->c(Landroid/content/Intent;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public h(Lcom/google/android/gms/common/api/a$c;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/a$c",
            "<",
            "Lcom/google/android/gms/games/multiplayer/turnbased/b$d;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    new-instance v1, Lcom/google/android/gms/internal/ex$bf;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/ex$bf;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/common/api/a$c;)V

    invoke-interface {v0, v1, p2}, Lcom/google/android/gms/internal/fc;->r(Lcom/google/android/gms/internal/fb;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public h(Ljava/lang/String;I)V
    .locals 2

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    invoke-interface {v0, p1, p2}, Lcom/google/android/gms/internal/fc;->h(Ljava/lang/String;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public i(Ljava/lang/String;I)V
    .locals 2

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    invoke-interface {v0, p1, p2}, Lcom/google/android/gms/internal/fc;->i(Ljava/lang/String;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public joinRoom(Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig;)V
    .locals 7
    .param p1, "config"    # Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig;

    .prologue
    :try_start_0
    new-instance v1, Lcom/google/android/gms/internal/ex$aq;

    invoke-virtual {p1}, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig;->getRoomUpdateListener()Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig;->getRoomStatusUpdateListener()Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;

    move-result-object v2

    invoke-virtual {p1}, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig;->getMessageReceivedListener()Lcom/google/android/gms/games/multiplayer/realtime/RealTimeMessageReceivedListener;

    move-result-object v3

    invoke-direct {v1, p0, v0, v2, v3}, Lcom/google/android/gms/internal/ex$aq;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;Lcom/google/android/gms/games/multiplayer/realtime/RealTimeMessageReceivedListener;)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    iget-object v2, p0, Lcom/google/android/gms/internal/ex;->qS:Landroid/os/Binder;

    invoke-virtual {p1}, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig;->getInvitationId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lcom/google/android/gms/games/multiplayer/realtime/RoomConfig;->isSocketEnabled()Z

    move-result v4

    iget-wide v5, p0, Lcom/google/android/gms/internal/ex;->qT:J

    invoke-interface/range {v0 .. v6}, Lcom/google/android/gms/internal/fc;->a(Lcom/google/android/gms/internal/fb;Landroid/os/IBinder;Ljava/lang/String;ZJ)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public leaveRoom(Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;Ljava/lang/String;)V
    .locals 2
    .param p1, "listener"    # Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;
    .param p2, "roomId"    # Ljava/lang/String;

    .prologue
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    new-instance v1, Lcom/google/android/gms/internal/ex$aq;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/ex$aq;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;)V

    invoke-interface {v0, v1, p2}, Lcom/google/android/gms/internal/fc;->e(Lcom/google/android/gms/internal/fb;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/google/android/gms/internal/ex;->cM()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onConnected(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "connectionHint"    # Landroid/os/Bundle;

    .prologue
    iget-boolean v0, p0, Lcom/google/android/gms/internal/ex;->qR:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/ex;->qQ:Lcom/google/android/gms/internal/fd;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/fd;->cZ()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/ex;->qR:Z

    :cond_0
    return-void
.end method

.method public onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V
    .locals 1
    .param p1, "result"    # Lcom/google/android/gms/common/ConnectionResult;

    .prologue
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/ex;->qR:Z

    return-void
.end method

.method public onDisconnected()V
    .locals 0

    return-void
.end method

.method protected synthetic p(Landroid/os/IBinder;)Landroid/os/IInterface;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/ex;->D(Landroid/os/IBinder;)Lcom/google/android/gms/internal/fc;

    move-result-object v0

    return-object v0
.end method

.method public registerInvitationListener(Lcom/google/android/gms/games/multiplayer/OnInvitationReceivedListener;)V
    .locals 4
    .param p1, "listener"    # Lcom/google/android/gms/games/multiplayer/OnInvitationReceivedListener;

    .prologue
    :try_start_0
    new-instance v1, Lcom/google/android/gms/internal/ex$l;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/ex$l;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/games/multiplayer/OnInvitationReceivedListener;)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    iget-wide v2, p0, Lcom/google/android/gms/internal/ex;->qT:J

    invoke-interface {v0, v1, v2, v3}, Lcom/google/android/gms/internal/fc;->a(Lcom/google/android/gms/internal/fb;J)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public registerMatchUpdateListener(Lcom/google/android/gms/games/multiplayer/turnbased/OnTurnBasedMatchUpdateReceivedListener;)V
    .locals 4
    .param p1, "listener"    # Lcom/google/android/gms/games/multiplayer/turnbased/OnTurnBasedMatchUpdateReceivedListener;

    .prologue
    :try_start_0
    new-instance v1, Lcom/google/android/gms/internal/ex$x;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/ex$x;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/games/multiplayer/turnbased/OnTurnBasedMatchUpdateReceivedListener;)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    iget-wide v2, p0, Lcom/google/android/gms/internal/ex;->qT:J

    invoke-interface {v0, v1, v2, v3}, Lcom/google/android/gms/internal/fc;->b(Lcom/google/android/gms/internal/fb;J)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public sendUnreliableRealTimeMessageToAll([BLjava/lang/String;)I
    .locals 2
    .param p1, "messageData"    # [B
    .param p2, "roomId"    # Ljava/lang/String;

    .prologue
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    const/4 v1, 0x0

    invoke-interface {v0, p1, p2, v1}, Lcom/google/android/gms/internal/fc;->b([BLjava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    :goto_0
    return v0

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, -0x1

    goto :goto_0
.end method

.method public setGravityForPopups(I)V
    .locals 1
    .param p1, "gravity"    # I

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/internal/ex;->qQ:Lcom/google/android/gms/internal/fd;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/fd;->setGravity(I)V

    return-void
.end method

.method public setViewForPopups(Landroid/view/View;)V
    .locals 1
    .param p1, "gamesContentView"    # Landroid/view/View;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/internal/ex;->qQ:Lcom/google/android/gms/internal/fd;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/fd;->e(Landroid/view/View;)V

    return-void
.end method

.method public unregisterInvitationListener()V
    .locals 3

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    iget-wide v1, p0, Lcom/google/android/gms/internal/ex;->qT:J

    invoke-interface {v0, v1, v2}, Lcom/google/android/gms/internal/fc;->g(J)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public unregisterMatchUpdateListener()V
    .locals 3

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ex;->bC()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fc;

    iget-wide v1, p0, Lcom/google/android/gms/internal/ex;->qT:J

    invoke-interface {v0, v1, v2}, Lcom/google/android/gms/internal/fc;->h(J)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v0, "GamesClientImpl"

    const-string v1, "service died"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/fa;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
