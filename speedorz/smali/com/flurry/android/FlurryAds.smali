.class public Lcom/flurry/android/FlurryAds;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/android/ap;


# static fields
.field private static fS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static fT:Lcom/flurry/org/apache/avro/io/DecoderFactory;

.field private static fU:Lcom/flurry/android/dq;

.field private static gD:Lcom/flurry/android/FlurryAds;

.field static m:Ljava/lang/String;


# instance fields
.field private aC:Ljava/lang/String;

.field private aG:Ljava/lang/String;

.field private aH:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation
.end field

.field private aL:J

.field private aM:J

.field private fV:Lcom/flurry/android/dl;

.field private fW:Z

.field private fX:Z

.field private fY:Ljava/io/File;

.field private fZ:Ljava/io/File;

.field private gA:Lcom/flurry/android/ep;

.field private final gB:Ljava/util/Map;
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

.field private final gC:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private gE:Z

.field private gF:Lcom/flurry/android/FlurryUserIdProvider;

.field private ga:Ljava/lang/String;

.field private gb:Z

.field private volatile gc:Ljava/lang/String;

.field private volatile gd:Ljava/lang/String;

.field private volatile ge:Lcom/flurry/android/Location;

.field private volatile gf:Ljava/util/Map;
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

.field private gg:Lcom/flurry/android/ck;

.field private gh:Lcom/flurry/android/AdUnit;

.field private gi:J

.field gj:Lcom/flurry/android/x;

.field private gk:Ljava/lang/String;

.field private gl:Landroid/os/Handler;

.field gm:Lcom/flurry/android/fv;

.field gn:Lcom/flurry/android/FlurryFreqCapManager;

.field private go:Lcom/flurry/android/ICustomAdNetworkHandler;

.field private final gp:Lcom/flurry/android/j;

.field private final gq:Lcom/flurry/android/au;

.field private gr:Lcom/flurry/android/FlurryAdListener;

.field private gs:I

.field volatile gt:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/flurry/android/ck;",
            ">;"
        }
    .end annotation
.end field

.field private volatile gu:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/flurry/android/ck;",
            ">;"
        }
    .end annotation
.end field

.field private volatile gv:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/flurry/android/ck;",
            ">;"
        }
    .end annotation
.end field

.field private volatile gw:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private volatile gx:Z

.field private gy:Ljava/util/Map;
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

.field private gz:Lcom/flurry/android/AdUnit;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 98
    const-string v0, "FlurryAgent"

    sput-object v0, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    return-void
.end method

.method constructor <init>()V
    .locals 8

    .prologue
    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v0, 0x0

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 194
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 101
    iput-boolean v4, p0, Lcom/flurry/android/FlurryAds;->fW:Z

    .line 102
    iput-boolean v4, p0, Lcom/flurry/android/FlurryAds;->fX:Z

    .line 103
    iput-object v0, p0, Lcom/flurry/android/FlurryAds;->fY:Ljava/io/File;

    .line 104
    iput-object v0, p0, Lcom/flurry/android/FlurryAds;->fZ:Ljava/io/File;

    .line 107
    iput-boolean v5, p0, Lcom/flurry/android/FlurryAds;->gb:Z

    .line 108
    iput-object v0, p0, Lcom/flurry/android/FlurryAds;->gc:Ljava/lang/String;

    .line 112
    iput-object v0, p0, Lcom/flurry/android/FlurryAds;->gd:Ljava/lang/String;

    .line 195
    invoke-static {}, Lcom/flurry/android/FlurryFreqCapManager;->U()Lcom/flurry/android/FlurryFreqCapManager;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/android/FlurryAds;->gn:Lcom/flurry/android/FlurryFreqCapManager;

    .line 197
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/FlurryAds;->gt:Ljava/util/List;

    .line 198
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/FlurryAds;->gu:Ljava/util/Map;

    .line 199
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/FlurryAds;->gv:Ljava/util/List;

    .line 200
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/FlurryAds;->gw:Ljava/util/List;

    .line 201
    iput-boolean v4, p0, Lcom/flurry/android/FlurryAds;->gx:Z

    .line 204
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 205
    const-string v1, "open"

    const-string v2, "directOpen"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    const-string v1, "expand"

    const-string v2, "doExpand"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 207
    const-string v1, "collapse"

    const-string v2, "doCollapse"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 208
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/android/FlurryAds;->gB:Ljava/util/Map;

    .line 211
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 212
    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "closeAd"

    aput-object v2, v1, v4

    const-string v2, "processRedirect"

    aput-object v2, v1, v5

    const-string v2, "nextFrame"

    aput-object v2, v1, v6

    const-string v2, "nextAdUnit"

    aput-object v2, v1, v7

    const/4 v2, 0x4

    const-string v3, "notifyUser"

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 213
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/android/FlurryAds;->gC:Ljava/util/Set;

    .line 216
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "FlurryAdThread"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 217
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 218
    new-instance v1, Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {v1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/flurry/android/FlurryAds;->gl:Landroid/os/Handler;

    .line 220
    new-instance v0, Lcom/flurry/android/x;

    invoke-direct {v0}, Lcom/flurry/android/x;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/FlurryAds;->gj:Lcom/flurry/android/x;

    .line 221
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

    sput-object v0, Lcom/flurry/android/FlurryAds;->fS:Ljava/util/List;

    .line 223
    new-instance v0, Lcom/flurry/org/apache/avro/io/DecoderFactory;

    invoke-direct {v0}, Lcom/flurry/org/apache/avro/io/DecoderFactory;-><init>()V

    sput-object v0, Lcom/flurry/android/FlurryAds;->fT:Lcom/flurry/org/apache/avro/io/DecoderFactory;

    .line 224
    new-instance v0, Lcom/flurry/android/dq;

    invoke-direct {v0, p0}, Lcom/flurry/android/dq;-><init>(Lcom/flurry/android/FlurryAds;)V

    sput-object v0, Lcom/flurry/android/FlurryAds;->fU:Lcom/flurry/android/dq;

    .line 225
    new-instance v0, Lcom/flurry/android/dl;

    invoke-direct {v0, p0}, Lcom/flurry/android/dl;-><init>(Lcom/flurry/android/FlurryAds;)V

    iput-object v0, p0, Lcom/flurry/android/FlurryAds;->fV:Lcom/flurry/android/dl;

    .line 227
    new-instance v0, Lcom/flurry/android/fv;

    invoke-direct {v0}, Lcom/flurry/android/fv;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/FlurryAds;->gm:Lcom/flurry/android/fv;

    .line 230
    sget-object v0, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    iput-object v0, p0, Lcom/flurry/android/FlurryAds;->aC:Ljava/lang/String;

    .line 231
    sget-object v0, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    iput-object v0, p0, Lcom/flurry/android/FlurryAds;->ga:Ljava/lang/String;

    .line 233
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/FlurryAds;->gf:Ljava/util/Map;

    .line 235
    new-instance v0, Lcom/flurry/android/i;

    invoke-direct {v0}, Lcom/flurry/android/i;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/FlurryAds;->gp:Lcom/flurry/android/j;

    .line 236
    new-instance v0, Lcom/flurry/android/g;

    invoke-direct {v0}, Lcom/flurry/android/g;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/FlurryAds;->gq:Lcom/flurry/android/au;

    .line 237
    return-void
.end method

.method private D(Ljava/lang/String;)Lcom/flurry/android/ep;
    .locals 1

    .prologue
    .line 3044
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gm:Lcom/flurry/android/fv;

    invoke-virtual {v0, p1}, Lcom/flurry/android/fv;->D(Ljava/lang/String;)Lcom/flurry/android/ep;

    move-result-object v0

    return-object v0
.end method

.method private E(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 3049
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gm:Lcom/flurry/android/fv;

    invoke-virtual {v0, p1}, Lcom/flurry/android/fv;->E(Ljava/lang/String;)V

    .line 3050
    return-void
.end method

.method private a(Landroid/content/Context;Lcom/flurry/android/AdUnit;)Lcom/flurry/android/ep;
    .locals 13

    .prologue
    const/4 v12, 0x1

    const/4 v6, 0x0

    const/4 v8, 0x0

    .line 2788
    iput-object p2, p0, Lcom/flurry/android/FlurryAds;->gz:Lcom/flurry/android/AdUnit;

    .line 2796
    if-nez p2, :cond_0

    move-object v0, v8

    .line 2818
    :goto_0
    return-object v0

    .line 2801
    :cond_0
    invoke-virtual {p2}, Lcom/flurry/android/AdUnit;->getAdFrames()Ljava/util/List;

    move-result-object v0

    .line 2802
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_3

    .line 2804
    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Lcom/flurry/android/AdFrame;

    .line 2805
    invoke-virtual {v7}, Lcom/flurry/android/AdFrame;->getBinding()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v9

    .line 2806
    invoke-virtual {v7}, Lcom/flurry/android/AdFrame;->getContent()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v10

    .line 2807
    invoke-virtual {v7}, Lcom/flurry/android/AdFrame;->getAdSpaceLayout()Lcom/flurry/android/AdSpaceLayout;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/AdSpaceLayout;->getFormat()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    .line 2808
    invoke-virtual {v7}, Lcom/flurry/android/AdFrame;->getAdGuid()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "filled"

    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gu:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/ck;

    if-nez v0, :cond_1

    invoke-static {p0, v1}, Lcom/flurry/android/ci;->a(Lcom/flurry/android/FlurryAds;Ljava/lang/String;)Lcom/flurry/android/ck;

    move-result-object v0

    :cond_1
    invoke-virtual {p0, v0, v2, v12, v8}, Lcom/flurry/android/FlurryAds;->a(Lcom/flurry/android/ck;Ljava/lang/String;ZLjava/util/Map;)Lcom/flurry/android/ck;

    move-result-object v5

    .line 2815
    new-instance v0, Lcom/flurry/android/fs;

    const-string v1, "filled"

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v2

    move-object v3, p1

    move-object v4, p2

    invoke-direct/range {v0 .. v6}, Lcom/flurry/android/fs;-><init>(Ljava/lang/String;Ljava/util/Map;Landroid/content/Context;Lcom/flurry/android/AdUnit;Lcom/flurry/android/ck;I)V

    invoke-virtual {p0, v0, p0, v12}, Lcom/flurry/android/FlurryAds;->onEvent(Lcom/flurry/android/fs;Lcom/flurry/android/ap;I)V

    .line 2817
    invoke-virtual {v7}, Lcom/flurry/android/AdFrame;->getAdSpaceLayout()Lcom/flurry/android/AdSpaceLayout;

    move-result-object v0

    invoke-static {v0}, Lcom/flurry/android/ci;->b(Lcom/flurry/android/AdSpaceLayout;)Lcom/flurry/android/AdCreative;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/android/FlurryAds;->gz:Lcom/flurry/android/AdUnit;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/flurry/android/FlurryAds;->gz:Lcom/flurry/android/AdUnit;

    if-eq v1, p2, :cond_4

    .line 2818
    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gA:Lcom/flurry/android/ep;

    goto :goto_0

    :cond_3
    move-object v0, v8

    .line 2812
    goto :goto_0

    .line 2817
    :cond_4
    iput-object v8, p0, Lcom/flurry/android/FlurryAds;->gA:Lcom/flurry/android/ep;

    iget-object v1, p0, Lcom/flurry/android/FlurryAds;->go:Lcom/flurry/android/ICustomAdNetworkHandler;

    const/4 v2, 0x4

    if-ne v9, v2, :cond_5

    if-eqz v1, :cond_5

    invoke-interface {v1, p1, v0, v10}, Lcom/flurry/android/ICustomAdNetworkHandler;->getAdFromNetwork(Landroid/content/Context;Lcom/flurry/android/AdCreative;Ljava/lang/String;)Lcom/flurry/android/AdNetworkView;

    move-result-object v0

    if-eqz v0, :cond_5

    iput-object p0, v0, Lcom/flurry/android/l;->L:Lcom/flurry/android/FlurryAds;

    iput-object v5, v0, Lcom/flurry/android/l;->M:Lcom/flurry/android/ck;

    iput v6, v0, Lcom/flurry/android/l;->O:I

    iput-object p2, v0, Lcom/flurry/android/l;->N:Lcom/flurry/android/AdUnit;

    new-instance v1, Lcom/flurry/android/ec;

    invoke-direct {v1, v0, p2}, Lcom/flurry/android/ec;-><init>(Lcom/flurry/android/l;Lcom/flurry/android/AdUnit;)V

    iput-object v1, p0, Lcom/flurry/android/FlurryAds;->gA:Lcom/flurry/android/ep;

    goto :goto_1

    :cond_5
    const-string v0, "takeover"

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    iput-object v5, p0, Lcom/flurry/android/FlurryAds;->gg:Lcom/flurry/android/ck;

    iput-object p2, p0, Lcom/flurry/android/FlurryAds;->gh:Lcom/flurry/android/AdUnit;

    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gq:Lcom/flurry/android/au;

    invoke-interface {v0, p1, p0, v5, p2}, Lcom/flurry/android/au;->a(Landroid/content/Context;Lcom/flurry/android/FlurryAds;Lcom/flurry/android/ck;Lcom/flurry/android/AdUnit;)Lcom/flurry/android/ab;

    move-result-object v0

    if-eqz v0, :cond_2

    new-instance v1, Lcom/flurry/android/bl;

    invoke-direct {v1, v0, p2}, Lcom/flurry/android/bl;-><init>(Lcom/flurry/android/ab;Lcom/flurry/android/AdUnit;)V

    iput-object v1, p0, Lcom/flurry/android/FlurryAds;->gA:Lcom/flurry/android/ep;

    goto :goto_1

    :cond_6
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gp:Lcom/flurry/android/j;

    invoke-interface {v0, p1, p0, v5, p2}, Lcom/flurry/android/j;->b(Landroid/content/Context;Lcom/flurry/android/FlurryAds;Lcom/flurry/android/ck;Lcom/flurry/android/AdUnit;)Lcom/flurry/android/l;

    move-result-object v0

    if-eqz v0, :cond_2

    new-instance v1, Lcom/flurry/android/ec;

    invoke-direct {v1, v0, p2}, Lcom/flurry/android/ec;-><init>(Lcom/flurry/android/l;Lcom/flurry/android/AdUnit;)V

    iput-object v1, p0, Lcom/flurry/android/FlurryAds;->gA:Lcom/flurry/android/ep;

    goto :goto_1
.end method

.method private declared-synchronized a(Ljava/lang/String;ZLjava/util/Map;)Lcom/flurry/android/fc;
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
            "Lcom/flurry/android/fc;"
        }
    .end annotation

    .prologue
    .line 2385
    monitor-enter p0

    :try_start_0
    new-instance v0, Lcom/flurry/android/fc;

    invoke-virtual {p0}, Lcom/flurry/android/FlurryAds;->aA()J

    move-result-wide v3

    move-object v1, p1

    move v2, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/flurry/android/fc;-><init>(Ljava/lang/String;ZJLjava/util/Map;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private static a([BLjava/lang/Class;)Lcom/flurry/org/apache/avro/specific/SpecificRecordBase;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A:",
            "Lcom/flurry/org/apache/avro/specific/SpecificRecordBase;",
            ">([B",
            "Ljava/lang/Class",
            "<TA;>;)TA;"
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 2072
    sget-object v0, Lcom/flurry/android/FlurryAds;->fT:Lcom/flurry/org/apache/avro/io/DecoderFactory;

    new-instance v2, Ljava/io/ByteArrayInputStream;

    invoke-direct {v2, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-virtual {v0, v2, v1}, Lcom/flurry/org/apache/avro/io/DecoderFactory;->binaryDecoder(Ljava/io/InputStream;Lcom/flurry/org/apache/avro/io/BinaryDecoder;)Lcom/flurry/org/apache/avro/io/BinaryDecoder;

    move-result-object v0

    .line 2075
    :try_start_0
    new-instance v2, Lcom/flurry/org/apache/avro/specific/SpecificDatumReader;

    invoke-direct {v2, p1}, Lcom/flurry/org/apache/avro/specific/SpecificDatumReader;-><init>(Ljava/lang/Class;)V

    .line 2076
    const/4 v3, 0x0

    invoke-virtual {v2, v3, v0}, Lcom/flurry/org/apache/avro/specific/SpecificDatumReader;->read(Ljava/lang/Object;Lcom/flurry/org/apache/avro/io/Decoder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/org/apache/avro/specific/SpecificRecordBase;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 2088
    :goto_0
    return-object v0

    .line 2078
    :catch_0
    move-exception v0

    .line 2080
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ClassCastException in parseAvroBinary:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/ClassCastException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2081
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ClassCastException in parseAvroBinary: bytes = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " type = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-object v0, v1

    .line 2082
    goto :goto_0

    .line 2084
    :catch_1
    move-exception v0

    .line 2086
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "IOException in parseAvroBinary:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2087
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "IOException in parseAvroBinary: bytes = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " type = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-object v0, v1

    .line 2088
    goto :goto_0
.end method

.method static synthetic a(Lcom/flurry/android/FlurryAds;)Ljava/io/File;
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->fY:Ljava/io/File;

    return-object v0
.end method

.method private a(Lcom/flurry/android/ck;Lcom/flurry/android/AdUnit;Lcom/flurry/android/v;Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .prologue
    .line 1686
    const-string v0, ".*?(%\\{\\w+\\}).*?"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    .line 1687
    invoke-virtual {v1, p4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 1688
    :goto_0
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1689
    iget-object v2, p0, Lcom/flurry/android/FlurryAds;->fV:Lcom/flurry/android/dl;

    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, p1, p2, p4, v0}, Lcom/flurry/android/dl;->a(Lcom/flurry/android/ck;Lcom/flurry/android/AdUnit;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    .line 1690
    invoke-virtual {v1, p4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    goto :goto_0

    .line 1693
    :cond_0
    return-object p4
.end method

.method private static a(Lcom/flurry/android/AdFrame;Lcom/flurry/android/fs;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/android/AdFrame;",
            "Lcom/flurry/android/fs;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/flurry/android/v;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2410
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 2411
    invoke-virtual {p0}, Lcom/flurry/android/AdFrame;->getCallbacks()Ljava/util/List;

    move-result-object v0

    .line 2412
    iget-object v3, p1, Lcom/flurry/android/fs;->hQ:Ljava/lang/String;

    .line 2415
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/Callback;

    .line 2417
    invoke-virtual {v0}, Lcom/flurry/android/Callback;->getEvent()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 2418
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2421
    invoke-virtual {v0}, Lcom/flurry/android/Callback;->getActions()Ljava/util/List;

    move-result-object v0

    .line 2422
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    .line 2424
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 2425
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2426
    const/16 v1, 0x3f

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    .line 2428
    const/4 v1, -0x1

    if-eq v7, v1, :cond_2

    .line 2430
    const/4 v1, 0x0

    invoke-virtual {v0, v1, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 2431
    add-int/lit8 v7, v7, 0x1

    invoke-virtual {v0, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 2433
    const-string v7, "%{eventParams}"

    invoke-virtual {v0, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 2435
    const-string v7, "%{eventParams}"

    const-string v8, ""

    invoke-virtual {v0, v7, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 2436
    iget-object v7, p1, Lcom/flurry/android/fs;->bh:Ljava/util/Map;

    invoke-interface {v6, v7}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 2439
    :cond_1
    invoke-static {v0}, Lcom/flurry/android/eo;->J(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v6, v0}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    move-object v0, v1

    .line 2445
    :cond_2
    new-instance v1, Lcom/flurry/android/v;

    invoke-direct {v1, v0, v6, p1}, Lcom/flurry/android/v;-><init>(Ljava/lang/String;Ljava/util/Map;Lcom/flurry/android/fs;)V

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 2450
    :cond_3
    return-object v2
.end method

.method private a(Landroid/content/Context;Ljava/lang/String;ZLcom/flurry/android/AdUnit;)V
    .locals 7

    .prologue
    .line 1490
    iget-object v6, p0, Lcom/flurry/android/FlurryAds;->gl:Landroid/os/Handler;

    new-instance v0, Lcom/flurry/android/cg;

    move-object v1, p0

    move-object v2, p2

    move-object v3, p4

    move-object v4, p1

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/flurry/android/cg;-><init>(Lcom/flurry/android/FlurryAds;Ljava/lang/String;Lcom/flurry/android/AdUnit;Landroid/content/Context;Z)V

    invoke-virtual {v6, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1536
    return-void
.end method

.method private declared-synchronized a(Lcom/flurry/android/FlurryFreqCapManager;Ljava/io/DataOutputStream;)V
    .locals 5

    .prologue
    .line 2345
    monitor-enter p0

    :try_start_0
    invoke-virtual {p1}, Lcom/flurry/android/FlurryFreqCapManager;->V()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/FlurryFreqCapInfo;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2349
    const/4 v2, 0x1

    :try_start_1
    invoke-virtual {p2, v2}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 2350
    invoke-virtual {v0, p2}, Lcom/flurry/android/FlurryFreqCapInfo;->a(Ljava/io/DataOutput;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 2352
    :catch_0
    move-exception v2

    :try_start_2
    sget-object v2, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "unable to convert freqCap to byte[]: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lcom/flurry/android/FlurryFreqCapInfo;->getIdHash()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/flurry/android/cm;->c(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 2345
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 2355
    :cond_0
    monitor-exit p0

    return-void
.end method

.method private declared-synchronized a(Lcom/flurry/android/SdkLogResponse;)V
    .locals 2

    .prologue
    .line 1705
    monitor-enter p0

    :try_start_0
    invoke-virtual {p1}, Lcom/flurry/android/SdkLogResponse;->getResult()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "success"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1707
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gt:Ljava/util/List;

    iget-object v1, p0, Lcom/flurry/android/FlurryAds;->gv:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1708
    :cond_0
    monitor-exit p0

    return-void

    .line 1705
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private a(Landroid/content/Context;Ljava/lang/String;Lcom/flurry/android/FlurryAdSize;J)Z
    .locals 9

    .prologue
    const/4 v8, 0x1

    const/4 v6, 0x0

    .line 1736
    invoke-direct {p0, p1, p2}, Lcom/flurry/android/FlurryAds;->d(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    move v6, v8

    .line 1766
    :cond_0
    :goto_0
    return v6

    .line 1740
    :cond_1
    new-instance v0, Lcom/flurry/android/bd;

    const/4 v5, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move v7, v6

    invoke-direct/range {v0 .. v7}, Lcom/flurry/android/bd;-><init>(Lcom/flurry/android/FlurryAds;Landroid/content/Context;Ljava/lang/String;Lcom/flurry/android/FlurryAdSize;Landroid/view/ViewGroup;ZZ)V

    .line 1742
    new-array v1, v6, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/flurry/android/bd;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 1745
    :try_start_0
    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, p4, p5, v1}, Lcom/flurry/android/bd;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    .line 1746
    invoke-direct {p0, p1, p2}, Lcom/flurry/android/FlurryAds;->d(Landroid/content/Context;Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_2

    move-result v0

    if-eqz v0, :cond_0

    move v6, v8

    .line 1748
    goto :goto_0

    .line 1752
    :catch_0
    move-exception v0

    .line 1753
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0

    .line 1757
    :catch_1
    move-exception v0

    .line 1758
    invoke-virtual {v0}, Ljava/util/concurrent/ExecutionException;->printStackTrace()V

    goto :goto_0

    .line 1763
    :catch_2
    move-exception v0

    goto :goto_0
.end method

.method private static a(Ljava/io/InputStream;)[B
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2050
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 2051
    const/16 v1, 0x80

    new-array v1, v1, [B

    .line 2053
    :goto_0
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    .line 2055
    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 2057
    :cond_0
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    return-object v0
.end method

.method private a(Ljava/lang/String;IIIIZLcom/flurry/android/FlurryAdSize;Landroid/content/Context;)[B
    .locals 7

    .prologue
    .line 1887
    invoke-direct {p0}, Lcom/flurry/android/FlurryAds;->aF()Ljava/util/List;

    move-result-object v1

    .line 1888
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gn:Lcom/flurry/android/FlurryFreqCapManager;

    invoke-virtual {v0}, Lcom/flurry/android/FlurryFreqCapManager;->V()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/FlurryFreqCapInfo;

    invoke-static {}, Lcom/flurry/android/FrequencyCapInfo;->bc()Lcom/flurry/android/FrequencyCapInfo$Builder;

    move-result-object v4

    invoke-virtual {v0}, Lcom/flurry/android/FlurryFreqCapInfo;->getIdHash()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/flurry/android/FrequencyCapInfo$Builder;->setIdHash(Ljava/lang/CharSequence;)Lcom/flurry/android/FrequencyCapInfo$Builder;

    move-result-object v4

    invoke-virtual {v0}, Lcom/flurry/android/FlurryFreqCapInfo;->getExpirationTime()J

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Lcom/flurry/android/FrequencyCapInfo$Builder;->setExpirationTime(J)Lcom/flurry/android/FrequencyCapInfo$Builder;

    move-result-object v4

    invoke-virtual {v0}, Lcom/flurry/android/FlurryFreqCapInfo;->getNewCap()I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/flurry/android/FrequencyCapInfo$Builder;->setNewCap(I)Lcom/flurry/android/FrequencyCapInfo$Builder;

    move-result-object v4

    invoke-virtual {v0}, Lcom/flurry/android/FlurryFreqCapInfo;->getPreviousCap()I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/flurry/android/FrequencyCapInfo$Builder;->setPreviousCap(I)Lcom/flurry/android/FrequencyCapInfo$Builder;

    move-result-object v4

    invoke-virtual {v0}, Lcom/flurry/android/FlurryFreqCapInfo;->getPreviousCapType()I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/flurry/android/FrequencyCapInfo$Builder;->setPreviousCapType(I)Lcom/flurry/android/FrequencyCapInfo$Builder;

    move-result-object v4

    invoke-virtual {v0}, Lcom/flurry/android/FlurryFreqCapInfo;->getServeTime()J

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Lcom/flurry/android/FrequencyCapInfo$Builder;->setServeTime(J)Lcom/flurry/android/FrequencyCapInfo$Builder;

    move-result-object v4

    invoke-virtual {v0}, Lcom/flurry/android/FlurryFreqCapInfo;->getViews()I

    move-result v0

    invoke-virtual {v4, v0}, Lcom/flurry/android/FrequencyCapInfo$Builder;->setViews(I)Lcom/flurry/android/FrequencyCapInfo$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/FrequencyCapInfo$Builder;->build()Lcom/flurry/android/FrequencyCapInfo;

    move-result-object v0

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1891
    :cond_0
    invoke-static {}, Lcom/flurry/android/AdRequest;->aN()Lcom/flurry/android/AdRequest$Builder;

    move-result-object v0

    invoke-static {}, Lcom/flurry/android/FlurryAgent;->v()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/flurry/android/AdRequest$Builder;->setApiKey(Ljava/lang/CharSequence;)Lcom/flurry/android/AdRequest$Builder;

    move-result-object v0

    const-string v3, ""

    invoke-virtual {v0, v3}, Lcom/flurry/android/AdRequest$Builder;->setAdSpaceName(Ljava/lang/CharSequence;)Lcom/flurry/android/AdRequest$Builder;

    move-result-object v0

    sget-object v3, Lcom/flurry/android/FlurryAds;->fS:Ljava/util/List;

    invoke-virtual {v0, v3}, Lcom/flurry/android/AdRequest$Builder;->setBindings(Ljava/util/List;)Lcom/flurry/android/AdRequest$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/flurry/android/AdRequest$Builder;->setAdReportedIds(Ljava/util/List;)Lcom/flurry/android/AdRequest$Builder;

    move-result-object v3

    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->ge:Lcom/flurry/android/Location;

    if-eqz v0, :cond_3

    :goto_1
    invoke-virtual {v3, v0}, Lcom/flurry/android/AdRequest$Builder;->setLocation(Lcom/flurry/android/Location;)Lcom/flurry/android/AdRequest$Builder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/flurry/android/FlurryAds;->gx:Z

    invoke-virtual {v0, v1}, Lcom/flurry/android/AdRequest$Builder;->setTestDevice(Z)Lcom/flurry/android/AdRequest$Builder;

    move-result-object v0

    invoke-static {}, Lcom/flurry/android/FlurryAgent;->getAgentVersion()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/AdRequest$Builder;->setAgentVersion(Ljava/lang/CharSequence;)Lcom/flurry/android/AdRequest$Builder;

    move-result-object v0

    iget-wide v3, p0, Lcom/flurry/android/FlurryAds;->aL:J

    invoke-virtual {v0, v3, v4}, Lcom/flurry/android/AdRequest$Builder;->setSessionId(J)Lcom/flurry/android/AdRequest$Builder;

    move-result-object v0

    invoke-static {}, Lcom/flurry/android/AdViewContainer;->y()Lcom/flurry/android/AdViewContainer$Builder;

    move-result-object v1

    invoke-virtual {v1, p5}, Lcom/flurry/android/AdViewContainer$Builder;->setScreenHeight(I)Lcom/flurry/android/AdViewContainer$Builder;

    move-result-object v1

    invoke-virtual {v1, p4}, Lcom/flurry/android/AdViewContainer$Builder;->setScreenWidth(I)Lcom/flurry/android/AdViewContainer$Builder;

    move-result-object v1

    invoke-virtual {v1, p3}, Lcom/flurry/android/AdViewContainer$Builder;->setViewHeight(I)Lcom/flurry/android/AdViewContainer$Builder;

    move-result-object v1

    invoke-virtual {v1, p2}, Lcom/flurry/android/AdViewContainer$Builder;->setViewWidth(I)Lcom/flurry/android/AdViewContainer$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/flurry/android/AdViewContainer$Builder;->build()Lcom/flurry/android/AdViewContainer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/AdRequest$Builder;->setAdViewContainer(Lcom/flurry/android/AdViewContainer;)Lcom/flurry/android/AdRequest$Builder;

    move-result-object v0

    invoke-static {}, Lcom/flurry/android/FlurryAgent;->getLocale()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/AdRequest$Builder;->setLocale(Ljava/lang/CharSequence;)Lcom/flurry/android/AdRequest$Builder;

    move-result-object v0

    invoke-static {}, Lcom/flurry/android/FlurryAgent;->w()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/AdRequest$Builder;->setTimezone(Ljava/lang/CharSequence;)Lcom/flurry/android/AdRequest$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/android/FlurryAds;->aC:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/flurry/android/AdRequest$Builder;->setOsVersion(Ljava/lang/CharSequence;)Lcom/flurry/android/AdRequest$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/android/FlurryAds;->ga:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/flurry/android/AdRequest$Builder;->setDevicePlatform(Ljava/lang/CharSequence;)Lcom/flurry/android/AdRequest$Builder;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/flurry/android/AdRequest$Builder;->setCanDoSKAppStore(Z)Lcom/flurry/android/AdRequest$Builder;

    move-result-object v1

    const-string v0, "android.permission.ACCESS_NETWORK_STATE"

    invoke-virtual {p8, v0}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_6

    const-string v0, "connectivity"

    invoke-virtual {p8, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v3

    if-eqz v3, :cond_5

    invoke-virtual {v3}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v3

    if-eqz v3, :cond_5

    sget-object v0, Lcom/flurry/android/fq;->hK:Lcom/flurry/android/fq;

    :goto_2
    invoke-virtual {v0}, Lcom/flurry/android/fq;->getValue()I

    move-result v0

    invoke-virtual {v1, v0}, Lcom/flurry/android/AdRequest$Builder;->setNetworkStatus(I)Lcom/flurry/android/AdRequest$Builder;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/flurry/android/AdRequest$Builder;->setFrequencyCapInfos(Ljava/util/List;)Lcom/flurry/android/AdRequest$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/AdRequest$Builder;->build()Lcom/flurry/android/AdRequest;

    move-result-object v0

    .line 1916
    if-eqz p6, :cond_7

    .line 1918
    invoke-static {p6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/AdRequest;->a(Ljava/lang/Boolean;)V

    .line 1925
    :goto_3
    if-eqz p7, :cond_1

    .line 1927
    invoke-static {}, Lcom/flurry/android/TestAds;->be()Lcom/flurry/android/TestAds$Builder;

    move-result-object v1

    invoke-virtual {p7}, Lcom/flurry/android/FlurryAdSize;->getValue()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/flurry/android/TestAds$Builder;->setAdspacePlacement(I)Lcom/flurry/android/TestAds$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/flurry/android/TestAds$Builder;->build()Lcom/flurry/android/TestAds;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/AdRequest;->a(Lcom/flurry/android/TestAds;)V

    .line 1930
    :cond_1
    iget-object v1, p0, Lcom/flurry/android/FlurryAds;->gy:Ljava/util/Map;

    if-eqz v1, :cond_2

    .line 1932
    invoke-direct {p0}, Lcom/flurry/android/FlurryAds;->aB()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/AdRequest;->c(Ljava/util/Map;)V

    .line 1935
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Got ad request: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1938
    new-instance v1, Lcom/flurry/org/apache/avro/specific/SpecificDatumWriter;

    const-class v2, Lcom/flurry/android/AdRequest;

    invoke-direct {v1, v2}, Lcom/flurry/org/apache/avro/specific/SpecificDatumWriter;-><init>(Ljava/lang/Class;)V

    .line 1939
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 1940
    invoke-static {}, Lcom/flurry/org/apache/avro/io/EncoderFactory;->get()Lcom/flurry/org/apache/avro/io/EncoderFactory;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v2, v4}, Lcom/flurry/org/apache/avro/io/EncoderFactory;->directBinaryEncoder(Ljava/io/OutputStream;Lcom/flurry/org/apache/avro/io/BinaryEncoder;)Lcom/flurry/org/apache/avro/io/BinaryEncoder;

    move-result-object v3

    .line 1943
    :try_start_0
    invoke-virtual {v1, v0, v3}, Lcom/flurry/org/apache/avro/specific/SpecificDatumWriter;->write(Ljava/lang/Object;Lcom/flurry/org/apache/avro/io/Encoder;)V

    .line 1944
    invoke-virtual {v3}, Lcom/flurry/org/apache/avro/io/BinaryEncoder;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1950
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    .line 1951
    :goto_4
    return-object v0

    .line 1891
    :cond_3
    const/4 v1, 0x0

    const/4 v0, 0x0

    invoke-static {}, Lcom/flurry/android/FlurryAgent;->getLocation()Landroid/location/Location;

    move-result-object v4

    if-eqz v4, :cond_4

    invoke-virtual {v4}, Landroid/location/Location;->getLatitude()D

    move-result-wide v0

    double-to-float v1, v0

    invoke-virtual {v4}, Landroid/location/Location;->getLongitude()D

    move-result-wide v4

    double-to-float v0, v4

    :cond_4
    invoke-static {}, Lcom/flurry/android/Location;->bg()Lcom/flurry/android/Location$Builder;

    move-result-object v4

    invoke-virtual {v4, v1}, Lcom/flurry/android/Location$Builder;->setLat(F)Lcom/flurry/android/Location$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/flurry/android/Location$Builder;->setLon(F)Lcom/flurry/android/Location$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/Location$Builder;->build()Lcom/flurry/android/Location;

    move-result-object v0

    goto/16 :goto_1

    :cond_5
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v0

    if-eqz v0, :cond_6

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_6

    sget-object v0, Lcom/flurry/android/fq;->hL:Lcom/flurry/android/fq;

    goto/16 :goto_2

    :cond_6
    sget-object v0, Lcom/flurry/android/fq;->hJ:Lcom/flurry/android/fq;

    goto/16 :goto_2

    .line 1922
    :cond_7
    invoke-virtual {v0, p1}, Lcom/flurry/android/AdRequest;->c(Ljava/lang/CharSequence;)V

    goto/16 :goto_3

    .line 1945
    :catch_0
    move-exception v0

    .line 1946
    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    .line 1947
    const/4 v0, 0x0

    new-array v0, v0, [B

    goto :goto_4
.end method

.method private aB()Ljava/util/Map;
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
    .line 978
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 979
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gy:Ljava/util/Map;

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

    .line 981
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 982
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 983
    if-nez v1, :cond_0

    .line 984
    const-string v1, ""

    .line 985
    :cond_0
    if-nez v0, :cond_1

    .line 986
    const-string v0, ""

    .line 987
    :cond_1
    invoke-interface {v2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 989
    :cond_2
    return-object v2
.end method

.method private declared-synchronized aD()V
    .locals 2

    .prologue
    .line 1779
    monitor-enter p0

    :try_start_0
    new-instance v0, Lcom/flurry/android/cc;

    invoke-direct {v0, p0}, Lcom/flurry/android/cc;-><init>(Lcom/flurry/android/FlurryAds;)V

    .line 1788
    iget-object v1, p0, Lcom/flurry/android/FlurryAds;->gl:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1789
    monitor-exit p0

    return-void

    .line 1779
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private aE()[B
    .locals 5

    .prologue
    const/4 v0, 0x0

    .line 1805
    invoke-direct {p0}, Lcom/flurry/android/FlurryAds;->aF()Ljava/util/List;

    move-result-object v1

    .line 1808
    iget-object v2, p0, Lcom/flurry/android/FlurryAds;->gt:Ljava/util/List;

    monitor-enter v2

    .line 1810
    :try_start_0
    sget-object v3, Lcom/flurry/android/FlurryAds;->fU:Lcom/flurry/android/dq;

    iget-object v4, p0, Lcom/flurry/android/FlurryAds;->gt:Ljava/util/List;

    invoke-virtual {v3, v4}, Lcom/flurry/android/dq;->f(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    .line 1811
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    if-nez v4, :cond_0

    .line 1813
    monitor-exit v2

    .line 1843
    :goto_0
    return-object v0

    .line 1816
    :cond_0
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1819
    invoke-static {}, Lcom/flurry/android/SdkLogRequest;->Q()Lcom/flurry/android/SdkLogRequest$Builder;

    move-result-object v2

    invoke-static {}, Lcom/flurry/android/FlurryAgent;->v()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/flurry/android/SdkLogRequest$Builder;->setApiKey(Ljava/lang/CharSequence;)Lcom/flurry/android/SdkLogRequest$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/flurry/android/SdkLogRequest$Builder;->setAdReportedIds(Ljava/util/List;)Lcom/flurry/android/SdkLogRequest$Builder;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/flurry/android/SdkLogRequest$Builder;->setSdkAdLogs(Ljava/util/List;)Lcom/flurry/android/SdkLogRequest$Builder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/flurry/android/SdkLogRequest$Builder;->setTestDevice(Z)Lcom/flurry/android/SdkLogRequest$Builder;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/flurry/android/SdkLogRequest$Builder;->setAgentTimestamp(J)Lcom/flurry/android/SdkLogRequest$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/flurry/android/SdkLogRequest$Builder;->build()Lcom/flurry/android/SdkLogRequest;

    move-result-object v1

    .line 1827
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Got ad log request:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Lcom/flurry/android/SdkLogRequest;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1830
    new-instance v2, Lcom/flurry/org/apache/avro/specific/SpecificDatumWriter;

    const-class v3, Lcom/flurry/android/SdkLogRequest;

    invoke-direct {v2, v3}, Lcom/flurry/org/apache/avro/specific/SpecificDatumWriter;-><init>(Ljava/lang/Class;)V

    .line 1831
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 1832
    invoke-static {}, Lcom/flurry/org/apache/avro/io/EncoderFactory;->get()Lcom/flurry/org/apache/avro/io/EncoderFactory;

    move-result-object v4

    invoke-virtual {v4, v3, v0}, Lcom/flurry/org/apache/avro/io/EncoderFactory;->directBinaryEncoder(Ljava/io/OutputStream;Lcom/flurry/org/apache/avro/io/BinaryEncoder;)Lcom/flurry/org/apache/avro/io/BinaryEncoder;

    move-result-object v4

    .line 1835
    :try_start_1
    invoke-virtual {v2, v1, v4}, Lcom/flurry/org/apache/avro/specific/SpecificDatumWriter;->write(Ljava/lang/Object;Lcom/flurry/org/apache/avro/io/Encoder;)V

    .line 1836
    invoke-virtual {v4}, Lcom/flurry/org/apache/avro/io/BinaryEncoder;->flush()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 1842
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    goto :goto_0

    .line 1816
    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 1837
    :catch_0
    move-exception v1

    .line 1838
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error generating adlog request"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    goto :goto_0
.end method

.method private aF()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/flurry/android/AdReportedId;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1849
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1850
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->aG:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 1851
    invoke-static {}, Lcom/flurry/android/AdReportedId;->bf()Lcom/flurry/android/AdReportedId$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/flurry/android/AdReportedId$Builder;->setId(Ljava/nio/ByteBuffer;)Lcom/flurry/android/AdReportedId$Builder;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/flurry/android/AdReportedId$Builder;->setType(I)Lcom/flurry/android/AdReportedId$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/AdReportedId$Builder;->build()Lcom/flurry/android/AdReportedId;

    move-result-object v0

    .line 1852
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1853
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->aH:Ljava/util/Map;

    .line 1854
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 1856
    invoke-static {}, Lcom/flurry/android/AdReportedId;->bf()Lcom/flurry/android/AdReportedId$Builder;

    move-result-object v4

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/nio/ByteBuffer;

    invoke-virtual {v4, v1}, Lcom/flurry/android/AdReportedId$Builder;->setId(Ljava/nio/ByteBuffer;)Lcom/flurry/android/AdReportedId$Builder;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {v1, v0}, Lcom/flurry/android/AdReportedId$Builder;->setType(I)Lcom/flurry/android/AdReportedId$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/AdReportedId$Builder;->build()Lcom/flurry/android/AdReportedId;

    move-result-object v0

    .line 1857
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1859
    :cond_0
    return-object v2
.end method

.method private declared-synchronized aH()V
    .locals 2

    .prologue
    .line 2151
    monitor-enter p0

    :try_start_0
    new-instance v0, Lcom/flurry/android/bz;

    invoke-direct {v0, p0}, Lcom/flurry/android/bz;-><init>(Lcom/flurry/android/FlurryAds;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/flurry/android/bz;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2218
    monitor-exit p0

    return-void

    .line 2151
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized aJ()V
    .locals 2

    .prologue
    .line 2255
    monitor-enter p0

    :try_start_0
    new-instance v0, Lcom/flurry/android/ca;

    invoke-direct {v0, p0}, Lcom/flurry/android/ca;-><init>(Lcom/flurry/android/FlurryAds;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/flurry/android/ca;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2323
    monitor-exit p0

    return-void

    .line 2255
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private static b([B)I
    .locals 1

    .prologue
    .line 2094
    new-instance v0, Lcom/flurry/android/CrcMessageDigest;

    invoke-direct {v0}, Lcom/flurry/android/CrcMessageDigest;-><init>()V

    .line 2095
    invoke-virtual {v0, p0}, Lcom/flurry/android/CrcMessageDigest;->update([B)V

    .line 2096
    invoke-virtual {v0}, Lcom/flurry/android/CrcMessageDigest;->getChecksum()I

    move-result v0

    return v0
.end method

.method static b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2

    .prologue
    .line 1248
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1249
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 1250
    invoke-static {p0, v0}, Lcom/flurry/android/eo;->a(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result v0

    return v0
.end method

.method static synthetic b(Lcom/flurry/android/FlurryAds;)Z
    .locals 1

    .prologue
    .line 75
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/flurry/android/FlurryAds;->fW:Z

    return v0
.end method

.method private b([BLjava/lang/String;)Z
    .locals 4

    .prologue
    .line 1957
    if-nez p2, :cond_0

    .line 1959
    const/4 v0, 0x0

    .line 1989
    :goto_0
    return v0

    .line 1963
    :cond_0
    const-string v0, "/v5/getAds.do"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1965
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gc:Ljava/lang/String;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gc:Ljava/lang/String;

    :goto_1
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1972
    :goto_2
    invoke-direct {p0, p1, v0}, Lcom/flurry/android/FlurryAds;->c([BLjava/lang/String;)[B

    move-result-object v0

    .line 1976
    if-eqz v0, :cond_1

    .line 1978
    :try_start_0
    const-string v1, "/postAdLog.do"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1980
    invoke-direct {p0, v0}, Lcom/flurry/android/FlurryAds;->c([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1989
    :cond_1
    :goto_3
    const/4 v0, 0x1

    goto :goto_0

    .line 1965
    :cond_2
    invoke-static {}, Lcom/flurry/android/FlurryAgent;->getUseHttps()Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "https://ads.flurry.com"

    goto :goto_1

    :cond_3
    const-string v0, "http://ads.flurry.com"

    goto :goto_1

    .line 1969
    :cond_4
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gd:Ljava/lang/String;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gd:Ljava/lang/String;

    :goto_4
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    :cond_5
    invoke-static {}, Lcom/flurry/android/FlurryAgent;->getUseHttps()Z

    move-result v0

    if-eqz v0, :cond_6

    const-string v0, "https://adlog.flurry.com"

    goto :goto_4

    :cond_6
    const-string v0, "http://adlog.flurry.com"

    goto :goto_4

    .line 1984
    :catch_0
    move-exception v0

    .line 1986
    sget-object v1, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "IOException: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/flurry/android/cm;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3
.end method

.method private c([B)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2102
    const-class v0, Lcom/flurry/android/SdkLogResponse;

    invoke-static {p1, v0}, Lcom/flurry/android/FlurryAds;->a([BLjava/lang/Class;)Lcom/flurry/org/apache/avro/specific/SpecificRecordBase;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/SdkLogResponse;

    .line 2103
    if-eqz v0, :cond_0

    .line 2105
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Got ad log response: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2106
    invoke-virtual {v0}, Lcom/flurry/android/SdkLogResponse;->getResult()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "success"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2109
    invoke-direct {p0, v0}, Lcom/flurry/android/FlurryAds;->a(Lcom/flurry/android/SdkLogResponse;)V

    .line 2119
    :cond_0
    return-void

    .line 2113
    :cond_1
    invoke-virtual {v0}, Lcom/flurry/android/SdkLogResponse;->getErrors()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    .line 2115
    sget-object v2, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/flurry/android/cm;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method static synthetic c(Lcom/flurry/android/FlurryAds;)Z
    .locals 1

    .prologue
    .line 75
    iget-boolean v0, p0, Lcom/flurry/android/FlurryAds;->fW:Z

    return v0
.end method

.method private c([BLjava/lang/String;)[B
    .locals 7

    .prologue
    .line 2000
    new-instance v1, Lorg/apache/http/entity/ByteArrayEntity;

    invoke-direct {v1, p1}, Lorg/apache/http/entity/ByteArrayEntity;-><init>([B)V

    .line 2001
    const-string v0, "avro/binary"

    invoke-virtual {v1, v0}, Lorg/apache/http/entity/ByteArrayEntity;->setContentType(Ljava/lang/String;)V

    .line 2002
    new-instance v0, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v0, p2}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 2003
    invoke-virtual {v0, v1}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 2004
    const-string v2, "accept"

    const-string v3, "avro/binary"

    invoke-virtual {v0, v2, v3}, Lorg/apache/http/client/methods/HttpPost;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 2005
    const-string v2, "FM-Checksum"

    invoke-static {p1}, Lcom/flurry/android/FlurryAds;->b([B)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/apache/http/client/methods/HttpPost;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 2006
    iget-object v2, p0, Lcom/flurry/android/FlurryAds;->gk:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 2007
    const-string v2, "Device-UA"

    iget-object v3, p0, Lcom/flurry/android/FlurryAds;->gk:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Lorg/apache/http/client/methods/HttpPost;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 2009
    :cond_0
    new-instance v2, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v2}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    .line 2010
    const/16 v3, 0x2710

    invoke-static {v2, v3}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 2011
    const/16 v3, 0x3a98

    invoke-static {v2, v3}, Lorg/apache/http/params/HttpConnectionParams;->setSoTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 2012
    invoke-virtual {v0}, Lorg/apache/http/client/methods/HttpPost;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v3

    const-string v4, "http.protocol.expect-continue"

    const/4 v5, 0x0

    invoke-interface {v3, v4, v5}, Lorg/apache/http/params/HttpParams;->setBooleanParameter(Ljava/lang/String;Z)Lorg/apache/http/params/HttpParams;

    .line 2014
    invoke-static {v2}, Lcom/flurry/android/by;->a(Lorg/apache/http/params/HttpParams;)Lorg/apache/http/client/HttpClient;

    move-result-object v2

    .line 2018
    :try_start_0
    invoke-interface {v2, v0}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v2

    .line 2019
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v0

    .line 2020
    const/16 v3, 0xc8

    if-ne v0, v3, :cond_2

    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v3, v3, v5

    if-eqz v3, :cond_2

    .line 2022
    sget-object v0, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v3, "Request successful"

    invoke-static {v0, v3}, Lcom/flurry/android/cm;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 2023
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0}, Lcom/flurry/android/FlurryAds;->a(Ljava/io/InputStream;)[B

    move-result-object v0

    .line 2025
    invoke-virtual {v1}, Lorg/apache/http/entity/ByteArrayEntity;->consumeContent()V

    .line 2026
    invoke-static {v0}, Lcom/flurry/android/FlurryAds;->b([B)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    .line 2027
    const-string v3, "FM-Checksum"

    invoke-interface {v2, v3}, Lorg/apache/http/HttpResponse;->containsHeader(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    const-string v3, "FM-Checksum"

    invoke-interface {v2, v3}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 2045
    :cond_1
    :goto_0
    return-object v0

    .line 2038
    :cond_2
    sget-object v1, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Request to url = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " failed with HTTP = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/flurry/android/cm;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2045
    :cond_3
    :goto_1
    const/4 v0, 0x0

    goto :goto_0

    .line 2041
    :catch_0
    move-exception v0

    .line 2043
    sget-object v1, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Request to url = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " failed with IOException = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/flurry/android/cm;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method public static clearLocation()V
    .locals 2

    .prologue
    .line 649
    invoke-static {}, Lcom/flurry/android/FlurryAds;->getInstance()Lcom/flurry/android/FlurryAds;

    move-result-object v0

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/flurry/android/FlurryAds;->ge:Lcom/flurry/android/Location;

    .line 650
    return-void
.end method

.method public static clearTargetingKeywords()V
    .locals 2

    .prologue
    .line 759
    invoke-static {}, Lcom/flurry/android/FlurryAds;->getInstance()Lcom/flurry/android/FlurryAds;

    move-result-object v0

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/flurry/android/FlurryAds;->gy:Ljava/util/Map;

    .line 760
    return-void
.end method

.method public static clearUserCookies()V
    .locals 1

    .prologue
    .line 706
    invoke-static {}, Lcom/flurry/android/FlurryAds;->getInstance()Lcom/flurry/android/FlurryAds;

    move-result-object v0

    iget-object v0, v0, Lcom/flurry/android/FlurryAds;->gf:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 707
    return-void
.end method

.method static synthetic d(Lcom/flurry/android/FlurryAds;)Ljava/io/File;
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->fZ:Ljava/io/File;

    return-object v0
.end method

.method private d(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 3034
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gj:Lcom/flurry/android/x;

    invoke-virtual {v0, p1, p2}, Lcom/flurry/android/x;->d(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static displayAd(Landroid/content/Context;Ljava/lang/String;Landroid/view/ViewGroup;)V
    .locals 9

    .prologue
    .line 528
    if-nez p0, :cond_1

    .line 530
    sget-object v0, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v1, "Context passed to displayAd was null."

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 559
    :cond_0
    :goto_0
    return-void

    .line 533
    :cond_1
    if-nez p1, :cond_2

    .line 535
    sget-object v0, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v1, "Ad space name passed to displayAd was null."

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 538
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_3

    .line 540
    sget-object v0, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v1, "Ad space name passed to displayAd was empty."

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 543
    :cond_3
    if-nez p2, :cond_4

    .line 545
    sget-object v0, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v1, "ViewGroup  passed to displayAd was null."

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 549
    :cond_4
    invoke-static {}, Lcom/flurry/android/FlurryAds;->getInstance()Lcom/flurry/android/FlurryAds;

    move-result-object v0

    invoke-direct {v0, p0}, Lcom/flurry/android/FlurryAds;->l(Landroid/content/Context;)V

    .line 553
    :try_start_0
    sget-object v7, Lcom/flurry/android/FlurryAds;->gD:Lcom/flurry/android/FlurryAds;

    invoke-direct {v7, p1}, Lcom/flurry/android/FlurryAds;->D(Ljava/lang/String;)Lcom/flurry/android/ep;

    move-result-object v8

    if-eqz v8, :cond_0

    invoke-virtual {v8}, Lcom/flurry/android/ep;->G()Lcom/flurry/android/AdUnit;

    move-result-object v0

    iget-object v1, v7, Lcom/flurry/android/FlurryAds;->gu:Ljava/util/Map;

    invoke-virtual {v0}, Lcom/flurry/android/AdUnit;->getAdFrames()Ljava/util/List;

    move-result-object v0

    const/4 v2, 0x0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/AdFrame;

    invoke-virtual {v0}, Lcom/flurry/android/AdFrame;->getAdGuid()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/flurry/android/ck;

    new-instance v0, Lcom/flurry/android/fs;

    const-string v1, "requested"

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v2

    invoke-virtual {v8}, Lcom/flurry/android/ep;->G()Lcom/flurry/android/AdUnit;

    move-result-object v4

    const/4 v6, 0x0

    move-object v3, p0

    invoke-direct/range {v0 .. v6}, Lcom/flurry/android/fs;-><init>(Ljava/lang/String;Ljava/util/Map;Landroid/content/Context;Lcom/flurry/android/AdUnit;Lcom/flurry/android/ck;I)V

    const/4 v1, 0x0

    invoke-virtual {v7, v0, v7, v1}, Lcom/flurry/android/FlurryAds;->onEvent(Lcom/flurry/android/fs;Lcom/flurry/android/ap;I)V

    iget-object v0, v7, Lcom/flurry/android/FlurryAds;->gr:Lcom/flurry/android/FlurryAdListener;

    if-eqz v0, :cond_5

    instance-of v0, v8, Lcom/flurry/android/ec;

    if-eqz v0, :cond_6

    iget-object v0, v7, Lcom/flurry/android/FlurryAds;->gr:Lcom/flurry/android/FlurryAdListener;

    invoke-virtual {p1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/flurry/android/FlurryAdType;->WEB_BANNER:Lcom/flurry/android/FlurryAdType;

    invoke-interface {v0, v1, v2}, Lcom/flurry/android/FlurryAdListener;->shouldDisplayAd(Ljava/lang/String;Lcom/flurry/android/FlurryAdType;)Z

    :cond_5
    :goto_1
    invoke-virtual {v8, p0, p2}, Lcom/flurry/android/ep;->a(Landroid/content/Context;Landroid/view/ViewGroup;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 555
    :catch_0
    move-exception v0

    .line 557
    sget-object v1, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v2, ""

    invoke-static {v1, v2, v0}, Lcom/flurry/android/cm;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 553
    :cond_6
    :try_start_1
    iget-object v0, v7, Lcom/flurry/android/FlurryAds;->gr:Lcom/flurry/android/FlurryAdListener;

    invoke-virtual {p1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/flurry/android/FlurryAdType;->WEB_TAKEOVER:Lcom/flurry/android/FlurryAdType;

    invoke-interface {v0, v1, v2}, Lcom/flurry/android/FlurryAdListener;->shouldDisplayAd(Ljava/lang/String;Lcom/flurry/android/FlurryAdType;)Z
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method static synthetic e(Lcom/flurry/android/FlurryAds;)Z
    .locals 1

    .prologue
    .line 75
    iget-boolean v0, p0, Lcom/flurry/android/FlurryAds;->fX:Z

    return v0
.end method

.method public static enableTestAds(Z)V
    .locals 1

    .prologue
    .line 1000
    invoke-static {}, Lcom/flurry/android/FlurryAds;->getInstance()Lcom/flurry/android/FlurryAds;

    move-result-object v0

    iput-boolean p0, v0, Lcom/flurry/android/FlurryAds;->gx:Z

    .line 1001
    return-void
.end method

.method public static fetchAd(Landroid/content/Context;Ljava/lang/String;Landroid/view/ViewGroup;Lcom/flurry/android/FlurryAdSize;)V
    .locals 8

    .prologue
    .line 473
    if-nez p0, :cond_1

    .line 475
    sget-object v0, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v1, "Context passed to fetchAd was null."

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 509
    :cond_0
    :goto_0
    return-void

    .line 478
    :cond_1
    if-nez p1, :cond_2

    .line 480
    sget-object v0, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v1, "Ad space name passed to fetchAd was null."

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 483
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_3

    .line 485
    sget-object v0, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v1, "Ad space name passed to fetchAd was empty."

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 488
    :cond_3
    if-nez p2, :cond_4

    .line 490
    sget-object v0, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v1, "ViewGroup passed to fetchAd was null."

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 493
    :cond_4
    if-nez p3, :cond_5

    .line 495
    sget-object v0, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v1, "FlurryAdSize passed to fetchAd was null."

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 499
    :cond_5
    invoke-static {}, Lcom/flurry/android/FlurryAds;->getInstance()Lcom/flurry/android/FlurryAds;

    move-result-object v0

    invoke-direct {v0, p0}, Lcom/flurry/android/FlurryAds;->l(Landroid/content/Context;)V

    .line 503
    :try_start_0
    sget-object v1, Lcom/flurry/android/FlurryAds;->gD:Lcom/flurry/android/FlurryAds;

    invoke-direct {v1, p0, p1}, Lcom/flurry/android/FlurryAds;->d(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-static {p0}, Lcom/flurry/android/FlurryAds;->m(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_6

    invoke-virtual {v1, p0, p1}, Lcom/flurry/android/FlurryAds;->f(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 505
    :catch_0
    move-exception v0

    .line 507
    sget-object v1, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v2, ""

    invoke-static {v1, v2, v0}, Lcom/flurry/android/cm;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 503
    :cond_6
    :try_start_1
    invoke-static {p0}, Lcom/flurry/android/FlurryAds;->m(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Lcom/flurry/android/bd;

    const/4 v6, 0x1

    const/4 v7, 0x0

    move-object v2, p0

    move-object v3, p1

    move-object v4, p3

    move-object v5, p2

    invoke-direct/range {v0 .. v7}, Lcom/flurry/android/bd;-><init>(Lcom/flurry/android/FlurryAds;Landroid/content/Context;Ljava/lang/String;Lcom/flurry/android/FlurryAdSize;Landroid/view/ViewGroup;ZZ)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/flurry/android/bd;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method public static getAd(Landroid/content/Context;Ljava/lang/String;Landroid/view/ViewGroup;Lcom/flurry/android/FlurryAdSize;J)Z
    .locals 8

    .prologue
    const/4 v7, 0x0

    .line 309
    if-nez p0, :cond_0

    .line 311
    sget-object v0, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v1, "Context passed to getAd was null."

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->d(Ljava/lang/String;Ljava/lang/String;)V

    move v0, v7

    .line 343
    :goto_0
    return v0

    .line 314
    :cond_0
    if-nez p1, :cond_1

    .line 316
    sget-object v0, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v1, "Ad space name passed to getAd was null."

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->d(Ljava/lang/String;Ljava/lang/String;)V

    move v0, v7

    .line 317
    goto :goto_0

    .line 319
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_2

    .line 321
    sget-object v0, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v1, "Ad space name passed to getAd was empty."

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->d(Ljava/lang/String;Ljava/lang/String;)V

    move v0, v7

    .line 322
    goto :goto_0

    .line 324
    :cond_2
    if-nez p2, :cond_3

    .line 326
    sget-object v0, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v1, "ViewGroup passed to getAd was null."

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->d(Ljava/lang/String;Ljava/lang/String;)V

    move v0, v7

    .line 327
    goto :goto_0

    .line 329
    :cond_3
    if-nez p3, :cond_4

    .line 331
    sget-object v0, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v1, "FlurryAdSize passed to getAd was null."

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->d(Ljava/lang/String;Ljava/lang/String;)V

    move v0, v7

    .line 332
    goto :goto_0

    .line 334
    :cond_4
    invoke-static {}, Lcom/flurry/android/FlurryAds;->getInstance()Lcom/flurry/android/FlurryAds;

    move-result-object v0

    invoke-direct {v0, p0}, Lcom/flurry/android/FlurryAds;->l(Landroid/content/Context;)V

    .line 338
    :try_start_0
    sget-object v0, Lcom/flurry/android/FlurryAds;->gD:Lcom/flurry/android/FlurryAds;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p3

    move-object v4, p2

    move-wide v5, p4

    invoke-virtual/range {v0 .. v6}, Lcom/flurry/android/FlurryAds;->a(Landroid/content/Context;Ljava/lang/String;Lcom/flurry/android/FlurryAdSize;Landroid/view/ViewGroup;J)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    goto :goto_0

    .line 340
    :catch_0
    move-exception v0

    .line 342
    sget-object v1, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v2, ""

    invoke-static {v1, v2, v0}, Lcom/flurry/android/cm;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    move v0, v7

    .line 343
    goto :goto_0
.end method

.method static getInstance()Lcom/flurry/android/FlurryAds;
    .locals 1

    .prologue
    .line 250
    sget-object v0, Lcom/flurry/android/FlurryAds;->gD:Lcom/flurry/android/FlurryAds;

    if-nez v0, :cond_0

    .line 252
    new-instance v0, Lcom/flurry/android/FlurryAds;

    invoke-direct {v0}, Lcom/flurry/android/FlurryAds;-><init>()V

    sput-object v0, Lcom/flurry/android/FlurryAds;->gD:Lcom/flurry/android/FlurryAds;

    .line 254
    :cond_0
    sget-object v0, Lcom/flurry/android/FlurryAds;->gD:Lcom/flurry/android/FlurryAds;

    return-object v0
.end method

.method static h(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 5

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 1651
    move v2, v1

    .line 1653
    :goto_0
    const/4 v3, 0x5

    if-ge v2, v3, :cond_2

    .line 1656
    invoke-static {p0}, Lcom/flurry/android/FlurryAds;->n(Landroid/content/Context;)Z

    move-result v3

    if-ne v3, v0, :cond_0

    invoke-static {p0}, Lcom/flurry/android/FlurryAds;->m(Landroid/content/Context;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 1658
    const/16 v3, 0x2710

    const/16 v4, 0x3a98

    invoke-static {p1, v3, v4, v0}, Lcom/flurry/android/eo;->a(Ljava/lang/String;IIZ)Lorg/apache/http/HttpResponse;

    move-result-object v3

    .line 1659
    if-eqz v3, :cond_1

    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v3

    const/16 v4, 0xc8

    if-ne v3, v4, :cond_1

    .line 1661
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "URL hit succeeded for: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1680
    :goto_1
    return v0

    .line 1670
    :cond_0
    const-wide/16 v3, 0x64

    :try_start_0
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1678
    :cond_1
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1672
    :catch_0
    move-exception v3

    .line 1674
    invoke-virtual {v3}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    goto :goto_2

    :cond_2
    move v0, v1

    goto :goto_1
.end method

.method private i(Landroid/content/Context;Ljava/lang/String;)Lcom/flurry/android/AdUnit;
    .locals 1

    .prologue
    .line 1772
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gj:Lcom/flurry/android/x;

    invoke-virtual {v0, p1, p2}, Lcom/flurry/android/x;->c(Landroid/content/Context;Ljava/lang/String;)Lcom/flurry/android/AdUnit;

    move-result-object v0

    .line 1773
    return-object v0
.end method

.method public static initializeAds(Landroid/content/Context;)V
    .locals 4

    .prologue
    .line 366
    if-nez p0, :cond_0

    .line 368
    sget-object v0, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v1, "Context passed to initializeAds was null."

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 381
    :goto_0
    return-void

    .line 371
    :cond_0
    invoke-static {}, Lcom/flurry/android/FlurryAds;->getInstance()Lcom/flurry/android/FlurryAds;

    move-result-object v0

    invoke-direct {v0, p0}, Lcom/flurry/android/FlurryAds;->l(Landroid/content/Context;)V

    .line 375
    :try_start_0
    sget-object v1, Lcom/flurry/android/FlurryAds;->gD:Lcom/flurry/android/FlurryAds;

    sget-object v0, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v2, "Initializing ads -- requesting ads with precaching enabled on the server"

    invoke-static {v0, v2}, Lcom/flurry/android/cm;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    invoke-static {}, Lcom/flurry/android/FlurryAgent;->k()Z

    move-result v2

    if-nez v2, :cond_1

    const/16 v0, 0x1f4

    :cond_1
    iget-object v2, v1, Lcom/flurry/android/FlurryAds;->gl:Landroid/os/Handler;

    new-instance v3, Lcom/flurry/android/ce;

    invoke-direct {v3, v1, p0}, Lcom/flurry/android/ce;-><init>(Lcom/flurry/android/FlurryAds;Landroid/content/Context;)V

    int-to-long v0, v0

    invoke-virtual {v2, v3, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 377
    :catch_0
    move-exception v0

    .line 379
    sget-object v1, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v2, ""

    invoke-static {v1, v2, v0}, Lcom/flurry/android/cm;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static isAdAvailable(Landroid/content/Context;Ljava/lang/String;Lcom/flurry/android/FlurryAdSize;J)Z
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 402
    if-nez p0, :cond_0

    .line 404
    sget-object v0, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v1, "Context passed to isAdAvailable was null."

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->d(Ljava/lang/String;Ljava/lang/String;)V

    move v0, v6

    .line 432
    :goto_0
    return v0

    .line 407
    :cond_0
    if-nez p1, :cond_1

    .line 409
    sget-object v0, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v1, "Ad space name passed to isAdAvailable was null."

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->d(Ljava/lang/String;Ljava/lang/String;)V

    move v0, v6

    .line 410
    goto :goto_0

    .line 412
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_2

    .line 414
    sget-object v0, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v1, "Ad space name passed to isAdAvailable was empty."

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->d(Ljava/lang/String;Ljava/lang/String;)V

    move v0, v6

    .line 415
    goto :goto_0

    .line 417
    :cond_2
    if-nez p2, :cond_3

    .line 419
    sget-object v0, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v1, "FlurryAdSize passed to isAdAvailable was null."

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->d(Ljava/lang/String;Ljava/lang/String;)V

    move v0, v6

    .line 420
    goto :goto_0

    .line 423
    :cond_3
    invoke-static {}, Lcom/flurry/android/FlurryAds;->getInstance()Lcom/flurry/android/FlurryAds;

    move-result-object v0

    invoke-direct {v0, p0}, Lcom/flurry/android/FlurryAds;->l(Landroid/content/Context;)V

    .line 427
    :try_start_0
    sget-object v0, Lcom/flurry/android/FlurryAds;->gD:Lcom/flurry/android/FlurryAds;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-wide v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/flurry/android/FlurryAds;->a(Landroid/content/Context;Ljava/lang/String;Lcom/flurry/android/FlurryAdSize;J)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    goto :goto_0

    .line 429
    :catch_0
    move-exception v0

    .line 431
    sget-object v1, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v2, ""

    invoke-static {v1, v2, v0}, Lcom/flurry/android/cm;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    move v0, v6

    .line 432
    goto :goto_0
.end method

.method private declared-synchronized l(Landroid/content/Context;)V
    .locals 3

    .prologue
    .line 260
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/flurry/android/FlurryAds;->gE:Z

    if-nez v0, :cond_0

    .line 264
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ".flurryadlog."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lcom/flurry/android/FlurryAgent;->v()Ljava/lang/String;

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

    invoke-virtual {p1, v0}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/android/FlurryAds;->fY:Ljava/io/File;

    .line 267
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ".flurryfreqcap."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lcom/flurry/android/FlurryAgent;->v()Ljava/lang/String;

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

    invoke-virtual {p1, v0}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/android/FlurryAds;->fZ:Ljava/io/File;

    .line 270
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "market://details?id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.VIEW"

    invoke-static {p1, v0, v1}, Lcom/flurry/android/FlurryAds;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/flurry/android/FlurryAds;->gb:Z

    .line 275
    const-string v0, ""

    iput-object v0, p0, Lcom/flurry/android/FlurryAds;->gk:Ljava/lang/String;

    .line 278
    invoke-direct {p0}, Lcom/flurry/android/FlurryAds;->aH()V

    .line 279
    sget-object v0, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v1, "Attempting to load FreqCap data"

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 280
    invoke-direct {p0}, Lcom/flurry/android/FlurryAds;->aJ()V

    .line 281
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/flurry/android/FlurryAds;->gE:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 283
    :cond_0
    monitor-exit p0

    return-void

    .line 260
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method static m(Landroid/content/Context;)Z
    .locals 1

    .prologue
    .line 827
    const-string v0, "keyguard"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/KeyguardManager;

    .line 828
    invoke-virtual {v0}, Landroid/app/KeyguardManager;->inKeyguardRestrictedInputMode()Z

    move-result v0

    .line 829
    return v0
.end method

.method private static n(Landroid/content/Context;)Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 833
    const-string v0, "android.permission.ACCESS_NETWORK_STATE"

    invoke-virtual {p0, v0}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_1

    move v0, v1

    .line 848
    :cond_0
    :goto_0
    return v0

    .line 840
    :cond_1
    const-string v0, "connectivity"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 841
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 842
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v2

    if-nez v2, :cond_2

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isRoaming()Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_2
    move v0, v1

    .line 844
    :goto_1
    if-nez v0, :cond_0

    .line 845
    sget-object v1, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v2, "No connectivity found."

    invoke-static {v1, v2}, Lcom/flurry/android/cm;->g(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 842
    :cond_3
    const/4 v0, 0x0

    goto :goto_1
.end method

.method static synthetic o(Landroid/content/Context;)Z
    .locals 1

    .prologue
    .line 75
    invoke-static {p0}, Lcom/flurry/android/FlurryAds;->n(Landroid/content/Context;)Z

    move-result v0

    return v0
.end method

.method public static removeAd(Landroid/content/Context;Ljava/lang/String;Landroid/view/ViewGroup;)V
    .locals 3

    .prologue
    .line 579
    if-nez p0, :cond_0

    .line 581
    sget-object v0, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v1, "Context passed to removeAd was null."

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 608
    :goto_0
    return-void

    .line 584
    :cond_0
    if-nez p1, :cond_1

    .line 586
    sget-object v0, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v1, "Ad space name passed to removeAd was null."

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 589
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_2

    .line 591
    sget-object v0, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v1, "Ad space name passed to removeAd was empty."

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 594
    :cond_2
    if-nez p2, :cond_3

    .line 596
    sget-object v0, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v1, "ViewGroup passed to removeAd was null."

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 599
    :cond_3
    invoke-static {}, Lcom/flurry/android/FlurryAds;->getInstance()Lcom/flurry/android/FlurryAds;

    move-result-object v0

    invoke-direct {v0, p0}, Lcom/flurry/android/FlurryAds;->l(Landroid/content/Context;)V

    .line 602
    :try_start_0
    sget-object v0, Lcom/flurry/android/FlurryAds;->gD:Lcom/flurry/android/FlurryAds;

    invoke-virtual {v0, p0, p1}, Lcom/flurry/android/FlurryAds;->g(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 604
    :catch_0
    move-exception v0

    .line 606
    sget-object v1, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v2, ""

    invoke-static {v1, v2, v0}, Lcom/flurry/android/cm;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static setAdListener(Lcom/flurry/android/FlurryAdListener;)V
    .locals 1

    .prologue
    .line 624
    invoke-static {}, Lcom/flurry/android/FlurryAds;->getInstance()Lcom/flurry/android/FlurryAds;

    move-result-object v0

    iput-object p0, v0, Lcom/flurry/android/FlurryAds;->gr:Lcom/flurry/android/FlurryAdListener;

    .line 625
    return-void
.end method

.method public static setAdLogUrl(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 770
    invoke-static {}, Lcom/flurry/android/FlurryAds;->getInstance()Lcom/flurry/android/FlurryAds;

    move-result-object v0

    iput-object p0, v0, Lcom/flurry/android/FlurryAds;->gd:Ljava/lang/String;

    .line 771
    return-void
.end method

.method public static setAdServerUrl(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 765
    invoke-static {}, Lcom/flurry/android/FlurryAds;->getInstance()Lcom/flurry/android/FlurryAds;

    move-result-object v0

    iput-object p0, v0, Lcom/flurry/android/FlurryAds;->gc:Ljava/lang/String;

    .line 766
    return-void
.end method

.method public static setCustomAdNetworkHandler(Lcom/flurry/android/ICustomAdNetworkHandler;)V
    .locals 2

    .prologue
    .line 654
    if-nez p0, :cond_0

    .line 656
    sget-object v0, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v1, "ICustomAdNetworkHandler passed to setCustomAdNetworkHandler was null."

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 660
    :goto_0
    return-void

    .line 659
    :cond_0
    invoke-static {}, Lcom/flurry/android/FlurryAds;->getInstance()Lcom/flurry/android/FlurryAds;

    move-result-object v0

    iput-object p0, v0, Lcom/flurry/android/FlurryAds;->go:Lcom/flurry/android/ICustomAdNetworkHandler;

    goto :goto_0
.end method

.method public static setLocation(FF)V
    .locals 2

    .prologue
    .line 638
    invoke-static {}, Lcom/flurry/android/FlurryAds;->getInstance()Lcom/flurry/android/FlurryAds;

    move-result-object v0

    invoke-static {}, Lcom/flurry/android/Location;->bg()Lcom/flurry/android/Location$Builder;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/flurry/android/Location$Builder;->setLat(F)Lcom/flurry/android/Location$Builder;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/flurry/android/Location$Builder;->setLon(F)Lcom/flurry/android/Location$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/flurry/android/Location$Builder;->build()Lcom/flurry/android/Location;

    move-result-object v1

    iput-object v1, v0, Lcom/flurry/android/FlurryAds;->ge:Lcom/flurry/android/Location;

    .line 639
    return-void
.end method

.method public static setTargetingKeywords(Ljava/util/Map;)V
    .locals 2
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
    .line 737
    if-nez p0, :cond_1

    .line 739
    sget-object v0, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v1, "targetingKeywords Map passed to setTargetingKeywords was null."

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 746
    :cond_0
    :goto_0
    return-void

    .line 742
    :cond_1
    if-eqz p0, :cond_0

    .line 744
    invoke-static {}, Lcom/flurry/android/FlurryAds;->getInstance()Lcom/flurry/android/FlurryAds;

    move-result-object v0

    iput-object p0, v0, Lcom/flurry/android/FlurryAds;->gy:Ljava/util/Map;

    goto :goto_0
.end method

.method public static setUserCookies(Ljava/util/Map;)V
    .locals 5
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
    .line 687
    if-nez p0, :cond_1

    .line 689
    sget-object v0, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v1, "userCookies Map passed to setUserCookies was null."

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 693
    :cond_0
    return-void

    .line 692
    :cond_1
    invoke-static {}, Lcom/flurry/android/FlurryAds;->getInstance()Lcom/flurry/android/FlurryAds;

    move-result-object v1

    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result v0

    if-lez v0, :cond_0

    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

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

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_2

    iget-object v3, v1, Lcom/flurry/android/FlurryAds;->gf:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {v3, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_2
    sget-object v0, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v3, "User cookie keys and values may not be null."

    invoke-static {v0, v3}, Lcom/flurry/android/cm;->g(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method static v()Ljava/lang/String;
    .locals 1

    .prologue
    .line 876
    invoke-static {}, Lcom/flurry/android/FlurryAgent;->v()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method final A(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 808
    iget v0, p0, Lcom/flurry/android/FlurryAds;->gs:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/flurry/android/FlurryAds;->gs:I

    .line 809
    iget v0, p0, Lcom/flurry/android/FlurryAds;->gs:I

    if-nez v0, :cond_0

    .line 810
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gr:Lcom/flurry/android/FlurryAdListener;

    if-eqz v0, :cond_0

    .line 811
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gr:Lcom/flurry/android/FlurryAdListener;

    invoke-interface {v0, p1}, Lcom/flurry/android/FlurryAdListener;->onAdClosed(Ljava/lang/String;)V

    .line 814
    :cond_0
    return-void
.end method

.method final B(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 932
    iput-object p1, p0, Lcom/flurry/android/FlurryAds;->aG:Ljava/lang/String;

    .line 933
    return-void
.end method

.method final C(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 1794
    invoke-direct {p0}, Lcom/flurry/android/FlurryAds;->aE()[B

    move-result-object v0

    .line 1796
    if-eqz v0, :cond_0

    .line 1798
    invoke-direct {p0, v0, p1}, Lcom/flurry/android/FlurryAds;->b([BLjava/lang/String;)Z

    .line 1800
    :cond_0
    return-void
.end method

.method final declared-synchronized a(Lcom/flurry/android/ck;Ljava/lang/String;ZLjava/util/Map;)Lcom/flurry/android/ck;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/android/ck;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/flurry/android/ck;"
        }
    .end annotation

    .prologue
    .line 2359
    monitor-enter p0

    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "changeAdState("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2360
    monitor-enter p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 2362
    :try_start_1
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gt:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2364
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gt:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2365
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "changeAdState added adLog = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2367
    :cond_0
    invoke-direct {p0, p2, p3, p4}, Lcom/flurry/android/FlurryAds;->a(Ljava/lang/String;ZLjava/util/Map;)Lcom/flurry/android/fc;

    move-result-object v0

    .line 2368
    invoke-virtual {p1, v0}, Lcom/flurry/android/ck;->a(Lcom/flurry/android/fc;)V

    .line 2369
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2370
    monitor-exit p0

    return-object p1

    .line 2369
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

    .line 2359
    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final a(Landroid/content/Context;Ljava/lang/String;Landroid/view/ViewGroup;ZLcom/flurry/android/FlurryAdSize;)Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Landroid/view/ViewGroup;",
            "Z",
            "Lcom/flurry/android/FlurryAdSize;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/flurry/android/AdUnit;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    .line 2968
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gn:Lcom/flurry/android/FlurryFreqCapManager;

    invoke-virtual {v0}, Lcom/flurry/android/FlurryFreqCapManager;->W()V

    .line 2973
    invoke-static {p1}, Lcom/flurry/android/eo;->r(Landroid/content/Context;)I

    move-result v0

    invoke-static {p1}, Lcom/flurry/android/eo;->s(Landroid/content/Context;)I

    move-result v1

    invoke-static {p1}, Lcom/flurry/android/eo;->t(Landroid/content/Context;)I

    move-result v2

    packed-switch v2, :pswitch_data_0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v0

    move-object v1, v0

    .line 2974
    :goto_0
    iget-object v0, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 2975
    iget-object v0, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 2977
    invoke-static {p1}, Lcom/flurry/android/eo;->r(Landroid/content/Context;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {p1}, Lcom/flurry/android/eo;->s(Landroid/content/Context;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v1

    .line 2978
    iget-object v0, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 2979
    iget-object v0, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 2981
    sget-object v0, Lcom/flurry/android/FlurryAdSize;->BANNER_BOTTOM:Lcom/flurry/android/FlurryAdSize;

    invoke-virtual {p5, v0}, Lcom/flurry/android/FlurryAdSize;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/flurry/android/FlurryAdSize;->BANNER_TOP:Lcom/flurry/android/FlurryAdSize;

    invoke-virtual {p5, v0}, Lcom/flurry/android/FlurryAdSize;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2983
    :cond_0
    if-eqz p3, :cond_1

    invoke-virtual {p3}, Landroid/view/ViewGroup;->getHeight()I

    move-result v0

    if-lez v0, :cond_1

    .line 2985
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getHeight()I

    move-result v0

    invoke-static {p1, v0}, Lcom/flurry/android/eo;->a(Landroid/content/Context;I)I

    move-result v3

    .line 2987
    :cond_1
    if-eqz p3, :cond_2

    invoke-virtual {p3}, Landroid/view/ViewGroup;->getWidth()I

    move-result v0

    if-lez v0, :cond_2

    .line 2989
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getWidth()I

    move-result v0

    invoke-static {p1, v0}, Lcom/flurry/android/eo;->a(Landroid/content/Context;I)I

    move-result v2

    :cond_2
    move-object v0, p0

    move-object v1, p2

    move v6, p4

    move-object v7, p5

    move-object v8, p1

    .line 2992
    invoke-direct/range {v0 .. v8}, Lcom/flurry/android/FlurryAds;->a(Ljava/lang/String;IIIIZLcom/flurry/android/FlurryAdSize;Landroid/content/Context;)[B

    move-result-object v1

    .line 2993
    if-eqz v1, :cond_3

    array-length v0, v1

    if-ge v0, v9, :cond_4

    .line 2995
    :cond_3
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    .line 3024
    :goto_1
    return-object v0

    .line 2973
    :pswitch_0
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v0

    move-object v1, v0

    goto/16 :goto_0

    .line 2997
    :cond_4
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gc:Ljava/lang/String;

    if-eqz v0, :cond_6

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/flurry/android/FlurryAds;->gc:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "/v5/getAds.do"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_2
    invoke-direct {p0, v1, v0}, Lcom/flurry/android/FlurryAds;->c([BLjava/lang/String;)[B

    move-result-object v0

    .line 2998
    if-eqz v0, :cond_5

    array-length v1, v0

    if-ge v1, v9, :cond_8

    .line 3000
    :cond_5
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    goto :goto_1

    .line 2997
    :cond_6
    invoke-static {}, Lcom/flurry/android/FlurryAgent;->getUseHttps()Z

    move-result v0

    if-eqz v0, :cond_7

    const-string v0, "https://ads.flurry.com/v5/getAds.do"

    goto :goto_2

    :cond_7
    const-string v0, "http://ads.flurry.com/v5/getAds.do"

    goto :goto_2

    .line 3002
    :cond_8
    const-class v1, Lcom/flurry/android/AdResponse;

    invoke-static {v0, v1}, Lcom/flurry/android/FlurryAds;->a([BLjava/lang/Class;)Lcom/flurry/org/apache/avro/specific/SpecificRecordBase;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/AdResponse;

    .line 3003
    if-nez v0, :cond_9

    .line 3005
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    goto :goto_1

    .line 3008
    :cond_9
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Got ad response: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 3010
    invoke-virtual {v0}, Lcom/flurry/android/AdResponse;->getErrors()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_b

    .line 3012
    sget-object v1, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v2, "Ad server responded with the following error(s):"

    invoke-static {v1, v2}, Lcom/flurry/android/cm;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 3013
    invoke-virtual {v0}, Lcom/flurry/android/AdResponse;->getErrors()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    .line 3015
    sget-object v2, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/flurry/android/cm;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 3017
    :cond_a
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    goto/16 :goto_1

    .line 3019
    :cond_b
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_d

    invoke-virtual {v0}, Lcom/flurry/android/AdResponse;->getAdUnits()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_c

    invoke-virtual {v0}, Lcom/flurry/android/AdResponse;->getAdUnits()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_d

    .line 3021
    :cond_c
    sget-object v0, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v1, "Ad server responded but sent no ad units."

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 3022
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    goto/16 :goto_1

    .line 3024
    :cond_d
    invoke-virtual {v0}, Lcom/flurry/android/AdResponse;->getAdUnits()Ljava/util/List;

    move-result-object v0

    goto/16 :goto_1

    .line 2973
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method

.method final a(Landroid/content/Context;JJ)V
    .locals 2

    .prologue
    .line 775
    new-instance v0, Lcom/flurry/android/FlurryUserIdProvider;

    invoke-direct {v0, p1}, Lcom/flurry/android/FlurryUserIdProvider;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/flurry/android/FlurryAds;->gF:Lcom/flurry/android/FlurryUserIdProvider;

    .line 776
    iput-wide p2, p0, Lcom/flurry/android/FlurryAds;->aL:J

    .line 777
    iput-wide p4, p0, Lcom/flurry/android/FlurryAds;->aM:J

    .line 778
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/flurry/android/FlurryAds;->gi:J

    .line 779
    return-void
.end method

.method final a(Landroid/content/Context;Ljava/lang/String;Lcom/flurry/android/AdUnit;)V
    .locals 4

    .prologue
    .line 1471
    const-string v0, "market://details?id="

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1472
    invoke-virtual {p3}, Lcom/flurry/android/AdUnit;->getAdSpace()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1473
    iget-boolean v1, p0, Lcom/flurry/android/FlurryAds;->gb:Z

    if-eqz v1, :cond_1

    .line 1474
    invoke-virtual {p0, p1, p2, v0}, Lcom/flurry/android/FlurryAds;->c(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1475
    sget-object v0, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot launch Google Play url "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1485
    :cond_0
    :goto_0
    return-void

    .line 1478
    :cond_1
    const-string v1, "market://details?id="

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p2, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 1479
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "https://market.android.com/details?id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1480
    invoke-virtual {p0, p1, v1, v0}, Lcom/flurry/android/FlurryAds;->c(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    goto :goto_0

    .line 1483
    :cond_2
    sget-object v0, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unexpected Google Play url scheme: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->g(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method final a(Lcom/flurry/android/AdUnit;)V
    .locals 0

    .prologue
    .line 2400
    iput-object p1, p0, Lcom/flurry/android/FlurryAds;->gh:Lcom/flurry/android/AdUnit;

    .line 2401
    return-void
.end method

.method final declared-synchronized a(Lcom/flurry/android/ck;)V
    .locals 2

    .prologue
    .line 1005
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gt:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/16 v1, 0x7fff

    if-ge v0, v1, :cond_0

    .line 1007
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gt:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1008
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gu:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/flurry/android/ck;->ac()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1010
    :cond_0
    monitor-exit p0

    return-void

    .line 1005
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final a(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;)Z
    .locals 4

    .prologue
    const/4 v0, 0x0

    .line 1272
    .line 1274
    if-eqz p1, :cond_1

    if-eqz p2, :cond_1

    if-eqz p3, :cond_1

    invoke-static {p1, p2}, Lcom/flurry/android/eo;->a(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1277
    if-eqz p1, :cond_3

    if-eqz p2, :cond_3

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {p2, v1}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object v1

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    :goto_0
    if-eqz v1, :cond_2

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, p2}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    :goto_1
    if-eqz v1, :cond_0

    const-string v2, "adSpaceName"

    invoke-virtual {v1, v2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1279
    :cond_0
    :try_start_0
    invoke-virtual {p1, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1280
    const/4 v0, 0x1

    .line 1286
    :cond_1
    :goto_2
    return v0

    .line 1277
    :cond_2
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

    invoke-direct {v1, p1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v2, "targetIntent"

    invoke-virtual {v1, v2, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    goto :goto_1

    .line 1281
    :catch_0
    move-exception v1

    .line 1282
    sget-object v2, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v3, "Cannot launch Activity"

    invoke-static {v2, v3, v1}, Lcom/flurry/android/cm;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    :cond_3
    move v1, v0

    goto :goto_0
.end method

.method final a(Landroid/content/Context;Ljava/lang/String;Landroid/view/ViewGroup;)Z
    .locals 1

    .prologue
    .line 1157
    invoke-virtual {p0, p1, p2}, Lcom/flurry/android/FlurryAds;->f(Landroid/content/Context;Ljava/lang/String;)V

    .line 1158
    invoke-direct {p0, p2}, Lcom/flurry/android/FlurryAds;->D(Ljava/lang/String;)Lcom/flurry/android/ep;

    move-result-object v0

    .line 1159
    if-nez v0, :cond_0

    .line 1161
    const/4 v0, 0x0

    .line 1167
    :goto_0
    return v0

    .line 1166
    :cond_0
    invoke-static {p1, p2, p3}, Lcom/flurry/android/FlurryAds;->displayAd(Landroid/content/Context;Ljava/lang/String;Landroid/view/ViewGroup;)V

    .line 1167
    const/4 v0, 0x1

    goto :goto_0
.end method

.method final a(Landroid/content/Context;Ljava/lang/String;Lcom/flurry/android/FlurryAdSize;Landroid/view/ViewGroup;J)Z
    .locals 8

    .prologue
    .line 1081
    invoke-direct {p0, p1, p2}, Lcom/flurry/android/FlurryAds;->d(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 1083
    invoke-static {p1}, Lcom/flurry/android/FlurryAds;->n(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {p1}, Lcom/flurry/android/FlurryAds;->m(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 1085
    new-instance v0, Lcom/flurry/android/bd;

    const-wide/16 v1, 0x0

    cmp-long v1, p5, v1

    if-nez v1, :cond_0

    const/4 v6, 0x1

    :goto_0
    const-wide/16 v1, 0x0

    cmp-long v1, p5, v1

    if-nez v1, :cond_1

    const/4 v7, 0x1

    :goto_1
    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v7}, Lcom/flurry/android/bd;-><init>(Lcom/flurry/android/FlurryAds;Landroid/content/Context;Ljava/lang/String;Lcom/flurry/android/FlurryAdSize;Landroid/view/ViewGroup;ZZ)V

    .line 1087
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/flurry/android/bd;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 1088
    const-wide/16 v1, 0x0

    cmp-long v1, p5, v1

    if-lez v1, :cond_3

    .line 1092
    :try_start_0
    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, p5, p6, v1}, Lcom/flurry/android/bd;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    .line 1093
    invoke-direct {p0, p1, p2}, Lcom/flurry/android/FlurryAds;->d(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1095
    invoke-virtual {p0, p1, p2, p4}, Lcom/flurry/android/FlurryAds;->a(Landroid/content/Context;Ljava/lang/String;Landroid/view/ViewGroup;)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_2

    move-result v0

    .line 1128
    :goto_2
    return v0

    .line 1085
    :cond_0
    const/4 v6, 0x0

    goto :goto_0

    :cond_1
    const/4 v7, 0x0

    goto :goto_1

    .line 1098
    :catch_0
    move-exception v0

    .line 1099
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 1101
    const/4 v0, 0x0

    goto :goto_2

    .line 1102
    :catch_1
    move-exception v0

    .line 1103
    invoke-virtual {v0}, Ljava/util/concurrent/ExecutionException;->printStackTrace()V

    .line 1105
    const/4 v0, 0x0

    goto :goto_2

    .line 1107
    :catch_2
    move-exception v0

    const/4 v0, 0x0

    goto :goto_2

    .line 1112
    :cond_2
    invoke-static {p1}, Lcom/flurry/android/FlurryAds;->n(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 1114
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gr:Lcom/flurry/android/FlurryAdListener;

    if-eqz v0, :cond_3

    .line 1116
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gr:Lcom/flurry/android/FlurryAdListener;

    invoke-virtual {p2}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/flurry/android/FlurryAdListener;->spaceDidFailToReceiveAd(Ljava/lang/String;)V

    .line 1119
    :cond_3
    const/4 v0, 0x0

    goto :goto_2

    .line 1123
    :cond_4
    invoke-static {p1}, Lcom/flurry/android/FlurryAds;->m(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 1125
    invoke-virtual {p0, p1, p2, p4}, Lcom/flurry/android/FlurryAds;->a(Landroid/content/Context;Ljava/lang/String;Landroid/view/ViewGroup;)Z

    move-result v0

    goto :goto_2

    .line 1128
    :cond_5
    const/4 v0, 0x0

    goto :goto_2
.end method

.method final declared-synchronized aA()J
    .locals 4

    .prologue
    .line 914
    monitor-enter p0

    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/flurry/android/FlurryAds;->aM:J

    sub-long/2addr v0, v2

    .line 915
    iget-wide v2, p0, Lcom/flurry/android/FlurryAds;->gi:J

    cmp-long v2, v0, v2

    if-lez v2, :cond_0

    :goto_0
    iput-wide v0, p0, Lcom/flurry/android/FlurryAds;->gi:J

    .line 917
    iget-wide v0, p0, Lcom/flurry/android/FlurryAds;->gi:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-wide v0

    .line 915
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/flurry/android/FlurryAds;->gi:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/flurry/android/FlurryAds;->gi:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 914
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final aC()Ljava/util/Map;
    .locals 4
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
    .line 1456
    iget-object v1, p0, Lcom/flurry/android/FlurryAds;->gf:Ljava/util/Map;

    .line 1457
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gF:Lcom/flurry/android/FlurryUserIdProvider;

    if-eqz v0, :cond_0

    .line 1459
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gF:Lcom/flurry/android/FlurryUserIdProvider;

    iget-object v2, v0, Lcom/flurry/android/FlurryUserIdProvider;->mContext:Landroid/content/Context;

    if-nez v2, :cond_1

    const-string v0, ""

    .line 1460
    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1462
    const-string v2, "appCloudUserId"

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1465
    :cond_0
    return-object v1

    .line 1459
    :cond_1
    iget-object v0, v0, Lcom/flurry/android/FlurryUserIdProvider;->mContext:Landroid/content/Context;

    const-string v2, "FLURRY_SHARED_PREFERENCES"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v2, "flurry_last_user_id"

    const-string v3, ""

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method final declared-synchronized aG()V
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 2123
    monitor-enter p0

    .line 2126
    :try_start_0
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->fY:Ljava/io/File;

    invoke-static {v0}, Lcom/flurry/android/ai;->b(Ljava/io/File;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    move-result v0

    .line 2127
    if-nez v0, :cond_0

    .line 2144
    const/4 v0, 0x0

    :try_start_1
    invoke-static {v0}, Lcom/flurry/android/eo;->a(Ljava/io/Closeable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2145
    :goto_0
    monitor-exit p0

    return-void

    .line 2132
    :cond_0
    :try_start_2
    new-instance v1, Ljava/io/DataOutputStream;

    new-instance v0, Ljava/io/FileOutputStream;

    iget-object v3, p0, Lcom/flurry/android/FlurryAds;->fY:Ljava/io/File;

    invoke-direct {v0, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 2133
    :try_start_3
    iget-object v2, p0, Lcom/flurry/android/FlurryAds;->gt:Ljava/util/List;

    monitor-enter v2
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 2135
    :try_start_4
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gt:Ljava/util/List;

    invoke-static {v0, v1}, Lcom/flurry/android/bx;->a(Ljava/util/List;Ljava/io/DataOutput;)V

    .line 2136
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 2144
    :try_start_5
    invoke-static {v1}, Lcom/flurry/android/eo;->a(Ljava/io/Closeable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_0

    .line 2123
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 2136
    :catchall_1
    move-exception v0

    :try_start_6
    monitor-exit v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :try_start_7
    throw v0
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 2138
    :catch_0
    move-exception v0

    .line 2140
    :goto_1
    :try_start_8
    sget-object v2, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v3, "Error when saving ad log data: "

    invoke-static {v2, v3, v0}, Lcom/flurry/android/cm;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 2144
    :try_start_9
    invoke-static {v1}, Lcom/flurry/android/eo;->a(Ljava/io/Closeable;)V

    goto :goto_0

    :catchall_2
    move-exception v0

    :goto_2
    invoke-static {v2}, Lcom/flurry/android/eo;->a(Ljava/io/Closeable;)V

    throw v0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    :catchall_3
    move-exception v0

    move-object v2, v1

    goto :goto_2

    .line 2138
    :catch_1
    move-exception v0

    move-object v1, v2

    goto :goto_1
.end method

.method final declared-synchronized aI()V
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 2222
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gn:Lcom/flurry/android/FlurryFreqCapManager;

    invoke-virtual {v0}, Lcom/flurry/android/FlurryFreqCapManager;->W()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2228
    :try_start_1
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->fZ:Ljava/io/File;

    invoke-static {v0}, Lcom/flurry/android/ai;->b(Ljava/io/File;)Z
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    move-result v0

    .line 2229
    if-nez v0, :cond_0

    .line 2249
    const/4 v0, 0x0

    :try_start_2
    invoke-static {v0}, Lcom/flurry/android/eo;->a(Ljava/io/Closeable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 2250
    :goto_0
    monitor-exit p0

    return-void

    .line 2234
    :cond_0
    :try_start_3
    new-instance v0, Ljava/io/FileOutputStream;

    iget-object v1, p0, Lcom/flurry/android/FlurryAds;->fZ:Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 2235
    new-instance v1, Ljava/io/DataOutputStream;

    invoke-direct {v1, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 2237
    :try_start_4
    iget-object v2, p0, Lcom/flurry/android/FlurryAds;->gn:Lcom/flurry/android/FlurryFreqCapManager;

    monitor-enter v2
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 2239
    :try_start_5
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gn:Lcom/flurry/android/FlurryFreqCapManager;

    invoke-direct {p0, v0, v1}, Lcom/flurry/android/FlurryAds;->a(Lcom/flurry/android/FlurryFreqCapManager;Ljava/io/DataOutputStream;)V

    .line 2240
    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 2241
    const/4 v0, 0x0

    :try_start_6
    invoke-virtual {v1, v0}, Ljava/io/DataOutputStream;->writeShort(I)V
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 2249
    :try_start_7
    invoke-static {v1}, Lcom/flurry/android/eo;->a(Ljava/io/Closeable;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_0

    .line 2222
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 2240
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

    .line 2243
    :catch_0
    move-exception v0

    .line 2245
    :goto_1
    :try_start_a
    sget-object v2, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v3, ""

    invoke-static {v2, v3, v0}, Lcom/flurry/android/cm;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    .line 2249
    :try_start_b
    invoke-static {v1}, Lcom/flurry/android/eo;->a(Ljava/io/Closeable;)V

    goto :goto_0

    :catchall_2
    move-exception v0

    move-object v1, v2

    :goto_2
    invoke-static {v1}, Lcom/flurry/android/eo;->a(Ljava/io/Closeable;)V

    throw v0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    :catchall_3
    move-exception v0

    goto :goto_2

    .line 2243
    :catch_1
    move-exception v0

    move-object v1, v2

    goto :goto_1
.end method

.method final aK()Lcom/flurry/android/ck;
    .locals 1

    .prologue
    .line 2395
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gg:Lcom/flurry/android/ck;

    return-object v0
.end method

.method final aL()Lcom/flurry/android/AdUnit;
    .locals 1

    .prologue
    .line 2405
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gh:Lcom/flurry/android/AdUnit;

    return-object v0
.end method

.method final aw()V
    .locals 1

    .prologue
    .line 784
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gn:Lcom/flurry/android/FlurryFreqCapManager;

    invoke-virtual {v0}, Lcom/flurry/android/FlurryFreqCapManager;->W()V

    .line 785
    return-void
.end method

.method final ax()V
    .locals 0

    .prologue
    .line 789
    invoke-direct {p0}, Lcom/flurry/android/FlurryAds;->aD()V

    .line 790
    return-void
.end method

.method final ay()Z
    .locals 1

    .prologue
    .line 817
    iget v0, p0, Lcom/flurry/android/FlurryAds;->gs:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method final az()J
    .locals 2

    .prologue
    .line 822
    iget-wide v0, p0, Lcom/flurry/android/FlurryAds;->aL:J

    return-wide v0
.end method

.method final b(Landroid/content/Context;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Lcom/flurry/android/AdUnit;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 3029
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gj:Lcom/flurry/android/x;

    invoke-virtual {v0, p1, p2}, Lcom/flurry/android/x;->a(Landroid/content/Context;Ljava/util/List;)V

    .line 3030
    return-void
.end method

.method final b(Lcom/flurry/android/ck;)V
    .locals 0

    .prologue
    .line 2390
    iput-object p1, p0, Lcom/flurry/android/FlurryAds;->gg:Lcom/flurry/android/ck;

    .line 2391
    return-void
.end method

.method final declared-synchronized b(Ljava/io/DataInputStream;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2329
    monitor-enter p0

    :goto_0
    :try_start_0
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readShort()S

    move-result v0

    .line 2330
    if-eqz v0, :cond_0

    .line 2332
    iget-object v1, p0, Lcom/flurry/android/FlurryAds;->gn:Lcom/flurry/android/FlurryFreqCapManager;

    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 2336
    :try_start_1
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gn:Lcom/flurry/android/FlurryFreqCapManager;

    new-instance v2, Lcom/flurry/android/FlurryFreqCapInfo;

    invoke-direct {v2, p1}, Lcom/flurry/android/FlurryFreqCapInfo;-><init>(Ljava/io/DataInput;)V

    invoke-virtual {v0, v2}, Lcom/flurry/android/FlurryFreqCapManager;->a(Lcom/flurry/android/FlurryFreqCapInfo;)V

    .line 2337
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 2329
    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0

    .line 2338
    :cond_0
    const/4 v0, 0x1

    :try_start_3
    iput-boolean v0, p0, Lcom/flurry/android/FlurryAds;->fX:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 2341
    monitor-exit p0

    return-void
.end method

.method final b(Ljava/lang/String;Z)V
    .locals 2

    .prologue
    .line 793
    iget v0, p0, Lcom/flurry/android/FlurryAds;->gs:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/flurry/android/FlurryAds;->gs:I

    .line 794
    const/4 v0, 0x1

    iget v1, p0, Lcom/flurry/android/FlurryAds;->gs:I

    if-ne v0, v1, :cond_0

    .line 795
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gr:Lcom/flurry/android/FlurryAdListener;

    if-eqz v0, :cond_0

    .line 796
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gr:Lcom/flurry/android/FlurryAdListener;

    invoke-interface {v0, p1}, Lcom/flurry/android/FlurryAdListener;->onAdOpened(Ljava/lang/String;)V

    .line 800
    :cond_0
    if-eqz p2, :cond_1

    .line 801
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gr:Lcom/flurry/android/FlurryAdListener;

    if-eqz v0, :cond_1

    .line 802
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gr:Lcom/flurry/android/FlurryAdListener;

    invoke-interface {v0, p1}, Lcom/flurry/android/FlurryAdListener;->onApplicationExit(Ljava/lang/String;)V

    .line 805
    :cond_1
    return-void
.end method

.method final b(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/nio/ByteBuffer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 937
    iput-object p1, p0, Lcom/flurry/android/FlurryAds;->aH:Ljava/util/Map;

    .line 938
    return-void
.end method

.method final c(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2

    .prologue
    .line 1308
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object v0

    .line 1309
    invoke-virtual {p0, p1, v0, p3}, Lcom/flurry/android/FlurryAds;->a(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method final f(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 1133
    invoke-direct {p0, p1, p2}, Lcom/flurry/android/FlurryAds;->i(Landroid/content/Context;Ljava/lang/String;)Lcom/flurry/android/AdUnit;

    move-result-object v0

    .line 1134
    if-nez v0, :cond_1

    .line 1136
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gr:Lcom/flurry/android/FlurryAdListener;

    if-eqz v0, :cond_0

    .line 1138
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gr:Lcom/flurry/android/FlurryAdListener;

    invoke-virtual {p2}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/flurry/android/FlurryAdListener;->spaceDidFailToReceiveAd(Ljava/lang/String;)V

    .line 1153
    :cond_0
    :goto_0
    return-void

    .line 1144
    :cond_1
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/flurry/android/FlurryAds;->gA:Lcom/flurry/android/ep;

    .line 1146
    invoke-direct {p0, p1, v0}, Lcom/flurry/android/FlurryAds;->a(Landroid/content/Context;Lcom/flurry/android/AdUnit;)Lcom/flurry/android/ep;

    move-result-object v0

    .line 1147
    iget-object v1, p0, Lcom/flurry/android/FlurryAds;->gm:Lcom/flurry/android/fv;

    invoke-virtual {v1, p2, v0}, Lcom/flurry/android/fv;->a(Ljava/lang/String;Lcom/flurry/android/ep;)V

    .line 1149
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gr:Lcom/flurry/android/FlurryAdListener;

    if-eqz v0, :cond_0

    .line 1151
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gr:Lcom/flurry/android/FlurryAdListener;

    invoke-virtual {p2}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/flurry/android/FlurryAdListener;->spaceDidReceiveAd(Ljava/lang/String;)V

    goto :goto_0
.end method

.method final g(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 1213
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "_removeAd(context = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", adSpaceName = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1214
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gm:Lcom/flurry/android/fv;

    invoke-virtual {v0, p2}, Lcom/flurry/android/fv;->P(Ljava/lang/String;)Lcom/flurry/android/s;

    move-result-object v0

    .line 1215
    if-nez v0, :cond_0

    .line 1217
    invoke-direct {p0, p2}, Lcom/flurry/android/FlurryAds;->E(Ljava/lang/String;)V

    .line 1231
    :goto_0
    return-void

    .line 1221
    :cond_0
    invoke-virtual {v0}, Lcom/flurry/android/s;->stop()V

    .line 1223
    invoke-virtual {v0}, Lcom/flurry/android/s;->f()Landroid/view/ViewGroup;

    move-result-object v1

    .line 1224
    if-eqz v1, :cond_1

    .line 1225
    invoke-virtual {v0}, Lcom/flurry/android/s;->removeAllViews()V

    .line 1227
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 1229
    :cond_1
    invoke-direct {p0, p2}, Lcom/flurry/android/FlurryAds;->E(Ljava/lang/String;)V

    .line 1230
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gm:Lcom/flurry/android/fv;

    invoke-virtual {v0, p2}, Lcom/flurry/android/fv;->Q(Ljava/lang/String;)V

    goto :goto_0
.end method

.method final g(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/flurry/android/ck;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 942
    iput-object p1, p0, Lcom/flurry/android/FlurryAds;->gv:Ljava/util/List;

    .line 943
    return-void
.end method

.method final getPhoneId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 957
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->aG:Ljava/lang/String;

    return-object v0
.end method

.method public onEvent(Lcom/flurry/android/fs;Lcom/flurry/android/ap;I)V
    .locals 7

    .prologue
    .line 2456
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onEvent:event="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/flurry/android/fs;->hQ:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",params="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/flurry/android/fs;->bh:Ljava/util/Map;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2458
    iget-object v0, p1, Lcom/flurry/android/fs;->N:Lcom/flurry/android/AdUnit;

    invoke-virtual {v0}, Lcom/flurry/android/AdUnit;->getAdFrames()Ljava/util/List;

    move-result-object v0

    iget v1, p1, Lcom/flurry/android/fs;->hR:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/AdFrame;

    invoke-static {v0, p1}, Lcom/flurry/android/FlurryAds;->a(Lcom/flurry/android/AdFrame;Lcom/flurry/android/fs;)Ljava/util/List;

    move-result-object v2

    .line 2461
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2462
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gB:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 2464
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v4, p1, Lcom/flurry/android/fs;->hQ:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2466
    new-instance v1, Lcom/flurry/android/v;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v4, p1, Lcom/flurry/android/fs;->bh:Ljava/util/Map;

    invoke-direct {v1, v0, v4, p1}, Lcom/flurry/android/v;-><init>(Ljava/lang/String;Ljava/util/Map;Lcom/flurry/android/fs;)V

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 2473
    :cond_1
    iget-object v0, p1, Lcom/flurry/android/fs;->hQ:Ljava/lang/String;

    const-string v1, "adWillClose"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 2475
    const/4 v1, 0x0

    .line 2476
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/v;

    .line 2478
    iget-object v4, p0, Lcom/flurry/android/FlurryAds;->gC:Ljava/util/Set;

    iget-object v0, v0, Lcom/flurry/android/v;->bg:Ljava/lang/String;

    invoke-interface {v4, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2480
    const/4 v0, 0x1

    .line 2484
    :goto_1
    if-nez v0, :cond_3

    .line 2486
    new-instance v0, Lcom/flurry/android/v;

    const-string v1, "closeAd"

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v3

    invoke-direct {v0, v1, v3, p1}, Lcom/flurry/android/v;-><init>(Ljava/lang/String;Ljava/util/Map;Lcom/flurry/android/fs;)V

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2490
    :cond_3
    iget-object v0, p1, Lcom/flurry/android/fs;->hQ:Ljava/lang/String;

    const-string v1, "renderFailed"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 2492
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gr:Lcom/flurry/android/FlurryAdListener;

    if-eqz v0, :cond_4

    .line 2494
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gr:Lcom/flurry/android/FlurryAdListener;

    iget-object v1, p1, Lcom/flurry/android/fs;->N:Lcom/flurry/android/AdUnit;

    invoke-virtual {v1}, Lcom/flurry/android/AdUnit;->getAdSpace()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/flurry/android/FlurryAdListener;->onRenderFailed(Ljava/lang/String;)V

    .line 2498
    :cond_4
    iget-object v0, p1, Lcom/flurry/android/fs;->hQ:Ljava/lang/String;

    const-string v1, "clicked"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 2500
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gr:Lcom/flurry/android/FlurryAdListener;

    if-eqz v0, :cond_5

    .line 2502
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gr:Lcom/flurry/android/FlurryAdListener;

    iget-object v1, p1, Lcom/flurry/android/fs;->N:Lcom/flurry/android/AdUnit;

    invoke-virtual {v1}, Lcom/flurry/android/AdUnit;->getAdSpace()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/flurry/android/FlurryAdListener;->onAdClicked(Ljava/lang/String;)V

    .line 2505
    :cond_5
    iget-object v0, p1, Lcom/flurry/android/fs;->hQ:Ljava/lang/String;

    const-string v1, "videoCompleted"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 2507
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gr:Lcom/flurry/android/FlurryAdListener;

    if-eqz v0, :cond_6

    .line 2509
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gr:Lcom/flurry/android/FlurryAdListener;

    iget-object v1, p1, Lcom/flurry/android/fs;->N:Lcom/flurry/android/AdUnit;

    invoke-virtual {v1}, Lcom/flurry/android/AdUnit;->getAdSpace()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/flurry/android/FlurryAdListener;->onVideoCompleted(Ljava/lang/String;)V

    .line 2514
    :cond_6
    const/4 v0, 0x0

    .line 2516
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    move-object v1, v0

    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lcom/flurry/android/v;

    .line 2518
    iget-object v0, v2, Lcom/flurry/android/v;->bg:Ljava/lang/String;

    const-string v3, "logEvent"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 2521
    iget-object v0, v2, Lcom/flurry/android/v;->bh:Ljava/util/Map;

    const-string v1, "__sendToServer"

    const-string v3, "true"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v3, v2

    .line 2524
    :goto_3
    iget-object v0, v2, Lcom/flurry/android/v;->bg:Ljava/lang/String;

    const-string v1, "loadAdComponents"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 2526
    iget-object v0, v2, Lcom/flurry/android/v;->bi:Lcom/flurry/android/fs;

    iget-object v0, v0, Lcom/flurry/android/fs;->bh:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 2527
    :goto_4
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 2528
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 2529
    iget-object v6, v2, Lcom/flurry/android/v;->bh:Ljava/util/Map;

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

    .line 2532
    :cond_7
    sget-object v0, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    invoke-virtual {v2}, Lcom/flurry/android/v;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 2533
    add-int/lit8 v0, p3, 0x1

    invoke-interface {p2, v2, p0, v0}, Lcom/flurry/android/ap;->performAction$3deb3ec3(Lcom/flurry/android/v;Lcom/flurry/android/FlurryAds;I)V

    move-object v1, v3

    goto :goto_2

    .line 2536
    :cond_8
    if-nez v1, :cond_9

    .line 2538
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 2539
    const-string v1, "__sendToServer"

    const-string v2, "false"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2540
    new-instance v1, Lcom/flurry/android/v;

    const-string v2, "logEvent"

    invoke-direct {v1, v2, v0, p1}, Lcom/flurry/android/v;-><init>(Ljava/lang/String;Ljava/util/Map;Lcom/flurry/android/fs;)V

    .line 2541
    add-int/lit8 v0, p3, 0x1

    invoke-interface {p2, v1, p0, v0}, Lcom/flurry/android/ap;->performAction$3deb3ec3(Lcom/flurry/android/v;Lcom/flurry/android/FlurryAds;I)V

    .line 2542
    sget-object v0, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    invoke-virtual {v1}, Lcom/flurry/android/v;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 2544
    :cond_9
    return-void

    :cond_a
    move-object v3, v1

    goto :goto_3

    :cond_b
    move v0, v1

    goto/16 :goto_1
.end method

.method public performAction$3deb3ec3(Lcom/flurry/android/v;Lcom/flurry/android/FlurryAds;I)V
    .locals 10

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 2549
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "performAction:action="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v3, p1, Lcom/flurry/android/v;->bg:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, ",params="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v3, p1, Lcom/flurry/android/v;->bh:Ljava/util/Map;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, ",triggering event="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v3, p1, Lcom/flurry/android/v;->bi:Lcom/flurry/android/fs;

    iget-object v3, v3, Lcom/flurry/android/fs;->hQ:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2551
    iget-object v0, p1, Lcom/flurry/android/v;->bg:Ljava/lang/String;

    .line 2552
    iget-object v3, p1, Lcom/flurry/android/v;->bi:Lcom/flurry/android/fs;

    iget-object v3, v3, Lcom/flurry/android/fs;->K:Landroid/content/Context;

    .line 2553
    iget-object v4, p1, Lcom/flurry/android/v;->bi:Lcom/flurry/android/fs;

    iget-object v5, v4, Lcom/flurry/android/fs;->M:Lcom/flurry/android/ck;

    .line 2554
    iget-object v4, p1, Lcom/flurry/android/v;->bi:Lcom/flurry/android/fs;

    iget-object v4, v4, Lcom/flurry/android/fs;->N:Lcom/flurry/android/AdUnit;

    .line 2555
    invoke-virtual {v4}, Lcom/flurry/android/AdUnit;->getAdSpace()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    .line 2557
    const/16 v7, 0xa

    if-le p3, v7, :cond_1

    .line 2559
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Maximum depth for event/action loop exceeded when performing action:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/flurry/android/v;->bh:Ljava/util/Map;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",triggered by:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/flurry/android/v;->bi:Lcom/flurry/android/fs;

    iget-object v1, v1, Lcom/flurry/android/fs;->hQ:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2777
    :cond_0
    :goto_0
    return-void

    .line 2563
    :cond_1
    const-string v7, "directOpen"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 2565
    iget-object v0, p1, Lcom/flurry/android/v;->bh:Ljava/util/Map;

    const-string v1, "url"

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 2567
    iget-object v0, p1, Lcom/flurry/android/v;->bh:Ljava/util/Map;

    const-string v1, "url"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 2568
    const-string v1, "market://"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 2570
    invoke-virtual {p0, v3, v0, v4}, Lcom/flurry/android/FlurryAds;->a(Landroid/content/Context;Ljava/lang/String;Lcom/flurry/android/AdUnit;)V

    goto :goto_0

    .line 2574
    :cond_2
    const-string v1, "true"

    iget-object v2, p1, Lcom/flurry/android/v;->bh:Ljava/util/Map;

    const-string v7, "native"

    invoke-interface {v2, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 2575
    if-eqz v1, :cond_3

    .line 2577
    invoke-direct {p0, v5, v4, p1, v0}, Lcom/flurry/android/FlurryAds;->a(Lcom/flurry/android/ck;Lcom/flurry/android/AdUnit;Lcom/flurry/android/v;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2580
    invoke-virtual {p0, v3, v0, v6}, Lcom/flurry/android/FlurryAds;->c(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    goto :goto_0

    .line 2584
    :cond_3
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

    invoke-direct {v1, v3, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 2585
    const-string v2, "url"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 2586
    invoke-static {v3, v1}, Lcom/flurry/android/eo;->a(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 2588
    invoke-virtual {p0, v3, v1, v6}, Lcom/flurry/android/FlurryAds;->a(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;)Z

    goto :goto_0

    .line 2592
    :cond_4
    sget-object v1, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v2, "Can\'t start FlurryFullscreenTakeoverActivity, was it declared in the manifest? Falling back to default browser"

    invoke-static {v1, v2}, Lcom/flurry/android/cm;->g(Ljava/lang/String;Ljava/lang/String;)V

    .line 2593
    invoke-virtual {p0, v3, v0, v6}, Lcom/flurry/android/FlurryAds;->c(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    goto :goto_0

    .line 2600
    :cond_5
    sget-object v0, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "failed to perform directOpen action: no url in "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p1, Lcom/flurry/android/v;->bi:Lcom/flurry/android/fs;

    iget-object v2, v2, Lcom/flurry/android/fs;->hQ:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 2603
    :cond_6
    const-string v7, "delete"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 2605
    iget-object v0, p1, Lcom/flurry/android/v;->bh:Ljava/util/Map;

    const-string v1, "count"

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 2607
    iget-object v0, p1, Lcom/flurry/android/v;->bh:Ljava/util/Map;

    const-string v1, "count"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 2608
    const/4 v1, -0x1

    .line 2611
    :try_start_0
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 2617
    :goto_1
    iget-object v1, p0, Lcom/flurry/android/FlurryAds;->gj:Lcom/flurry/android/x;

    invoke-virtual {v1, v3, v6, v0}, Lcom/flurry/android/x;->a(Landroid/content/Context;Ljava/lang/String;I)V

    goto/16 :goto_0

    .line 2613
    :catch_0
    move-exception v2

    .line 2615
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "caught NumberFormatException with count parameter in deleteAds:"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move v0, v1

    goto :goto_1

    .line 2619
    :cond_7
    iget-object v0, p1, Lcom/flurry/android/v;->bh:Ljava/util/Map;

    const-string v1, "groupId"

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2621
    iget-object v0, p1, Lcom/flurry/android/v;->bh:Ljava/util/Map;

    const-string v1, "groupId"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 2622
    iget-object v1, p0, Lcom/flurry/android/FlurryAds;->gj:Lcom/flurry/android/x;

    invoke-virtual {v1, v3, v6, v0}, Lcom/flurry/android/x;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2625
    :cond_8
    const-string v7, "processRedirect"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_c

    .line 2627
    iget-object v0, p1, Lcom/flurry/android/v;->bh:Ljava/util/Map;

    const-string v7, "url"

    invoke-interface {v0, v7}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2629
    iget-object v0, p1, Lcom/flurry/android/v;->bh:Ljava/util/Map;

    const-string v7, "url"

    invoke-interface {v0, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 2630
    const-string v7, "true"

    iget-object v8, p1, Lcom/flurry/android/v;->bh:Ljava/util/Map;

    const-string v9, "native"

    invoke-interface {v8, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    .line 2631
    if-eqz v7, :cond_9

    .line 2633
    invoke-direct {p0, v5, v4, p1, v0}, Lcom/flurry/android/FlurryAds;->a(Lcom/flurry/android/ck;Lcom/flurry/android/AdUnit;Lcom/flurry/android/v;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2635
    invoke-virtual {p0, v3, v0, v6}, Lcom/flurry/android/FlurryAds;->c(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    goto/16 :goto_0

    .line 2637
    :cond_9
    const-string v6, "http"

    invoke-virtual {v0, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_b

    .line 2639
    invoke-direct {p0, v5, v4, p1, v0}, Lcom/flurry/android/FlurryAds;->a(Lcom/flurry/android/ck;Lcom/flurry/android/AdUnit;Lcom/flurry/android/v;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    new-instance v0, Lcom/flurry/android/dp;

    invoke-direct {v0, p0, v3, v5}, Lcom/flurry/android/dp;-><init>(Lcom/flurry/android/FlurryAds;Landroid/content/Context;Ljava/lang/String;)V

    const-string v2, ""

    const/4 v6, 0x0

    :try_start_1
    new-array v6, v6, [Ljava/lang/Void;

    invoke-virtual {v0, v6}, Lcom/flurry/android/dp;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/AsyncTask;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_1 .. :try_end_1} :catch_2

    :goto_2
    if-eqz v0, :cond_a

    invoke-direct {p0, v3, v0, v1, v4}, Lcom/flurry/android/FlurryAds;->a(Landroid/content/Context;Ljava/lang/String;ZLcom/flurry/android/AdUnit;)V

    goto/16 :goto_0

    :catch_1
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    move-object v0, v2

    goto :goto_2

    :catch_2
    move-exception v0

    invoke-virtual {v0}, Ljava/util/concurrent/ExecutionException;->printStackTrace()V

    move-object v0, v2

    goto :goto_2

    :cond_a
    sget-object v0, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Redirect URL could not be found for: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->g(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2643
    :cond_b
    invoke-direct {p0, v3, v0, v2, v4}, Lcom/flurry/android/FlurryAds;->a(Landroid/content/Context;Ljava/lang/String;ZLcom/flurry/android/AdUnit;)V

    goto/16 :goto_0

    .line 2647
    :cond_c
    const-string v7, "verifyUrl"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_f

    .line 2649
    iget-object v0, p1, Lcom/flurry/android/v;->bh:Ljava/util/Map;

    const-string v6, "url"

    invoke-interface {v0, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2651
    iget-object v0, p1, Lcom/flurry/android/v;->bh:Ljava/util/Map;

    const-string v6, "url"

    invoke-interface {v0, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 2652
    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    invoke-virtual {v6, v0}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_d

    invoke-static {v3, v0}, Lcom/flurry/android/eo;->a(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_d

    :goto_3
    if-eqz v1, :cond_e

    const-string v1, "urlVerified"

    .line 2653
    :goto_4
    new-instance v0, Lcom/flurry/android/fs;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v2

    iget-object v6, p1, Lcom/flurry/android/v;->bi:Lcom/flurry/android/fs;

    iget v6, v6, Lcom/flurry/android/fs;->hR:I

    invoke-direct/range {v0 .. v6}, Lcom/flurry/android/fs;-><init>(Ljava/lang/String;Ljava/util/Map;Landroid/content/Context;Lcom/flurry/android/AdUnit;Lcom/flurry/android/ck;I)V

    add-int/lit8 v1, p3, 0x1

    invoke-virtual {p2, v0, p0, v1}, Lcom/flurry/android/FlurryAds;->onEvent(Lcom/flurry/android/fs;Lcom/flurry/android/ap;I)V

    goto/16 :goto_0

    :cond_d
    move v1, v2

    .line 2652
    goto :goto_3

    :cond_e
    const-string v1, "urlNotVerified"

    goto :goto_4

    .line 2657
    :cond_f
    const-string v7, "launchPackage"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_11

    .line 2659
    iget-object v0, p1, Lcom/flurry/android/v;->bh:Ljava/util/Map;

    const-string v1, "package"

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2661
    iget-object v0, p1, Lcom/flurry/android/v;->bh:Ljava/util/Map;

    const-string v1, "package"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 2662
    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    if-eqz v1, :cond_10

    invoke-static {v3, v1}, Lcom/flurry/android/eo;->a(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result v5

    if-eqz v5, :cond_10

    invoke-virtual {v4}, Lcom/flurry/android/AdUnit;->getAdSpace()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v3, v1, v0}, Lcom/flurry/android/FlurryAds;->a(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;)Z

    goto/16 :goto_0

    :cond_10
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "https://play.google.com/store/apps/details?id="

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v3, v0, v2, v4}, Lcom/flurry/android/FlurryAds;->a(Landroid/content/Context;Ljava/lang/String;ZLcom/flurry/android/AdUnit;)V

    goto/16 :goto_0

    .line 2665
    :cond_11
    const-string v7, "sendUrlAsync"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_12

    .line 2667
    iget-object v0, p1, Lcom/flurry/android/v;->bh:Ljava/util/Map;

    const-string v1, "url"

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2669
    iget-object v0, p1, Lcom/flurry/android/v;->bh:Ljava/util/Map;

    const-string v1, "url"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v5, v4, p1, v0}, Lcom/flurry/android/FlurryAds;->a(Lcom/flurry/android/ck;Lcom/flurry/android/AdUnit;Lcom/flurry/android/v;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "url after is: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    new-instance v1, Lcom/flurry/android/cf;

    invoke-direct {v1, p0, v3, v0}, Lcom/flurry/android/cf;-><init>(Lcom/flurry/android/FlurryAds;Landroid/content/Context;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gl:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto/16 :goto_0

    .line 2672
    :cond_12
    const-string v7, "sendAdLogs"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_13

    .line 2674
    invoke-direct {p0}, Lcom/flurry/android/FlurryAds;->aD()V

    goto/16 :goto_0

    .line 2676
    :cond_13
    const-string v7, "logEvent"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_15

    .line 2678
    iget-object v0, p1, Lcom/flurry/android/v;->bh:Ljava/util/Map;

    const-string v3, "__sendToServer"

    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    iget-object v0, p1, Lcom/flurry/android/v;->bh:Ljava/util/Map;

    const-string v3, "__sendToServer"

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v3, "true"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    move v0, v1

    .line 2679
    :goto_5
    iget-object v1, p1, Lcom/flurry/android/v;->bh:Ljava/util/Map;

    const-string v2, "__sendToServer"

    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2681
    iget-object v1, p1, Lcom/flurry/android/v;->bi:Lcom/flurry/android/fs;

    iget-object v1, v1, Lcom/flurry/android/fs;->M:Lcom/flurry/android/ck;

    iget-object v2, p1, Lcom/flurry/android/v;->bi:Lcom/flurry/android/fs;

    iget-object v2, v2, Lcom/flurry/android/fs;->hQ:Ljava/lang/String;

    iget-object v3, p1, Lcom/flurry/android/v;->bh:Ljava/util/Map;

    invoke-virtual {p0, v1, v2, v0, v3}, Lcom/flurry/android/FlurryAds;->a(Lcom/flurry/android/ck;Ljava/lang/String;ZLjava/util/Map;)Lcom/flurry/android/ck;

    goto/16 :goto_0

    :cond_14
    move v0, v2

    .line 2678
    goto :goto_5

    .line 2683
    :cond_15
    const-string v1, "nextFrame"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 2687
    const-string v1, "nextAdUnit"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 2689
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gm:Lcom/flurry/android/fv;

    invoke-virtual {v0, v6}, Lcom/flurry/android/fv;->P(Ljava/lang/String;)Lcom/flurry/android/s;

    move-result-object v5

    .line 2690
    if-eqz v5, :cond_17

    iget-object v0, p1, Lcom/flurry/android/v;->bh:Ljava/util/Map;

    const-string v1, "delay"

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    iget-object v0, p1, Lcom/flurry/android/v;->bi:Lcom/flurry/android/fs;

    iget v0, v0, Lcom/flurry/android/fs;->hR:I

    if-eqz v4, :cond_16

    invoke-virtual {v4}, Lcom/flurry/android/AdUnit;->getAdFrames()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_16

    invoke-virtual {v4}, Lcom/flurry/android/AdUnit;->getAdFrames()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/AdFrame;

    invoke-virtual {v0}, Lcom/flurry/android/AdFrame;->getAdSpaceLayout()Lcom/flurry/android/AdSpaceLayout;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/AdSpaceLayout;->getFormat()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "banner"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    :cond_16
    if-eqz v2, :cond_17

    .line 2692
    const-wide/16 v1, 0x1e

    .line 2695
    :try_start_2
    iget-object v0, p1, Lcom/flurry/android/v;->bh:Ljava/util/Map;

    const-string v3, "delay"

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_3

    move-result-wide v0

    .line 2701
    :goto_6
    const-wide/16 v2, 0x3e8

    mul-long/2addr v0, v2

    invoke-virtual {v5, v0, v1}, Lcom/flurry/android/s;->a(J)V

    goto/16 :goto_0

    .line 2699
    :catch_3
    move-exception v0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "caught NumberFormatException with delay parameter in nextAdUnit:"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v0, p1, Lcom/flurry/android/v;->bh:Ljava/util/Map;

    const-string v4, "delay"

    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-wide v0, v1

    goto :goto_6

    .line 2703
    :cond_17
    if-eqz v5, :cond_18

    .line 2705
    new-instance v0, Lcom/flurry/android/cb;

    invoke-direct {v0, p0, v3, v6, v5}, Lcom/flurry/android/cb;-><init>(Lcom/flurry/android/FlurryAds;Landroid/content/Context;Ljava/lang/String;Lcom/flurry/android/s;)V

    invoke-virtual {v5, v0}, Lcom/flurry/android/s;->post(Ljava/lang/Runnable;)Z

    goto/16 :goto_0

    .line 2714
    :cond_18
    iget-object v0, p1, Lcom/flurry/android/v;->bi:Lcom/flurry/android/fs;

    iget-object v0, v0, Lcom/flurry/android/fs;->hQ:Ljava/lang/String;

    const-string v1, "renderFailed"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_19

    .line 2716
    invoke-virtual {p0, v3, v6}, Lcom/flurry/android/FlurryAds;->f(Landroid/content/Context;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2720
    :cond_19
    invoke-direct {p0, v3, v6}, Lcom/flurry/android/FlurryAds;->i(Landroid/content/Context;Ljava/lang/String;)Lcom/flurry/android/AdUnit;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/android/FlurryAds;->gz:Lcom/flurry/android/AdUnit;

    .line 2721
    iget-object v0, p0, Lcom/flurry/android/FlurryAds;->gz:Lcom/flurry/android/AdUnit;

    invoke-direct {p0, v3, v0}, Lcom/flurry/android/FlurryAds;->a(Landroid/content/Context;Lcom/flurry/android/AdUnit;)Lcom/flurry/android/ep;

    goto/16 :goto_0

    .line 2724
    :cond_1a
    const-string v1, "checkCap"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1d

    .line 2726
    iget-object v0, p1, Lcom/flurry/android/v;->bh:Ljava/util/Map;

    const-string v1, "idHash"

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2729
    iget-object v0, p1, Lcom/flurry/android/v;->bh:Ljava/util/Map;

    const-string v1, "idHash"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 2732
    iget-object v1, p0, Lcom/flurry/android/FlurryAds;->gn:Lcom/flurry/android/FlurryFreqCapManager;

    invoke-virtual {v1, v0}, Lcom/flurry/android/FlurryFreqCapManager;->n(Ljava/lang/String;)Lcom/flurry/android/FlurryFreqCapInfo;

    move-result-object v2

    .line 2733
    const-string v1, "capNotExhausted"

    .line 2736
    if-eqz v2, :cond_1b

    invoke-virtual {v2}, Lcom/flurry/android/FlurryFreqCapInfo;->getExpirationTime()J

    move-result-wide v6

    invoke-static {v6, v7}, Lcom/flurry/android/FlurryFreqCapManager;->b(J)Z

    move-result v6

    if-eqz v6, :cond_1b

    .line 2737
    sget-object v2, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Discarding expired frequency cap info for idHash="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v2, v6}, Lcom/flurry/android/cm;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 2738
    iget-object v2, p0, Lcom/flurry/android/FlurryAds;->gn:Lcom/flurry/android/FlurryFreqCapManager;

    invoke-virtual {v2, v0}, Lcom/flurry/android/FlurryFreqCapManager;->o(Ljava/lang/String;)V

    .line 2739
    const/4 v2, 0x0

    .line 2742
    :cond_1b
    if-eqz v2, :cond_1c

    invoke-virtual {v2}, Lcom/flurry/android/FlurryFreqCapInfo;->getViews()I

    move-result v6

    invoke-virtual {v2}, Lcom/flurry/android/FlurryFreqCapInfo;->getNewCap()I

    move-result v2

    if-lt v6, v2, :cond_1c

    .line 2743
    sget-object v1, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Frequency cap exhausted for idHash="

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/flurry/android/cm;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 2744
    const-string v1, "capExhausted"

    .line 2747
    :cond_1c
    new-instance v0, Lcom/flurry/android/fs;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v2

    iget-object v6, p1, Lcom/flurry/android/v;->bi:Lcom/flurry/android/fs;

    iget v6, v6, Lcom/flurry/android/fs;->hR:I

    invoke-direct/range {v0 .. v6}, Lcom/flurry/android/fs;-><init>(Ljava/lang/String;Ljava/util/Map;Landroid/content/Context;Lcom/flurry/android/AdUnit;Lcom/flurry/android/ck;I)V

    add-int/lit8 v1, p3, 0x1

    invoke-virtual {p2, v0, p0, v1}, Lcom/flurry/android/FlurryAds;->onEvent(Lcom/flurry/android/fs;Lcom/flurry/android/ap;I)V

    goto/16 :goto_0

    .line 2753
    :cond_1d
    const-string v1, "updateViewCount"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 2755
    iget-object v0, p1, Lcom/flurry/android/v;->bh:Ljava/util/Map;

    const-string v1, "idHash"

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2758
    iget-object v0, p1, Lcom/flurry/android/v;->bh:Ljava/util/Map;

    const-string v1, "idHash"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 2760
    iget-object v1, p0, Lcom/flurry/android/FlurryAds;->gn:Lcom/flurry/android/FlurryFreqCapManager;

    invoke-virtual {v1, v0}, Lcom/flurry/android/FlurryFreqCapManager;->n(Ljava/lang/String;)Lcom/flurry/android/FlurryFreqCapInfo;

    move-result-object v0

    .line 2762
    if-eqz v0, :cond_0

    .line 2764
    invoke-virtual {v0}, Lcom/flurry/android/FlurryFreqCapInfo;->updateViews()V

    .line 2765
    sget-object v1, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "updateViewCount:idHash="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/flurry/android/FlurryFreqCapInfo;->getIdHash()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ",newCap="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/flurry/android/FlurryFreqCapInfo;->getNewCap()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ",prevCap="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/flurry/android/FlurryFreqCapInfo;->getPreviousCap()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ",views="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/flurry/android/FlurryFreqCapInfo;->getViews()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/flurry/android/cm;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 2766
    invoke-virtual {v0}, Lcom/flurry/android/FlurryFreqCapInfo;->getViews()I

    move-result v1

    invoke-virtual {v0}, Lcom/flurry/android/FlurryFreqCapInfo;->getNewCap()I

    move-result v2

    if-le v1, v2, :cond_0

    .line 2767
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "FlurryAdAction: !! rendering a capped object: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Lcom/flurry/android/FlurryFreqCapInfo;->getIdHash()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    goto/16 :goto_0

    .line 2775
    :cond_1e
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown action:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",triggered by:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/flurry/android/v;->bi:Lcom/flurry/android/fs;

    iget-object v1, v1, Lcom/flurry/android/fs;->hQ:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    goto/16 :goto_0
.end method
