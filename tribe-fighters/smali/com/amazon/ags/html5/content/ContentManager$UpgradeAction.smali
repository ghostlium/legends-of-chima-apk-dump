.class final enum Lcom/amazon/ags/html5/content/ContentManager$UpgradeAction;
.super Ljava/lang/Enum;
.source "ContentManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/ags/html5/content/ContentManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "UpgradeAction"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/amazon/ags/html5/content/ContentManager$UpgradeAction;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/amazon/ags/html5/content/ContentManager$UpgradeAction;

.field public static final enum DEFAULT_UPGRADE_ACTION:Lcom/amazon/ags/html5/content/ContentManager$UpgradeAction;

.field public static final enum LOCAL_UPGRADE_ACTION:Lcom/amazon/ags/html5/content/ContentManager$UpgradeAction;

.field public static final enum NO_UPGRADE:Lcom/amazon/ags/html5/content/ContentManager$UpgradeAction;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 71
    new-instance v0, Lcom/amazon/ags/html5/content/ContentManager$UpgradeAction;

    const-string v1, "NO_UPGRADE"

    invoke-direct {v0, v1, v2}, Lcom/amazon/ags/html5/content/ContentManager$UpgradeAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/html5/content/ContentManager$UpgradeAction;->NO_UPGRADE:Lcom/amazon/ags/html5/content/ContentManager$UpgradeAction;

    .line 72
    new-instance v0, Lcom/amazon/ags/html5/content/ContentManager$UpgradeAction;

    const-string v1, "LOCAL_UPGRADE_ACTION"

    invoke-direct {v0, v1, v3}, Lcom/amazon/ags/html5/content/ContentManager$UpgradeAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/html5/content/ContentManager$UpgradeAction;->LOCAL_UPGRADE_ACTION:Lcom/amazon/ags/html5/content/ContentManager$UpgradeAction;

    .line 73
    new-instance v0, Lcom/amazon/ags/html5/content/ContentManager$UpgradeAction;

    const-string v1, "DEFAULT_UPGRADE_ACTION"

    invoke-direct {v0, v1, v4}, Lcom/amazon/ags/html5/content/ContentManager$UpgradeAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/html5/content/ContentManager$UpgradeAction;->DEFAULT_UPGRADE_ACTION:Lcom/amazon/ags/html5/content/ContentManager$UpgradeAction;

    .line 70
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/amazon/ags/html5/content/ContentManager$UpgradeAction;

    sget-object v1, Lcom/amazon/ags/html5/content/ContentManager$UpgradeAction;->NO_UPGRADE:Lcom/amazon/ags/html5/content/ContentManager$UpgradeAction;

    aput-object v1, v0, v2

    sget-object v1, Lcom/amazon/ags/html5/content/ContentManager$UpgradeAction;->LOCAL_UPGRADE_ACTION:Lcom/amazon/ags/html5/content/ContentManager$UpgradeAction;

    aput-object v1, v0, v3

    sget-object v1, Lcom/amazon/ags/html5/content/ContentManager$UpgradeAction;->DEFAULT_UPGRADE_ACTION:Lcom/amazon/ags/html5/content/ContentManager$UpgradeAction;

    aput-object v1, v0, v4

    sput-object v0, Lcom/amazon/ags/html5/content/ContentManager$UpgradeAction;->$VALUES:[Lcom/amazon/ags/html5/content/ContentManager$UpgradeAction;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 70
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/amazon/ags/html5/content/ContentManager$UpgradeAction;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 70
    const-class v0, Lcom/amazon/ags/html5/content/ContentManager$UpgradeAction;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/amazon/ags/html5/content/ContentManager$UpgradeAction;

    return-object v0
.end method

.method public static values()[Lcom/amazon/ags/html5/content/ContentManager$UpgradeAction;
    .locals 1

    .prologue
    .line 70
    sget-object v0, Lcom/amazon/ags/html5/content/ContentManager$UpgradeAction;->$VALUES:[Lcom/amazon/ags/html5/content/ContentManager$UpgradeAction;

    invoke-virtual {v0}, [Lcom/amazon/ags/html5/content/ContentManager$UpgradeAction;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazon/ags/html5/content/ContentManager$UpgradeAction;

    return-object v0
.end method
