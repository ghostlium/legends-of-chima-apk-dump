.class public Lcom/flurry/android/impl/ads/FlurryAdModule;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/sdk/ae;
.implements Lcom/flurry/sdk/fc;
.implements Lcom/flurry/sdk/fd;


# static fields
.field private static Q:Lcom/flurry/android/impl/ads/FlurryAdModule;

.field private static q:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final r:Ljava/lang/String;


# instance fields
.field private A:[B

.field private B:Z

.field private volatile C:Ljava/lang/String;

.field private volatile D:Ljava/lang/String;

.field private E:Lcom/flurry/sdk/e;

.field private F:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

.field private final G:Lcom/flurry/sdk/j;

.field private final H:Lcom/flurry/sdk/aj;

.field private I:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/flurry/android/FlurryAdListener;",
            ">;"
        }
    .end annotation
.end field

.field private J:Ljava/lang/CharSequence;

.field private final K:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private final L:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/flurry/sdk/e;",
            ">;"
        }
    .end annotation
.end field

.field private M:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

.field private N:Lcom/flurry/sdk/ag;

.field private final O:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final P:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private R:Z

.field private S:Lcom/flurry/sdk/ac;

.field private T:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/flurry/sdk/ej;",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation
.end field

.field private U:Lcom/flurry/sdk/s;

.field private V:Lcom/flurry/sdk/q;

.field private W:Lcom/flurry/sdk/u;

.field public volatile a:Lcom/flurry/android/impl/ads/avro/protocol/v6/Location;

.field volatile b:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field volatile c:Ljava/util/TreeMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/TreeMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field d:J

.field e:J

.field f:J

.field g:Ljava/lang/String;

.field h:Landroid/os/Handler;

.field i:Lcom/flurry/sdk/z;

.field j:Lcom/flurry/sdk/al;

.field public k:Lcom/flurry/android/ICustomAdNetworkHandler;

.field l:I

.field volatile m:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/flurry/sdk/e;",
            ">;"
        }
    .end annotation
.end field

.field volatile n:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field volatile o:Z

.field p:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private s:Z

.field private t:Z

.field private u:Z

.field private v:Ljava/io/File;

.field private w:Ljava/io/File;

.field private x:Ljava/io/File;

.field private y:Ljava/lang/String;

.field private z:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 82
    const-class v0, Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flurry/android/impl/ads/FlurryAdModule;->r:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 8

    .prologue
    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v1, 0x0

    const/4 v4, 0x0

    .line 166
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    iput-boolean v4, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->s:Z

    .line 85
    iput-boolean v4, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->t:Z

    .line 86
    iput-boolean v4, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->u:Z

    .line 87
    iput-object v1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->v:Ljava/io/File;

    .line 88
    iput-object v1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->w:Ljava/io/File;

    .line 89
    iput-object v1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->x:Ljava/io/File;

    .line 92
    iput-object v1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->A:[B

    .line 93
    iput-boolean v4, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->B:Z

    .line 96
    iput-object v1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->C:Ljava/lang/String;

    .line 97
    iput-object v1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->D:Ljava/lang/String;

    .line 127
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->I:Ljava/lang/ref/WeakReference;

    .line 159
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->T:Ljava/util/Map;

    .line 167
    invoke-static {}, Lcom/flurry/sdk/fe;->a()Lcom/flurry/sdk/fe;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/flurry/sdk/fe;->a(Lcom/flurry/sdk/fd;)V

    .line 168
    invoke-static {}, Lcom/flurry/sdk/z;->a()Lcom/flurry/sdk/z;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->i:Lcom/flurry/sdk/z;

    .line 169
    invoke-static {}, Lcom/flurry/sdk/al;->a()Lcom/flurry/sdk/al;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->j:Lcom/flurry/sdk/al;

    .line 170
    new-instance v0, Lcom/flurry/sdk/u;

    invoke-direct {v0, p0}, Lcom/flurry/sdk/u;-><init>(Lcom/flurry/android/impl/ads/FlurryAdModule;)V

    iput-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->W:Lcom/flurry/sdk/u;

    .line 172
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->L:Ljava/util/List;

    .line 173
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->m:Ljava/util/Map;

    .line 174
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->n:Ljava/util/List;

    .line 175
    iput-boolean v4, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->o:Z

    .line 178
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 179
    const-string v1, "open"

    const-string v2, "directOpen"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    const-string v1, "expand"

    const-string v2, "doExpand"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 181
    const-string v1, "collapse"

    const-string v2, "doCollapse"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->O:Ljava/util/Map;

    .line 185
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 186
    const/4 v1, 0x6

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "notifyUser"

    aput-object v2, v1, v4

    const-string v2, "nextFrame"

    aput-object v2, v1, v5

    const-string v2, "closeAd"

    aput-object v2, v1, v6

    const-string v2, "expandAd"

    aput-object v2, v1, v7

    const/4 v2, 0x4

    const-string v3, "collapseAd"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "verifyURL"

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 188
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->P:Ljava/util/Set;

    .line 191
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "FlurryAds"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 192
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 193
    new-instance v1, Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {v1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->h:Landroid/os/Handler;

    .line 195
    new-instance v0, Lcom/flurry/sdk/q;

    invoke-direct {v0, p0}, Lcom/flurry/sdk/q;-><init>(Lcom/flurry/android/impl/ads/FlurryAdModule;)V

    iput-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->V:Lcom/flurry/sdk/q;

    .line 196
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/Integer;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v4

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v5

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v6

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v7

    const/4 v1, 0x4

    const/4 v2, 0x4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const/4 v2, 0x5

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/flurry/android/impl/ads/FlurryAdModule;->q:Ljava/util/List;

    .line 202
    sget-object v0, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    iput-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->y:Ljava/lang/String;

    .line 203
    sget-object v0, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    iput-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->z:Ljava/lang/String;

    .line 205
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->b:Ljava/util/Map;

    .line 207
    new-instance v0, Lcom/flurry/sdk/n;

    invoke-direct {v0}, Lcom/flurry/sdk/n;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->G:Lcom/flurry/sdk/j;

    .line 208
    new-instance v0, Lcom/flurry/sdk/o;

    invoke-direct {v0}, Lcom/flurry/sdk/o;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->H:Lcom/flurry/sdk/aj;

    .line 210
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->K:Ljava/util/List;

    .line 213
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->c:Ljava/util/TreeMap;

    .line 214
    return-void
.end method

.method static synthetic T()Ljava/lang/String;
    .locals 1

    .prologue
    .line 69
    sget-object v0, Lcom/flurry/android/impl/ads/FlurryAdModule;->r:Ljava/lang/String;

    return-object v0
.end method

.method private declared-synchronized U()V
    .locals 6

    .prologue
    .line 823
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->L:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Ljava/util/List;)Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest;

    move-result-object v0

    .line 824
    iget-object v1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->L:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 825
    iget-object v1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->U:Lcom/flurry/sdk/s;

    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->A()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->f()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Lcom/flurry/sdk/bx;->a()Lcom/flurry/sdk/bx;

    move-result-object v5

    invoke-virtual {v5}, Lcom/flurry/sdk/bx;->b()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v0, v2, v3, v4}, Lcom/flurry/sdk/s;->a(Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogResponse;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 827
    monitor-exit p0

    return-void

    .line 823
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized V()V
    .locals 4

    .prologue
    .line 901
    monitor-enter p0

    const/4 v2, 0x0

    .line 903
    :try_start_0
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->v:Ljava/io/File;

    invoke-static {v0}, Lcom/flurry/sdk/et;->a(Ljava/io/File;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result v0

    .line 904
    if-nez v0, :cond_0

    .line 913
    :try_start_1
    invoke-static {v2}, Lcom/flurry/sdk/fh;->a(Ljava/io/Closeable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 915
    :goto_0
    monitor-exit p0

    return-void

    .line 908
    :cond_0
    :try_start_2
    new-instance v1, Ljava/io/DataOutputStream;

    new-instance v0, Ljava/io/FileOutputStream;

    iget-object v3, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->v:Ljava/io/File;

    invoke-direct {v0, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 909
    :try_start_3
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->L:Ljava/util/List;

    invoke-static {v0, v1}, Lcom/flurry/sdk/c;->a(Ljava/util/List;Ljava/io/DataOutput;)V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 913
    :try_start_4
    invoke-static {v1}, Lcom/flurry/sdk/fh;->a(Ljava/io/Closeable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    .line 901
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 910
    :catch_0
    move-exception v0

    move-object v1, v2

    .line 911
    :goto_1
    :try_start_5
    sget-object v2, Lcom/flurry/android/impl/ads/FlurryAdModule;->r:Ljava/lang/String;

    const-string v3, "Error when saving ad log data: "

    invoke-static {v2, v3, v0}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 913
    :try_start_6
    invoke-static {v1}, Lcom/flurry/sdk/fh;->a(Ljava/io/Closeable;)V

    goto :goto_0

    :catchall_1
    move-exception v0

    :goto_2
    invoke-static {v2}, Lcom/flurry/sdk/fh;->a(Ljava/io/Closeable;)V

    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    :catchall_2
    move-exception v0

    move-object v2, v1

    goto :goto_2

    .line 910
    :catch_1
    move-exception v0

    goto :goto_1
.end method

.method private declared-synchronized W()V
    .locals 4

    .prologue
    .line 920
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->v:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_2

    .line 921
    const/4 v2, 0x0

    .line 923
    :try_start_1
    new-instance v1, Ljava/io/DataInputStream;

    new-instance v0, Ljava/io/FileInputStream;

    iget-object v3, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->v:Ljava/io/File;

    invoke-direct {v0, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 924
    :try_start_2
    invoke-static {v1}, Lcom/flurry/sdk/c;->a(Ljava/io/DataInput;)Ljava/util/List;

    move-result-object v0

    .line 925
    iget-object v2, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->L:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 926
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->s:Z
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_3
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 930
    :try_start_3
    invoke-static {v1}, Lcom/flurry/sdk/fh;->a(Ljava/io/Closeable;)V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 934
    :goto_0
    :try_start_4
    iget-boolean v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->s:Z

    if-nez v0, :cond_0

    .line 935
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->v:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v0

    .line 936
    if-eqz v0, :cond_1

    .line 937
    const/4 v0, 0x3

    sget-object v1, Lcom/flurry/android/impl/ads/FlurryAdModule;->r:Ljava/lang/String;

    const-string v2, "Deleted persistence adLogs file"

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 952
    :cond_0
    :goto_1
    monitor-exit p0

    return-void

    .line 927
    :catch_0
    move-exception v0

    move-object v1, v2

    .line 928
    :goto_2
    :try_start_5
    sget-object v2, Lcom/flurry/android/impl/ads/FlurryAdModule;->r:Ljava/lang/String;

    const-string v3, "Error when loading ad log data: "

    invoke-static {v2, v3, v0}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 930
    :try_start_6
    invoke-static {v1}, Lcom/flurry/sdk/fh;->a(Ljava/io/Closeable;)V
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_0

    .line 949
    :catch_1
    move-exception v0

    .line 950
    const/4 v1, 0x6

    :try_start_7
    sget-object v2, Lcom/flurry/android/impl/ads/FlurryAdModule;->r:Ljava/lang/String;

    const-string v3, "Failed to load AdLogs cache file with exception:"

    invoke-static {v1, v2, v3, v0}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_1

    .line 920
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 930
    :catchall_1
    move-exception v0

    move-object v1, v2

    :goto_3
    :try_start_8
    invoke-static {v1}, Lcom/flurry/sdk/fh;->a(Ljava/io/Closeable;)V

    throw v0
    :try_end_8
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_8} :catch_1
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 939
    :cond_1
    const/4 v0, 0x6

    :try_start_9
    sget-object v1, Lcom/flurry/android/impl/ads/FlurryAdModule;->r:Ljava/lang/String;

    const-string v2, "Cannot delete persistence adLogs file"

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_9
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_9} :catch_2
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto :goto_1

    .line 942
    :catch_2
    move-exception v0

    .line 943
    :try_start_a
    sget-object v1, Lcom/flurry/android/impl/ads/FlurryAdModule;->r:Ljava/lang/String;

    const-string v2, ""

    invoke-static {v1, v2, v0}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 946
    :cond_2
    const/4 v0, 0x3

    sget-object v1, Lcom/flurry/android/impl/ads/FlurryAdModule;->r:Ljava/lang/String;

    const-string v2, "AdLogs cache file doesn\'t exist."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_a
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_a} :catch_1
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto :goto_1

    .line 930
    :catchall_2
    move-exception v0

    goto :goto_3

    .line 927
    :catch_3
    move-exception v0

    goto :goto_2
.end method

.method private a(Ljava/util/List;)Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/flurry/sdk/e;",
            ">;)",
            "Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest;"
        }
    .end annotation

    .prologue
    const/4 v4, 0x3

    .line 830
    invoke-static {p1}, Lcom/flurry/sdk/bu;->a(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 831
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_0

    .line 832
    sget-object v0, Lcom/flurry/android/impl/ads/FlurryAdModule;->r:Ljava/lang/String;

    const-string v1, "List of adLogs is empty"

    invoke-static {v4, v0, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 833
    const/4 v0, 0x0

    .line 852
    :goto_0
    return-object v0

    .line 836
    :cond_0
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->B()Ljava/util/List;

    move-result-object v1

    .line 839
    invoke-static {}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest;->b()Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->f()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->a(Ljava/lang/CharSequence;)Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->a(Ljava/util/List;)Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->b(Ljava/util/List;)Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->a(Z)Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;

    move-result-object v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->a(J)Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;

    move-result-object v0

    invoke-static {}, Lcom/flurry/sdk/bx;->a()Lcom/flurry/sdk/bx;

    move-result-object v1

    invoke-virtual {v1}, Lcom/flurry/sdk/bx;->b()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->b(Ljava/lang/CharSequence;)Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->a()Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest;

    move-result-object v0

    .line 850
    sget-object v1, Lcom/flurry/android/impl/ads/FlurryAdModule;->r:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Got ad log request:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private a(Landroid/content/Context;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;ILjava/lang/String;Ljava/lang/String;Lcom/flurry/sdk/e;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;)Lcom/flurry/sdk/ag;
    .locals 7

    .prologue
    const/4 v3, 0x3

    const/4 v6, 0x0

    .line 1385
    .line 1386
    invoke-virtual {p7}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->e()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdSpaceLayout;

    move-result-object v0

    .line 1387
    invoke-static {v0}, Lcom/flurry/sdk/bt;->a(Lcom/flurry/android/impl/ads/avro/protocol/v6/AdSpaceLayout;)Lcom/flurry/android/AdCreative;

    move-result-object v0

    .line 1389
    iget-object v1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->M:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->M:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    if-eq v1, p2, :cond_1

    .line 1390
    :cond_0
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->N:Lcom/flurry/sdk/ag;

    .line 1428
    :goto_0
    return-object v0

    .line 1392
    :cond_1
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->N:Lcom/flurry/sdk/ag;

    .line 1394
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->m()Lcom/flurry/android/ICustomAdNetworkHandler;

    move-result-object v1

    .line 1395
    const/4 v2, 0x4

    if-ne p3, v2, :cond_3

    if-eqz v1, :cond_3

    invoke-interface {v1, p1, v0, p4}, Lcom/flurry/android/ICustomAdNetworkHandler;->getAdFromNetwork(Landroid/content/Context;Lcom/flurry/android/AdCreative;Ljava/lang/String;)Lcom/flurry/android/AdNetworkView;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 1398
    invoke-virtual {v0, p0}, Lcom/flurry/sdk/h;->setPlatformModule(Lcom/flurry/android/impl/ads/FlurryAdModule;)V

    .line 1399
    invoke-virtual {v0, p6}, Lcom/flurry/sdk/h;->setAdLog(Lcom/flurry/sdk/e;)V

    .line 1400
    invoke-virtual {v0, v6}, Lcom/flurry/sdk/h;->setAdFrameIndex(I)V

    .line 1401
    invoke-virtual {v0, p2}, Lcom/flurry/sdk/h;->setAdUnit(Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V

    .line 1402
    new-instance v1, Lcom/flurry/sdk/i;

    invoke-direct {v1, v0, p2}, Lcom/flurry/sdk/i;-><init>(Lcom/flurry/sdk/h;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V

    iput-object v1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->N:Lcom/flurry/sdk/ag;

    .line 1428
    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->N:Lcom/flurry/sdk/ag;

    goto :goto_0

    .line 1403
    :cond_3
    const-string v0, "takeover"

    invoke-virtual {p5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1404
    invoke-virtual {p0, p6}, Lcom/flurry/android/impl/ads/FlurryAdModule;->b(Lcom/flurry/sdk/e;)V

    .line 1405
    invoke-virtual {p0, p2}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V

    .line 1406
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->H:Lcom/flurry/sdk/aj;

    invoke-interface {v0, p1, p0, p6, p2}, Lcom/flurry/sdk/aj;->a_(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)Lcom/flurry/sdk/ai;

    move-result-object v0

    .line 1408
    if-eqz v0, :cond_2

    .line 1409
    sget-object v1, Lcom/flurry/android/impl/ads/FlurryAdModule;->r:Ljava/lang/String;

    const-string v2, "prepareAd:first frame of AdUnit is a takeover"

    invoke-static {v3, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 1410
    new-instance v1, Lcom/flurry/sdk/ah;

    invoke-direct {v1, v0, p2}, Lcom/flurry/sdk/ah;-><init>(Lcom/flurry/sdk/ai;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V

    iput-object v1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->N:Lcom/flurry/sdk/ag;

    goto :goto_1

    .line 1413
    :cond_4
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->G:Lcom/flurry/sdk/j;

    invoke-interface {v0, p1, p0, p6, p2}, Lcom/flurry/sdk/j;->a(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)Lcom/flurry/sdk/h;

    move-result-object v0

    .line 1415
    if-eqz v0, :cond_5

    .line 1416
    sget-object v1, Lcom/flurry/android/impl/ads/FlurryAdModule;->r:Ljava/lang/String;

    const-string v2, "prepareAd: first frame of AdUnit is a banner"

    invoke-static {v3, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 1417
    new-instance v1, Lcom/flurry/sdk/i;

    invoke-direct {v1, v0, p2}, Lcom/flurry/sdk/i;-><init>(Lcom/flurry/sdk/h;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V

    iput-object v1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->N:Lcom/flurry/sdk/ag;

    goto :goto_1

    .line 1419
    :cond_5
    sget-object v0, Lcom/flurry/android/impl/ads/FlurryAdModule;->r:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to create view for ad network: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", network is unsupported on Android, or no ICustomAdNetworkHandler was registered or it failed to return a view."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 1423
    new-instance v0, Lcom/flurry/sdk/p;

    const-string v1, "renderFailed"

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v2

    move-object v3, p1

    move-object v4, p2

    move-object v5, p6

    invoke-direct/range {v0 .. v6}, Lcom/flurry/sdk/p;-><init>(Ljava/lang/String;Ljava/util/Map;Landroid/content/Context;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/e;I)V

    iget-object v1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->V:Lcom/flurry/sdk/q;

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Lcom/flurry/sdk/p;Lcom/flurry/sdk/ad;I)V

    goto :goto_1
.end method

.method static synthetic a(Lcom/flurry/android/impl/ads/FlurryAdModule;)V
    .locals 0

    .prologue
    .line 69
    invoke-direct {p0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->W()V

    return-void
.end method

.method static synthetic b(Lcom/flurry/android/impl/ads/FlurryAdModule;)V
    .locals 0

    .prologue
    .line 69
    invoke-direct {p0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->V()V

    return-void
.end method

.method static synthetic c(Lcom/flurry/android/impl/ads/FlurryAdModule;)V
    .locals 0

    .prologue
    .line 69
    invoke-direct {p0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->U()V

    return-void
.end method

.method public static e()Z
    .locals 2

    .prologue
    .line 451
    invoke-static {}, Lcom/flurry/sdk/eg;->a()Lcom/flurry/sdk/eg;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/sdk/eg;->b()Landroid/content/Context;

    move-result-object v0

    const-string v1, "keyguard"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/KeyguardManager;

    .line 453
    invoke-virtual {v0}, Landroid/app/KeyguardManager;->inKeyguardRestrictedInputMode()Z

    move-result v0

    .line 454
    return v0
.end method

.method public static declared-synchronized getInstance()Lcom/flurry/android/impl/ads/FlurryAdModule;
    .locals 2

    .prologue
    .line 241
    const-class v1, Lcom/flurry/android/impl/ads/FlurryAdModule;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/flurry/android/impl/ads/FlurryAdModule;->Q:Lcom/flurry/android/impl/ads/FlurryAdModule;

    if-nez v0, :cond_0

    .line 242
    new-instance v0, Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-direct {v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;-><init>()V

    sput-object v0, Lcom/flurry/android/impl/ads/FlurryAdModule;->Q:Lcom/flurry/android/impl/ads/FlurryAdModule;

    .line 244
    :cond_0
    sget-object v0, Lcom/flurry/android/impl/ads/FlurryAdModule;->Q:Lcom/flurry/android/impl/ads/FlurryAdModule;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 241
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public A()Ljava/lang/String;
    .locals 2

    .prologue
    .line 819
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->u()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/v2/postAdLog.do"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public B()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId;",
            ">;"
        }
    .end annotation

    .prologue
    .line 857
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 858
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->n()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 859
    invoke-static {}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId;->b()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId$Builder;->a(Ljava/nio/ByteBuffer;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId$Builder;

    move-result-object v0

    invoke-static {}, Lcom/flurry/sdk/bx;->m()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId$Builder;->a(I)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId$Builder;->a()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId;

    move-result-object v0

    .line 861
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 863
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->A:[B

    .line 864
    if-eqz v0, :cond_0

    .line 865
    const/4 v1, 0x3

    sget-object v3, Lcom/flurry/android/impl/ads/FlurryAdModule;->r:Ljava/lang/String;

    const-string v4, "Fetched hashed IMEI"

    invoke-static {v1, v3, v4}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 866
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 867
    invoke-static {}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId;->b()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId$Builder;->a(Ljava/nio/ByteBuffer;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId$Builder;

    move-result-object v0

    sget-object v1, Lcom/flurry/sdk/ej;->b:Lcom/flurry/sdk/ej;

    iget v1, v1, Lcom/flurry/sdk/ej;->c:I

    invoke-virtual {v0, v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId$Builder;->a(I)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId$Builder;->a()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId;

    move-result-object v0

    .line 869
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 872
    :cond_0
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->o()Ljava/util/Map;

    move-result-object v0

    .line 873
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 874
    invoke-static {}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId;->b()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId$Builder;

    move-result-object v4

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/nio/ByteBuffer;

    invoke-virtual {v4, v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId$Builder;->a(Ljava/nio/ByteBuffer;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId$Builder;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/ej;

    iget v0, v0, Lcom/flurry/sdk/ej;->c:I

    invoke-virtual {v1, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId$Builder;->a(I)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId$Builder;->a()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId;

    move-result-object v0

    .line 876
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 878
    :cond_1
    return-object v2
.end method

.method public C()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 882
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 884
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->i:Lcom/flurry/sdk/z;

    invoke-virtual {v0}, Lcom/flurry/sdk/z;->c()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/y;

    .line 885
    invoke-static {}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo;->b()Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;

    move-result-object v3

    invoke-virtual {v0}, Lcom/flurry/sdk/y;->b()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->a(Ljava/lang/CharSequence;)Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;

    move-result-object v3

    invoke-virtual {v0}, Lcom/flurry/sdk/y;->h()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->b(J)Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;

    move-result-object v3

    invoke-virtual {v0}, Lcom/flurry/sdk/y;->e()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->b(I)Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;

    move-result-object v3

    invoke-virtual {v0}, Lcom/flurry/sdk/y;->f()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->c(I)Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;

    move-result-object v3

    invoke-virtual {v0}, Lcom/flurry/sdk/y;->g()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->d(I)Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;

    move-result-object v3

    invoke-virtual {v0}, Lcom/flurry/sdk/y;->i()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->a(J)Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;

    move-result-object v3

    invoke-virtual {v0}, Lcom/flurry/sdk/y;->c()I

    move-result v0

    invoke-virtual {v3, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->a(I)Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->a()Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo;

    move-result-object v0

    .line 894
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 897
    :cond_0
    return-object v1
.end method

.method public declared-synchronized D()V
    .locals 4

    .prologue
    .line 955
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->i:Lcom/flurry/sdk/z;

    invoke-virtual {v0}, Lcom/flurry/sdk/z;->d()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 958
    const/4 v2, 0x0

    .line 960
    :try_start_1
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->w:Ljava/io/File;

    invoke-static {v0}, Lcom/flurry/sdk/et;->a(Ljava/io/File;)Z
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    move-result v0

    .line 961
    if-nez v0, :cond_0

    .line 975
    :try_start_2
    invoke-static {v2}, Lcom/flurry/sdk/fh;->a(Ljava/io/Closeable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 977
    :goto_0
    monitor-exit p0

    return-void

    .line 965
    :cond_0
    :try_start_3
    new-instance v0, Ljava/io/FileOutputStream;

    iget-object v1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->w:Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 966
    new-instance v1, Ljava/io/DataOutputStream;

    invoke-direct {v1, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 968
    :try_start_4
    iget-object v2, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->i:Lcom/flurry/sdk/z;

    monitor-enter v2
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 969
    :try_start_5
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->i:Lcom/flurry/sdk/z;

    invoke-virtual {p0, v0, v1}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Lcom/flurry/sdk/z;Ljava/io/DataOutputStream;)V

    .line 970
    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 971
    const/4 v0, 0x0

    :try_start_6
    invoke-virtual {v1, v0}, Ljava/io/DataOutputStream;->writeShort(I)V
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 975
    :try_start_7
    invoke-static {v1}, Lcom/flurry/sdk/fh;->a(Ljava/io/Closeable;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_0

    .line 955
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 970
    :catchall_1
    move-exception v0

    :try_start_8
    monitor-exit v2
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    :try_start_9
    throw v0
    :try_end_9
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    .line 972
    :catch_0
    move-exception v0

    .line 973
    :goto_1
    :try_start_a
    sget-object v2, Lcom/flurry/android/impl/ads/FlurryAdModule;->r:Ljava/lang/String;

    const-string v3, ""

    invoke-static {v2, v3, v0}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    .line 975
    :try_start_b
    invoke-static {v1}, Lcom/flurry/sdk/fh;->a(Ljava/io/Closeable;)V

    goto :goto_0

    :catchall_2
    move-exception v0

    move-object v1, v2

    :goto_2
    invoke-static {v1}, Lcom/flurry/sdk/fh;->a(Ljava/io/Closeable;)V

    throw v0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    :catchall_3
    move-exception v0

    goto :goto_2

    .line 972
    :catch_1
    move-exception v0

    move-object v1, v2

    goto :goto_1
.end method

.method declared-synchronized E()V
    .locals 4

    .prologue
    .line 980
    monitor-enter p0

    :try_start_0
    sget-object v0, Lcom/flurry/android/impl/ads/FlurryAdModule;->r:Ljava/lang/String;

    const-string v1, "Attempting to load FreqCap data"

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 982
    :try_start_1
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->w:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    if-eqz v0, :cond_2

    .line 984
    const/4 v2, 0x0

    .line 986
    :try_start_2
    new-instance v0, Ljava/io/FileInputStream;

    iget-object v1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->w:Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 987
    new-instance v1, Ljava/io/DataInputStream;

    invoke-direct {v1, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 988
    :try_start_3
    invoke-virtual {p0, v1}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Ljava/io/DataInputStream;)V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 992
    :try_start_4
    invoke-static {v1}, Lcom/flurry/sdk/fh;->a(Ljava/io/Closeable;)V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 996
    :goto_0
    :try_start_5
    iget-boolean v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->t:Z

    if-nez v0, :cond_1

    .line 997
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->w:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v0

    .line 998
    if-eqz v0, :cond_0

    .line 999
    const/4 v0, 0x3

    sget-object v1, Lcom/flurry/android/impl/ads/FlurryAdModule;->r:Ljava/lang/String;

    const-string v2, "Deleted persistence freqCap file"

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 1015
    :goto_1
    monitor-exit p0

    return-void

    .line 989
    :catch_0
    move-exception v0

    move-object v1, v2

    .line 990
    :goto_2
    :try_start_6
    sget-object v2, Lcom/flurry/android/impl/ads/FlurryAdModule;->r:Ljava/lang/String;

    const-string v3, "Error when loading persistent freqCap file"

    invoke-static {v2, v3, v0}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 992
    :try_start_7
    invoke-static {v1}, Lcom/flurry/sdk/fh;->a(Ljava/io/Closeable;)V
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_0

    .line 1012
    :catch_1
    move-exception v0

    .line 1013
    const/4 v1, 0x6

    :try_start_8
    sget-object v2, Lcom/flurry/android/impl/ads/FlurryAdModule;->r:Ljava/lang/String;

    const-string v3, "Failed to load freqCap cache file with exception:"

    invoke-static {v1, v2, v3, v0}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    goto :goto_1

    .line 980
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 992
    :catchall_1
    move-exception v0

    :goto_3
    :try_start_9
    invoke-static {v2}, Lcom/flurry/sdk/fh;->a(Ljava/io/Closeable;)V

    throw v0
    :try_end_9
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_9} :catch_1
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 1001
    :cond_0
    const/4 v0, 0x6

    :try_start_a
    sget-object v1, Lcom/flurry/android/impl/ads/FlurryAdModule;->r:Ljava/lang/String;

    const-string v2, "Cannot delete persistence freqCap file"

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_a
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_a} :catch_2
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto :goto_1

    .line 1006
    :catch_2
    move-exception v0

    .line 1007
    :try_start_b
    sget-object v1, Lcom/flurry/android/impl/ads/FlurryAdModule;->r:Ljava/lang/String;

    const-string v2, ""

    invoke-static {v1, v2, v0}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_b
    .catch Ljava/lang/Throwable; {:try_start_b .. :try_end_b} :catch_1
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    goto :goto_1

    .line 1004
    :cond_1
    :try_start_c
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->i:Lcom/flurry/sdk/z;

    invoke-virtual {v0}, Lcom/flurry/sdk/z;->d()V
    :try_end_c
    .catch Ljava/lang/Throwable; {:try_start_c .. :try_end_c} :catch_2
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    goto :goto_1

    .line 1010
    :cond_2
    const/4 v0, 0x3

    :try_start_d
    sget-object v1, Lcom/flurry/android/impl/ads/FlurryAdModule;->r:Ljava/lang/String;

    const-string v2, "freqCap file doesn\'t exist."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_d
    .catch Ljava/lang/Throwable; {:try_start_d .. :try_end_d} :catch_1
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    goto :goto_1

    .line 992
    :catchall_2
    move-exception v0

    move-object v2, v1

    goto :goto_3

    .line 989
    :catch_3
    move-exception v0

    goto :goto_2
.end method

.method public F()Lcom/flurry/sdk/e;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1182
    invoke-static {p0, v3}, Lcom/flurry/sdk/bt;->a(Lcom/flurry/android/impl/ads/FlurryAdModule;Ljava/lang/String;)Lcom/flurry/sdk/e;

    move-result-object v0

    .line 1183
    const-string v1, "unfilled"

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Lcom/flurry/sdk/e;Ljava/lang/String;ZLjava/util/Map;)Lcom/flurry/sdk/e;

    move-result-object v0

    return-object v0
.end method

.method public G()Lcom/flurry/sdk/e;
    .locals 1

    .prologue
    .line 1195
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->E:Lcom/flurry/sdk/e;

    return-object v0
.end method

.method public H()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;
    .locals 1

    .prologue
    .line 1203
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->F:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    return-object v0
.end method

.method public I()Z
    .locals 1

    .prologue
    .line 1437
    invoke-static {}, Lcom/flurry/sdk/fe;->a()Lcom/flurry/sdk/fe;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/sdk/fe;->c()Z

    move-result v0

    return v0
.end method

.method public J()Lcom/flurry/sdk/fe$a;
    .locals 1

    .prologue
    .line 1441
    invoke-static {}, Lcom/flurry/sdk/fe;->a()Lcom/flurry/sdk/fe;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/sdk/fe;->e()Lcom/flurry/sdk/fe$a;

    move-result-object v0

    return-object v0
.end method

.method public K()Z
    .locals 1

    .prologue
    .line 1445
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->J:Ljava/lang/CharSequence;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->J:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public L()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 1449
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->J:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public M()Lcom/flurry/sdk/z;
    .locals 1

    .prologue
    .line 1453
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->i:Lcom/flurry/sdk/z;

    return-object v0
.end method

.method public N()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1457
    sget-object v0, Lcom/flurry/android/impl/ads/FlurryAdModule;->q:Ljava/util/List;

    return-object v0
.end method

.method public O()Z
    .locals 1

    .prologue
    .line 1461
    iget-boolean v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->o:Z

    return v0
.end method

.method public P()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1465
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->y:Ljava/lang/String;

    return-object v0
.end method

.method public Q()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1469
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->z:Ljava/lang/String;

    return-object v0
.end method

.method public R()V
    .locals 1

    .prologue
    .line 1480
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->N:Lcom/flurry/sdk/ag;

    .line 1481
    return-void
.end method

.method public S()Lcom/flurry/android/FlurryAdListener;
    .locals 1

    .prologue
    .line 1484
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->I:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/FlurryAdListener;

    return-object v0
.end method

.method a(Landroid/content/Intent;)Landroid/content/Intent;
    .locals 1

    .prologue
    .line 644
    if-nez p1, :cond_0

    .line 645
    const/4 v0, 0x0

    .line 648
    :goto_0
    return-object v0

    :cond_0
    const-string v0, "targetIntent"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    goto :goto_0
.end method

.method public a(Landroid/content/Context;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)Lcom/flurry/sdk/ag;
    .locals 15

    .prologue
    .line 1354
    move-object/from16 v0, p2

    iput-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->M:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    .line 1356
    if-nez p2, :cond_0

    .line 1357
    const/4 v1, 0x0

    .line 1380
    :goto_0
    return-object v1

    .line 1360
    :cond_0
    invoke-virtual/range {p2 .. p2}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->d()Ljava/util/List;

    move-result-object v1

    .line 1361
    if-eqz v1, :cond_1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1362
    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    .line 1365
    :cond_2
    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;

    .line 1366
    invoke-virtual {v14}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->b()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v10

    .line 1367
    invoke-virtual {v14}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->d()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    .line 1368
    invoke-virtual {v14}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->e()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdSpaceLayout;

    move-result-object v1

    invoke-virtual {v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdSpaceLayout;->e()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v12

    .line 1369
    invoke-virtual {v14}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->g()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1370
    iget-object v1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->m:Ljava/util/Map;

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flurry/sdk/e;

    .line 1371
    if-nez v1, :cond_3

    .line 1372
    invoke-static {p0, v2}, Lcom/flurry/sdk/bt;->a(Lcom/flurry/android/impl/ads/FlurryAdModule;Ljava/lang/String;)Lcom/flurry/sdk/e;

    move-result-object v6

    .line 1375
    :goto_1
    new-instance v1, Lcom/flurry/sdk/p;

    const-string v2, "filled"

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v3

    const/4 v7, 0x0

    move-object/from16 v4, p1

    move-object/from16 v5, p2

    invoke-direct/range {v1 .. v7}, Lcom/flurry/sdk/p;-><init>(Ljava/lang/String;Ljava/util/Map;Landroid/content/Context;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/e;I)V

    iget-object v2, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->V:Lcom/flurry/sdk/q;

    const/4 v3, 0x1

    invoke-virtual {p0, v1, v2, v3}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Lcom/flurry/sdk/p;Lcom/flurry/sdk/ad;I)V

    move-object v7, p0

    move-object/from16 v8, p1

    move-object/from16 v9, p2

    move-object v13, v6

    .line 1378
    invoke-direct/range {v7 .. v14}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Landroid/content/Context;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;ILjava/lang/String;Ljava/lang/String;Lcom/flurry/sdk/e;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;)Lcom/flurry/sdk/ag;

    move-result-object v1

    goto :goto_0

    :cond_3
    move-object v6, v1

    goto :goto_1
.end method

.method declared-synchronized a(Ljava/lang/String;ZLjava/util/Map;)Lcom/flurry/sdk/b;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/flurry/sdk/b;"
        }
    .end annotation

    .prologue
    .line 1187
    monitor-enter p0

    :try_start_0
    new-instance v0, Lcom/flurry/sdk/b;

    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->j()J

    move-result-wide v3

    move-object v1, p1

    move v2, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/flurry/sdk/b;-><init>(Ljava/lang/String;ZJLjava/util/Map;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized a(Lcom/flurry/sdk/e;Ljava/lang/String;ZLjava/util/Map;)Lcom/flurry/sdk/e;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/e;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/flurry/sdk/e;"
        }
    .end annotation

    .prologue
    .line 1168
    monitor-enter p0

    const/4 v0, 0x3

    :try_start_0
    sget-object v1, Lcom/flurry/android/impl/ads/FlurryAdModule;->r:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "changeAdState("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 1170
    monitor-enter p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 1171
    :try_start_1
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->L:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1172
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->L:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1173
    const/4 v0, 0x3

    sget-object v1, Lcom/flurry/android/impl/ads/FlurryAdModule;->r:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "changeAdState added adLog = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 1175
    :cond_0
    invoke-virtual {p0, p2, p3, p4}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Ljava/lang/String;ZLjava/util/Map;)Lcom/flurry/sdk/b;

    move-result-object v0

    .line 1176
    invoke-virtual {p1, v0}, Lcom/flurry/sdk/e;->a(Lcom/flurry/sdk/b;)V

    .line 1177
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1178
    monitor-exit p0

    return-object p1

    .line 1177
    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 1168
    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public a(Landroid/content/Context;Landroid/view/ViewGroup;Ljava/lang/String;)Lcom/flurry/sdk/k;
    .locals 1

    .prologue
    .line 632
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->W:Lcom/flurry/sdk/u;

    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/flurry/sdk/u;->a(Lcom/flurry/android/impl/ads/FlurryAdModule;Landroid/content/Context;Landroid/view/ViewGroup;Ljava/lang/String;)Lcom/flurry/sdk/k;

    move-result-object v0

    return-object v0
.end method

.method public a()Lcom/flurry/sdk/q;
    .locals 1

    .prologue
    .line 217
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->V:Lcom/flurry/sdk/q;

    return-object v0
.end method

.method public a(Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;Lcom/flurry/sdk/p;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;",
            "Lcom/flurry/sdk/p;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/flurry/sdk/a;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1207
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1208
    invoke-virtual {p1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->f()Ljava/util/List;

    move-result-object v0

    .line 1209
    iget-object v3, p2, Lcom/flurry/sdk/p;->a:Ljava/lang/String;

    .line 1212
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/Callback;

    .line 1213
    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/Callback;->b()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1214
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1216
    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/Callback;->c()Ljava/util/List;

    move-result-object v0

    .line 1217
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    .line 1218
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 1219
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1220
    const/16 v1, 0x3f

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    .line 1222
    const/4 v1, -0x1

    if-eq v7, v1, :cond_2

    .line 1224
    const/4 v1, 0x0

    invoke-virtual {v0, v1, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 1225
    add-int/lit8 v7, v7, 0x1

    invoke-virtual {v0, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 1227
    const-string v7, "%{eventParams}"

    invoke-virtual {v0, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 1228
    const-string v7, "%{eventParams}"

    const-string v8, ""

    invoke-virtual {v0, v7, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 1229
    iget-object v7, p2, Lcom/flurry/sdk/p;->b:Ljava/util/Map;

    invoke-interface {v6, v7}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 1232
    :cond_1
    invoke-static {v0}, Lcom/flurry/sdk/fh;->f(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v6, v0}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    move-object v0, v1

    .line 1236
    :cond_2
    new-instance v1, Lcom/flurry/sdk/a;

    invoke-direct {v1, v0, v6, p2}, Lcom/flurry/sdk/a;-><init>(Ljava/lang/String;Ljava/util/Map;Lcom/flurry/sdk/p;)V

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1241
    :cond_3
    return-object v2
.end method

.method public a(FF)V
    .locals 1

    .prologue
    .line 507
    invoke-static {}, Lcom/flurry/android/impl/ads/avro/protocol/v6/Location;->b()Lcom/flurry/android/impl/ads/avro/protocol/v6/Location$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/Location$Builder;->a(F)Lcom/flurry/android/impl/ads/avro/protocol/v6/Location$Builder;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/flurry/android/impl/ads/avro/protocol/v6/Location$Builder;->b(F)Lcom/flurry/android/impl/ads/avro/protocol/v6/Location$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/Location$Builder;->a()Lcom/flurry/android/impl/ads/avro/protocol/v6/Location;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->a:Lcom/flurry/android/impl/ads/avro/protocol/v6/Location;

    .line 508
    return-void
.end method

.method a(Landroid/app/Activity;)V
    .locals 5

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 374
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->K:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ne v2, v0, :cond_2

    .line 375
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->K:Ljava/util/List;

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 376
    const/4 v1, 0x0

    .line 378
    instance-of v4, v0, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

    if-eqz v4, :cond_5

    move-object v1, v0

    .line 379
    check-cast v1, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

    .line 380
    invoke-virtual {v1}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v4

    .line 381
    invoke-virtual {v1}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->getAdUnityView()Lcom/flurry/sdk/g;

    move-result-object v1

    .line 382
    if-eqz v1, :cond_4

    .line 383
    invoke-virtual {v1}, Lcom/flurry/sdk/g;->getAdFrameIndex()I

    move-result v1

    .line 386
    :goto_0
    if-eqz v4, :cond_2

    invoke-virtual {v4}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->e()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ne v4, v2, :cond_0

    if-lez v1, :cond_2

    .line 393
    :cond_0
    if-eqz p1, :cond_1

    instance-of v1, p1, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

    if-eqz v1, :cond_1

    .line 395
    check-cast p1, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

    .line 396
    invoke-virtual {p1}, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;->getResult()Lcom/flurry/sdk/m$e;

    move-result-object v1

    sget-object v4, Lcom/flurry/sdk/m$e;->b:Lcom/flurry/sdk/m$e;

    if-eq v1, v4, :cond_3

    move v1, v2

    :goto_1
    move v2, v1

    .line 399
    :cond_1
    if-eqz v2, :cond_2

    .line 400
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 404
    :cond_2
    return-void

    :cond_3
    move v1, v3

    .line 396
    goto :goto_1

    :cond_4
    move v1, v3

    goto :goto_0

    :cond_5
    move-object v4, v1

    move v1, v3

    goto :goto_0
.end method

.method public a(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 4

    .prologue
    .line 407
    if-nez p1, :cond_1

    .line 429
    :cond_0
    :goto_0
    return-void

    .line 411
    :cond_1
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->K:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 413
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 414
    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->b(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v1

    .line 415
    invoke-virtual {p0, p1, v1}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 417
    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Landroid/content/Intent;)Landroid/content/Intent;

    move-result-object v0

    .line 418
    if-eqz v0, :cond_0

    .line 419
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->I:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/FlurryAdListener;

    .line 420
    if-eqz v0, :cond_0

    .line 421
    invoke-static {}, Lcom/flurry/sdk/eg;->a()Lcom/flurry/sdk/eg;

    move-result-object v2

    new-instance v3, Lcom/flurry/android/impl/ads/FlurryAdModule$6;

    invoke-direct {v3, p0, v0, v1}, Lcom/flurry/android/impl/ads/FlurryAdModule$6;-><init>(Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/android/FlurryAdListener;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Lcom/flurry/sdk/eg;->a(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public declared-synchronized a(Landroid/content/Context;)V
    .locals 2

    .prologue
    .line 248
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->R:Z

    if-nez v0, :cond_1

    .line 250
    invoke-static {}, Lcom/flurry/sdk/bx;->a()Lcom/flurry/sdk/bx;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/sdk/bx;->h()Lcom/flurry/sdk/cl;

    move-result-object v0

    if-nez v0, :cond_0

    .line 251
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Flurry Session wasn\'t started"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 248
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 255
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->r()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->v:Ljava/io/File;

    .line 258
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->s()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->w:Ljava/io/File;

    .line 260
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->V:Lcom/flurry/sdk/q;

    invoke-virtual {v0}, Lcom/flurry/sdk/q;->a()V

    .line 263
    invoke-static {}, Lcom/flurry/sdk/em;->a()[B

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->A:[B

    .line 265
    new-instance v0, Lcom/flurry/android/impl/ads/FlurryAdModule$1;

    invoke-direct {v0, p0}, Lcom/flurry/android/impl/ads/FlurryAdModule$1;-><init>(Lcom/flurry/android/impl/ads/FlurryAdModule;)V

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Lcom/flurry/sdk/fi;)V

    .line 274
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->R:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 291
    :cond_1
    monitor-exit p0

    return-void
.end method

.method public a(Landroid/content/Context;JJ)V
    .locals 2

    .prologue
    .line 294
    new-instance v0, Lcom/flurry/sdk/ac;

    invoke-direct {v0}, Lcom/flurry/sdk/ac;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->S:Lcom/flurry/sdk/ac;

    .line 296
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->U:Lcom/flurry/sdk/s;

    if-nez v0, :cond_0

    .line 297
    new-instance v0, Lcom/flurry/sdk/s;

    invoke-direct {v0}, Lcom/flurry/sdk/s;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->U:Lcom/flurry/sdk/s;

    .line 300
    :cond_0
    iput-wide p2, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->d:J

    .line 301
    iput-wide p4, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->e:J

    .line 302
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->f:J

    .line 303
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->B:Z

    .line 304
    return-void
.end method

.method public a(Landroid/content/Context;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/ag;)V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 1473
    iget-object v1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->m:Ljava/util/Map;

    invoke-virtual {p2}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->d()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->g()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/flurry/sdk/e;

    .line 1475
    new-instance v0, Lcom/flurry/sdk/p;

    const-string v1, "requested"

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v2

    invoke-virtual {p3}, Lcom/flurry/sdk/ag;->b()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v4

    move-object v3, p1

    invoke-direct/range {v0 .. v6}, Lcom/flurry/sdk/p;-><init>(Ljava/lang/String;Ljava/util/Map;Landroid/content/Context;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/e;I)V

    iget-object v1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->V:Lcom/flurry/sdk/q;

    invoke-virtual {p0, v0, v1, v6}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Lcom/flurry/sdk/p;Lcom/flurry/sdk/ad;I)V

    .line 1477
    return-void
.end method

.method public a(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 337
    iget v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->l:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->l:I

    .line 338
    const/4 v0, 0x1

    iget v1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->l:I

    if-ne v0, v1, :cond_0

    .line 339
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->I:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/FlurryAdListener;

    .line 340
    if-eqz v0, :cond_0

    .line 341
    invoke-static {}, Lcom/flurry/sdk/eg;->a()Lcom/flurry/sdk/eg;

    move-result-object v1

    new-instance v2, Lcom/flurry/android/impl/ads/FlurryAdModule$4;

    invoke-direct {v2, p0, v0, p2}, Lcom/flurry/android/impl/ads/FlurryAdModule$4;-><init>(Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/android/FlurryAdListener;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/flurry/sdk/eg;->a(Ljava/lang/Runnable;)V

    .line 349
    :cond_0
    return-void
.end method

.method public a(Lcom/flurry/android/FlurryAdListener;)V
    .locals 1

    .prologue
    .line 503
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->I:Ljava/lang/ref/WeakReference;

    .line 504
    return-void
.end method

.method public a(Lcom/flurry/android/ICustomAdNetworkHandler;)V
    .locals 0

    .prologue
    .line 515
    iput-object p1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->k:Lcom/flurry/android/ICustomAdNetworkHandler;

    .line 516
    return-void
.end method

.method public a(Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V
    .locals 0

    .prologue
    .line 1199
    iput-object p1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->F:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    .line 1200
    return-void
.end method

.method public declared-synchronized a(Lcom/flurry/sdk/e;)V
    .locals 2

    .prologue
    .line 624
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->L:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/16 v1, 0x7fff

    if-ge v0, v1, :cond_0

    .line 625
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->L:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 626
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->m:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/flurry/sdk/e;->b()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 628
    :cond_0
    monitor-exit p0

    return-void

    .line 624
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public a(Lcom/flurry/sdk/fi;)V
    .locals 1

    .prologue
    .line 229
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->h:Landroid/os/Handler;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 230
    return-void
.end method

.method public a(Lcom/flurry/sdk/p;Lcom/flurry/sdk/ad;I)V
    .locals 8

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    const/4 v4, 0x0

    .line 1246
    const/4 v0, 0x3

    sget-object v1, Lcom/flurry/android/impl/ads/FlurryAdModule;->r:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "onEvent:event="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p1, Lcom/flurry/sdk/p;->a:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ",params="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p1, Lcom/flurry/sdk/p;->b:Ljava/util/Map;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v1, v5}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 1248
    iget-object v0, p1, Lcom/flurry/sdk/p;->a:Ljava/lang/String;

    invoke-virtual {p0, v0, v2}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Ljava/lang/String;I)V

    .line 1250
    invoke-virtual {p1}, Lcom/flurry/sdk/p;->b()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;Lcom/flurry/sdk/p;)Ljava/util/List;

    move-result-object v5

    .line 1253
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1254
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->O:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_0
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 1255
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v7, p1, Lcom/flurry/sdk/p;->a:Ljava/lang/String;

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1256
    new-instance v1, Lcom/flurry/sdk/a;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v7, p1, Lcom/flurry/sdk/p;->b:Ljava/util/Map;

    invoke-direct {v1, v0, v7, p1}, Lcom/flurry/sdk/a;-><init>(Ljava/lang/String;Ljava/util/Map;Lcom/flurry/sdk/p;)V

    invoke-interface {v5, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1263
    :cond_1
    iget-object v0, p1, Lcom/flurry/sdk/p;->a:Ljava/lang/String;

    const-string v1, "adWillClose"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1265
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/a;

    .line 1266
    iget-object v6, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->P:Ljava/util/Set;

    iget-object v0, v0, Lcom/flurry/sdk/a;->a:Ljava/lang/String;

    invoke-interface {v6, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    move v0, v2

    .line 1271
    :goto_1
    if-nez v0, :cond_3

    .line 1272
    new-instance v0, Lcom/flurry/sdk/a;

    const-string v1, "closeAd"

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v2

    invoke-direct {v0, v1, v2, p1}, Lcom/flurry/sdk/a;-><init>(Ljava/lang/String;Ljava/util/Map;Lcom/flurry/sdk/p;)V

    invoke-interface {v5, v4, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 1277
    :cond_3
    iget-object v0, p1, Lcom/flurry/sdk/p;->a:Ljava/lang/String;

    const-string v1, "renderFailed"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1278
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->I:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/FlurryAdListener;

    .line 1279
    if-eqz v0, :cond_4

    .line 1280
    invoke-static {}, Lcom/flurry/sdk/eg;->a()Lcom/flurry/sdk/eg;

    move-result-object v1

    new-instance v2, Lcom/flurry/android/impl/ads/FlurryAdModule$8;

    invoke-direct {v2, p0, v0, p1}, Lcom/flurry/android/impl/ads/FlurryAdModule$8;-><init>(Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/android/FlurryAdListener;Lcom/flurry/sdk/p;)V

    invoke-virtual {v1, v2}, Lcom/flurry/sdk/eg;->a(Ljava/lang/Runnable;)V

    .line 1289
    :cond_4
    invoke-virtual {p0, v3}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Landroid/app/Activity;)V

    .line 1292
    :cond_5
    iget-object v0, p1, Lcom/flurry/sdk/p;->a:Ljava/lang/String;

    const-string v1, "clicked"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 1293
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->I:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/FlurryAdListener;

    .line 1294
    if-eqz v0, :cond_6

    .line 1295
    invoke-static {}, Lcom/flurry/sdk/eg;->a()Lcom/flurry/sdk/eg;

    move-result-object v1

    new-instance v2, Lcom/flurry/android/impl/ads/FlurryAdModule$9;

    invoke-direct {v2, p0, v0, p1}, Lcom/flurry/android/impl/ads/FlurryAdModule$9;-><init>(Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/android/FlurryAdListener;Lcom/flurry/sdk/p;)V

    invoke-virtual {v1, v2}, Lcom/flurry/sdk/eg;->a(Ljava/lang/Runnable;)V

    .line 1303
    :cond_6
    iget-object v0, p1, Lcom/flurry/sdk/p;->a:Ljava/lang/String;

    const-string v1, "videoCompleted"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 1304
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->I:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/FlurryAdListener;

    .line 1305
    if-eqz v0, :cond_7

    .line 1306
    invoke-static {}, Lcom/flurry/sdk/eg;->a()Lcom/flurry/sdk/eg;

    move-result-object v1

    new-instance v2, Lcom/flurry/android/impl/ads/FlurryAdModule$2;

    invoke-direct {v2, p0, v0, p1}, Lcom/flurry/android/impl/ads/FlurryAdModule$2;-><init>(Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/android/FlurryAdListener;Lcom/flurry/sdk/p;)V

    invoke-virtual {v1, v2}, Lcom/flurry/sdk/eg;->a(Ljava/lang/Runnable;)V

    .line 1318
    :cond_7
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    move-object v1, v3

    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lcom/flurry/sdk/a;

    .line 1319
    iget-object v0, v2, Lcom/flurry/sdk/a;->a:Ljava/lang/String;

    const-string v3, "logEvent"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 1321
    iget-object v0, v2, Lcom/flurry/sdk/a;->b:Ljava/util/Map;

    const-string v1, "__sendToServer"

    const-string v3, "true"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v3, v2

    .line 1324
    :goto_3
    iget-object v0, v2, Lcom/flurry/sdk/a;->a:Ljava/lang/String;

    const-string v1, "loadAdComponents"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 1325
    iget-object v0, v2, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    iget-object v0, v0, Lcom/flurry/sdk/p;->b:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 1327
    :goto_4
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 1328
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 1329
    iget-object v6, v2, Lcom/flurry/sdk/a;->b:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v6, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4

    .line 1332
    :cond_8
    sget-object v0, Lcom/flurry/android/impl/ads/FlurryAdModule;->r:Ljava/lang/String;

    invoke-virtual {v2}, Lcom/flurry/sdk/a;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1333
    add-int/lit8 v0, p3, 0x1

    invoke-interface {p2, v2, p0, v0}, Lcom/flurry/sdk/ad;->a(Lcom/flurry/sdk/a;Lcom/flurry/sdk/ae;I)V

    move-object v1, v3

    goto :goto_2

    .line 1336
    :cond_9
    if-nez v1, :cond_a

    .line 1337
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1338
    const-string v1, "__sendToServer"

    const-string v2, "false"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1339
    new-instance v1, Lcom/flurry/sdk/a;

    const-string v2, "logEvent"

    invoke-direct {v1, v2, v0, p1}, Lcom/flurry/sdk/a;-><init>(Ljava/lang/String;Ljava/util/Map;Lcom/flurry/sdk/p;)V

    .line 1340
    add-int/lit8 v0, p3, 0x1

    invoke-interface {p2, v1, p0, v0}, Lcom/flurry/sdk/ad;->a(Lcom/flurry/sdk/a;Lcom/flurry/sdk/ae;I)V

    .line 1341
    sget-object v0, Lcom/flurry/android/impl/ads/FlurryAdModule;->r:Ljava/lang/String;

    invoke-virtual {v1}, Lcom/flurry/sdk/a;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1343
    :cond_a
    return-void

    :cond_b
    move-object v3, v1

    goto :goto_3

    :cond_c
    move v0, v4

    goto/16 :goto_1
.end method

.method declared-synchronized a(Lcom/flurry/sdk/z;Ljava/io/DataOutputStream;)V
    .locals 5

    .prologue
    .line 1033
    monitor-enter p0

    :try_start_0
    invoke-virtual {p1}, Lcom/flurry/sdk/z;->c()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/y;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1036
    const/4 v2, 0x1

    :try_start_1
    invoke-virtual {p2, v2}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 1037
    invoke-virtual {v0, p2}, Lcom/flurry/sdk/y;->a(Ljava/io/DataOutput;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1038
    :catch_0
    move-exception v2

    .line 1039
    :try_start_2
    sget-object v2, Lcom/flurry/android/impl/ads/FlurryAdModule;->r:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "unable to convert freqCap to byte[]: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lcom/flurry/sdk/y;->b()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/flurry/sdk/ex;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 1033
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 1043
    :cond_0
    monitor-exit p0

    return-void
.end method

.method declared-synchronized a(Ljava/io/DataInputStream;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1019
    monitor-enter p0

    :goto_0
    :try_start_0
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readShort()S

    move-result v0

    .line 1020
    if-nez v0, :cond_0

    .line 1028
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->t:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 1029
    monitor-exit p0

    return-void

    .line 1023
    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->i:Lcom/flurry/sdk/z;

    monitor-enter v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 1024
    :try_start_2
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->i:Lcom/flurry/sdk/z;

    new-instance v2, Lcom/flurry/sdk/y;

    invoke-direct {v2, p1}, Lcom/flurry/sdk/y;-><init>(Ljava/io/DataInput;)V

    invoke-virtual {v0, v2}, Lcom/flurry/sdk/z;->a(Lcom/flurry/sdk/y;)V

    .line 1025
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 1019
    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public a(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 674
    iput-object p1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->C:Ljava/lang/String;

    .line 675
    return-void
.end method

.method public a(Ljava/lang/String;I)V
    .locals 3

    .prologue
    .line 542
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->c:Ljava/util/TreeMap;

    invoke-virtual {v0, p1}, Ljava/util/TreeMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 543
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->c:Ljava/util/TreeMap;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 560
    :cond_0
    return-void

    .line 547
    :cond_1
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->c:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 552
    :cond_2
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 553
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 555
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    if-ne v1, p1, :cond_2

    .line 556
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v1, p2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map$Entry;->setValue(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public a(Ljava/lang/String;Ljava/lang/CharSequence;)V
    .locals 1

    .prologue
    .line 520
    iput-object p2, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->J:Ljava/lang/CharSequence;

    .line 523
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->W:Lcom/flurry/sdk/u;

    invoke-virtual {v0, p1}, Lcom/flurry/sdk/u;->d(Ljava/lang/String;)V

    .line 524
    return-void
.end method

.method public a(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Lcom/flurry/sdk/ej;",
            "Ljava/nio/ByteBuffer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 499
    iput-object p1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->T:Ljava/util/Map;

    .line 500
    return-void
.end method

.method public a(Z)V
    .locals 0

    .prologue
    .line 683
    iput-boolean p1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->o:Z

    .line 684
    return-void
.end method

.method public b()Lcom/flurry/sdk/u;
    .locals 1

    .prologue
    .line 225
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->W:Lcom/flurry/sdk/u;

    return-object v0
.end method

.method b(Landroid/content/Intent;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 652
    if-nez p1, :cond_0

    .line 653
    const/4 v0, 0x0

    .line 656
    :goto_0
    return-object v0

    :cond_0
    const-string v0, "adSpaceName"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public b(Landroid/app/Activity;)V
    .locals 1

    .prologue
    .line 432
    if-nez p1, :cond_0

    .line 444
    :goto_0
    return-void

    .line 436
    :cond_0
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 437
    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->b(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v0

    .line 438
    invoke-virtual {p0, p1, v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->b(Landroid/content/Context;Ljava/lang/String;)V

    .line 440
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->K:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 443
    invoke-virtual {p0, p1}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Landroid/app/Activity;)V

    goto :goto_0
.end method

.method public b(Landroid/content/Context;)V
    .locals 1

    .prologue
    .line 307
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->i:Lcom/flurry/sdk/z;

    invoke-virtual {v0}, Lcom/flurry/sdk/z;->d()V

    .line 308
    return-void
.end method

.method public b(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 352
    iget v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->l:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->l:I

    .line 353
    iget v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->l:I

    if-nez v0, :cond_0

    .line 354
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->I:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/FlurryAdListener;

    .line 355
    if-eqz v0, :cond_0

    .line 356
    invoke-static {}, Lcom/flurry/sdk/eg;->a()Lcom/flurry/sdk/eg;

    move-result-object v1

    new-instance v2, Lcom/flurry/android/impl/ads/FlurryAdModule$5;

    invoke-direct {v2, p0, v0, p2}, Lcom/flurry/android/impl/ads/FlurryAdModule$5;-><init>(Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/android/FlurryAdListener;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/flurry/sdk/eg;->a(Ljava/lang/Runnable;)V

    .line 364
    :cond_0
    return-void
.end method

.method public b(Lcom/flurry/sdk/e;)V
    .locals 0

    .prologue
    .line 1191
    iput-object p1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->E:Lcom/flurry/sdk/e;

    .line 1192
    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 679
    iput-object p1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->D:Ljava/lang/String;

    .line 680
    return-void
.end method

.method public b(Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 744
    if-eqz p1, :cond_1

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 745
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 746
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 747
    iget-object v2, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->b:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 749
    :cond_0
    sget-object v0, Lcom/flurry/android/impl/ads/FlurryAdModule;->r:Ljava/lang/String;

    const-string v2, "User cookie keys and values may not be null."

    invoke-static {v0, v2}, Lcom/flurry/sdk/ex;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 752
    :cond_1
    return-void
.end method

.method public b(Z)V
    .locals 0

    .prologue
    .line 1434
    return-void
.end method

.method public c(Landroid/content/Context;)V
    .locals 1

    .prologue
    .line 311
    new-instance v0, Lcom/flurry/android/impl/ads/FlurryAdModule$3;

    invoke-direct {v0, p0}, Lcom/flurry/android/impl/ads/FlurryAdModule$3;-><init>(Lcom/flurry/android/impl/ads/FlurryAdModule;)V

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Lcom/flurry/sdk/fi;)V

    .line 327
    iget-boolean v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->R:Z

    if-eqz v0, :cond_0

    .line 328
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->z()V

    .line 330
    :cond_0
    return-void
.end method

.method public c(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 765
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->p:Ljava/util/Map;

    if-eq p1, v0, :cond_0

    if-eqz p1, :cond_2

    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->p:Ljava/util/Map;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_0
    const/4 v0, 0x1

    .line 768
    :goto_0
    iput-object p1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->p:Ljava/util/Map;

    .line 769
    if-eqz v0, :cond_1

    .line 770
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->W:Lcom/flurry/sdk/u;

    invoke-virtual {v0}, Lcom/flurry/sdk/u;->a()V

    .line 772
    :cond_1
    return-void

    .line 765
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public c()Z
    .locals 1

    .prologue
    .line 367
    iget v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->l:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public d()J
    .locals 2

    .prologue
    .line 447
    iget-wide v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->d:J

    return-wide v0
.end method

.method public d(Landroid/content/Context;)V
    .locals 1

    .prologue
    .line 333
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->W:Lcom/flurry/sdk/u;

    invoke-virtual {v0, p1}, Lcom/flurry/sdk/u;->a(Landroid/content/Context;)Z

    .line 334
    return-void
.end method

.method public declared-synchronized e(Landroid/content/Context;)V
    .locals 5

    .prologue
    .line 797
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->B:Z

    if-nez v0, :cond_0

    .line 798
    sget-object v0, Lcom/flurry/android/impl/ads/FlurryAdModule;->r:Ljava/lang/String;

    const-string v1, "Initializing ads -- requesting ads with precaching enabled on the server"

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 800
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->W:Lcom/flurry/sdk/u;

    const-string v1, ""

    const/4 v2, 0x0

    sget-object v3, Lcom/flurry/android/FlurryAdSize;->BANNER_BOTTOM:Lcom/flurry/android/FlurryAdSize;

    const/4 v4, 0x1

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/flurry/sdk/u;->a(Ljava/lang/String;Landroid/view/ViewGroup;Lcom/flurry/android/FlurryAdSize;Z)V

    .line 801
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->B:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 806
    :goto_0
    monitor-exit p0

    return-void

    .line 803
    :cond_0
    :try_start_1
    sget-object v0, Lcom/flurry/android/impl/ads/FlurryAdModule;->r:Ljava/lang/String;

    const-string v1, "Initializing ads -- not making a new ad request (for ads with precaching enabled on the server) since one was made already this session"

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->c(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 797
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public f()Ljava/lang/String;
    .locals 1

    .prologue
    .line 458
    invoke-static {}, Lcom/flurry/sdk/bx;->a()Lcom/flurry/sdk/bx;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/sdk/bx;->j()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public f(Landroid/content/Context;)V
    .locals 1

    .prologue
    .line 1489
    invoke-static {}, Lcom/flurry/sdk/t;->a()Lcom/flurry/sdk/t;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/flurry/sdk/t;->f(Landroid/content/Context;)V

    .line 1490
    return-void
.end method

.method public g()Ljava/lang/String;
    .locals 1

    .prologue
    .line 462
    invoke-static {}, Lcom/flurry/sdk/bx;->a()Lcom/flurry/sdk/bx;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/sdk/bx;->k()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public g(Landroid/content/Context;)V
    .locals 1

    .prologue
    .line 1494
    invoke-static {}, Lcom/flurry/sdk/t;->a()Lcom/flurry/sdk/t;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/flurry/sdk/t;->g(Landroid/content/Context;)V

    .line 1495
    return-void
.end method

.method public h()Ljava/lang/String;
    .locals 1

    .prologue
    .line 466
    invoke-static {}, Lcom/flurry/sdk/bx;->a()Lcom/flurry/sdk/bx;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/sdk/bx;->l()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public i()Lcom/flurry/android/impl/ads/avro/protocol/v6/Location;
    .locals 4

    .prologue
    const/4 v0, 0x0

    .line 470
    iget-object v1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->a:Lcom/flurry/android/impl/ads/avro/protocol/v6/Location;

    .line 471
    if-eqz v1, :cond_0

    move-object v0, v1

    .line 483
    :goto_0
    return-object v0

    .line 477
    :cond_0
    invoke-static {}, Lcom/flurry/sdk/en;->a()Lcom/flurry/sdk/en;

    move-result-object v1

    invoke-virtual {v1}, Lcom/flurry/sdk/en;->e()Landroid/location/Location;

    move-result-object v2

    .line 478
    if-eqz v2, :cond_1

    .line 479
    invoke-virtual {v2}, Landroid/location/Location;->getLatitude()D

    move-result-wide v0

    double-to-float v1, v0

    .line 480
    invoke-virtual {v2}, Landroid/location/Location;->getLongitude()D

    move-result-wide v2

    double-to-float v0, v2

    .line 483
    :goto_1
    invoke-static {}, Lcom/flurry/android/impl/ads/avro/protocol/v6/Location;->b()Lcom/flurry/android/impl/ads/avro/protocol/v6/Location$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/Location$Builder;->a(F)Lcom/flurry/android/impl/ads/avro/protocol/v6/Location$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/Location$Builder;->b(F)Lcom/flurry/android/impl/ads/avro/protocol/v6/Location$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/Location$Builder;->a()Lcom/flurry/android/impl/ads/avro/protocol/v6/Location;

    move-result-object v0

    goto :goto_0

    :cond_1
    move v1, v0

    goto :goto_1
.end method

.method public declared-synchronized j()J
    .locals 4

    .prologue
    .line 488
    monitor-enter p0

    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->e:J

    sub-long/2addr v0, v2

    .line 489
    iget-wide v2, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->f:J

    cmp-long v2, v0, v2

    if-lez v2, :cond_0

    :goto_0
    iput-wide v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->f:J

    .line 491
    iget-wide v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->f:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-wide v0

    .line 489
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->f:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->f:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 488
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public k()V
    .locals 1

    .prologue
    .line 511
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->a:Lcom/flurry/android/impl/ads/avro/protocol/v6/Location;

    .line 512
    return-void
.end method

.method public l()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    .line 529
    sget-object v0, Lcom/flurry/android/impl/ads/FlurryAdModule;->r:Ljava/lang/String;

    const-string v1, "========== PRINT COUNTERS =========="

    invoke-static {v5, v0, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 531
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->c:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 532
    sget-object v3, Lcom/flurry/android/impl/ads/FlurryAdModule;->r:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, " "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v3, v0}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 536
    :cond_0
    sget-object v0, Lcom/flurry/android/impl/ads/FlurryAdModule;->r:Ljava/lang/String;

    const-string v1, "========== END PRINT COUNTERS =========="

    invoke-static {v5, v0, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 537
    return-void
.end method

.method public m()Lcom/flurry/android/ICustomAdNetworkHandler;
    .locals 1

    .prologue
    .line 586
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->k:Lcom/flurry/android/ICustomAdNetworkHandler;

    return-object v0
.end method

.method public n()Ljava/lang/String;
    .locals 1

    .prologue
    .line 590
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->g:Ljava/lang/String;

    return-object v0
.end method

.method public o()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Lcom/flurry/sdk/ej;",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 594
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->T:Ljava/util/Map;

    return-object v0
.end method

.method public p()Z
    .locals 1

    .prologue
    .line 598
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->p:Ljava/util/Map;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public q()Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/CharSequence;",
            "Ljava/lang/CharSequence;",
            ">;"
        }
    .end annotation

    .prologue
    .line 610
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 611
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->p:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 612
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 613
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 614
    if-nez v1, :cond_0

    .line 615
    const-string v1, ""

    .line 616
    :cond_0
    if-nez v0, :cond_1

    .line 617
    const-string v0, ""

    .line 618
    :cond_1
    invoke-interface {v2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 620
    :cond_2
    return-object v2
.end method

.method r()Ljava/lang/String;
    .locals 3

    .prologue
    .line 661
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ".flurryadlog."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->f()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/16 v2, 0x10

    invoke-static {v1, v2}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method s()Ljava/lang/String;
    .locals 3

    .prologue
    .line 665
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ".flurryfreqcap."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->f()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/16 v2, 0x10

    invoke-static {v1, v2}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public t()Ljava/lang/String;
    .locals 2

    .prologue
    .line 690
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->C:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 691
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->C:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/v6/getAds.do"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 696
    :goto_0
    return-object v0

    .line 693
    :cond_0
    invoke-static {}, Lcom/flurry/android/FlurryAgent;->getUseHttps()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 694
    const-string v0, "https://ads.flurry.com/v6/getAds.do"

    goto :goto_0

    .line 696
    :cond_1
    const-string v0, "http://ads.flurry.com/v6/getAds.do"

    goto :goto_0
.end method

.method u()Ljava/lang/String;
    .locals 1

    .prologue
    .line 727
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->D:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 728
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->D:Ljava/lang/String;

    .line 734
    :goto_0
    return-object v0

    .line 729
    :cond_0
    invoke-static {}, Lcom/flurry/android/FlurryAgent;->getUseHttps()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 730
    const-string v0, "https://adlog.flurry.com"

    goto :goto_0

    .line 732
    :cond_1
    const-string v0, "http://adlog.flurry.com"

    goto :goto_0
.end method

.method public v()V
    .locals 1

    .prologue
    .line 756
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->b:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 757
    return-void
.end method

.method public w()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 761
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->b:Ljava/util/Map;

    return-object v0
.end method

.method public x()V
    .locals 1

    .prologue
    .line 779
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->p:Ljava/util/Map;

    .line 780
    return-void
.end method

.method public y()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 786
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->w()Ljava/util/Map;

    move-result-object v0

    .line 787
    iget-object v1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->S:Lcom/flurry/sdk/ac;

    if-eqz v1, :cond_0

    .line 788
    iget-object v1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule;->S:Lcom/flurry/sdk/ac;

    invoke-virtual {v1}, Lcom/flurry/sdk/ac;->a()Ljava/lang/String;

    move-result-object v1

    .line 789
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 790
    const-string v2, "appCloudUserId"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 793
    :cond_0
    return-object v0
.end method

.method public declared-synchronized z()V
    .locals 1

    .prologue
    .line 810
    monitor-enter p0

    :try_start_0
    new-instance v0, Lcom/flurry/android/impl/ads/FlurryAdModule$7;

    invoke-direct {v0, p0}, Lcom/flurry/android/impl/ads/FlurryAdModule$7;-><init>(Lcom/flurry/android/impl/ads/FlurryAdModule;)V

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Lcom/flurry/sdk/fi;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 816
    monitor-exit p0

    return-void

    .line 810
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
