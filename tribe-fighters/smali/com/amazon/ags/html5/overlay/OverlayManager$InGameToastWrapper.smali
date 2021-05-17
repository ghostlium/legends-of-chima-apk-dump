.class Lcom/amazon/ags/html5/overlay/OverlayManager$InGameToastWrapper;
.super Ljava/lang/Object;
.source "OverlayManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/ags/html5/overlay/OverlayManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "InGameToastWrapper"
.end annotation


# instance fields
.field private aggregateCount:I

.field private final dedupeTypes:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final toast:Lcom/amazon/ags/html5/overlay/toasts/ClickableToast;

.field private final type:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/Set;Lcom/amazon/ags/html5/overlay/toasts/ClickableToast;)V
    .locals 2
    .param p1, "type"    # Ljava/lang/String;
    .param p3, "toast"    # Lcom/amazon/ags/html5/overlay/toasts/ClickableToast;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/amazon/ags/html5/overlay/toasts/ClickableToast;",
            ")V"
        }
    .end annotation

    .prologue
    .line 242
    .local p2, "dedupeTypes":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 243
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    if-nez p3, :cond_1

    .line 244
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cannot instantiate InGameToastWrapper with null arguments"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 246
    :cond_1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 247
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cannot instantiate InGameToastWrapper with empty type"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 250
    :cond_2
    iput-object p1, p0, Lcom/amazon/ags/html5/overlay/OverlayManager$InGameToastWrapper;->type:Ljava/lang/String;

    .line 251
    iput-object p2, p0, Lcom/amazon/ags/html5/overlay/OverlayManager$InGameToastWrapper;->dedupeTypes:Ljava/util/Set;

    .line 252
    iput-object p3, p0, Lcom/amazon/ags/html5/overlay/OverlayManager$InGameToastWrapper;->toast:Lcom/amazon/ags/html5/overlay/toasts/ClickableToast;

    .line 253
    const/4 v0, 0x0

    iput v0, p0, Lcom/amazon/ags/html5/overlay/OverlayManager$InGameToastWrapper;->aggregateCount:I

    .line 254
    return-void
.end method


# virtual methods
.method public aggregate(Ljava/lang/String;)V
    .locals 2
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 261
    iget v0, p0, Lcom/amazon/ags/html5/overlay/OverlayManager$InGameToastWrapper;->aggregateCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/amazon/ags/html5/overlay/OverlayManager$InGameToastWrapper;->aggregateCount:I

    .line 262
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/OverlayManager$InGameToastWrapper;->toast:Lcom/amazon/ags/html5/overlay/toasts/ClickableToast;

    iget v1, p0, Lcom/amazon/ags/html5/overlay/OverlayManager$InGameToastWrapper;->aggregateCount:I

    invoke-interface {v0, p1, v1}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToast;->update(Ljava/lang/String;I)V

    .line 263
    return-void
.end method

.method public getToast()Lcom/amazon/ags/html5/overlay/toasts/ClickableToast;
    .locals 1

    .prologue
    .line 257
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/OverlayManager$InGameToastWrapper;->toast:Lcom/amazon/ags/html5/overlay/toasts/ClickableToast;

    return-object v0
.end method

.method public isDedupeCompatibleWithType(Ljava/lang/String;)Z
    .locals 2
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 266
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 267
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "type argument must be non-empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 270
    :cond_0
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/OverlayManager$InGameToastWrapper;->dedupeTypes:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
