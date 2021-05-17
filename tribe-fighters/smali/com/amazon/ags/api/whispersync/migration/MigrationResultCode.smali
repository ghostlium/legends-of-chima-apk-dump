.class public final enum Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;
.super Ljava/lang/Enum;
.source "MigrationResultCode.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

.field public static final enum FAILURE:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

.field public static final enum NETWORK_FAILURE:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

.field public static final enum NO_DATA:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

.field public static final enum SUCCESS:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

.field public static final enum WHISPERSYNC_OFF:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 16
    new-instance v0, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    const-string v1, "SUCCESS"

    invoke-direct {v0, v1, v2}, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->SUCCESS:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    .line 21
    new-instance v0, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    const-string v1, "NO_DATA"

    invoke-direct {v0, v1, v3}, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->NO_DATA:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    .line 26
    new-instance v0, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    const-string v1, "NETWORK_FAILURE"

    invoke-direct {v0, v1, v4}, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->NETWORK_FAILURE:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    .line 31
    new-instance v0, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    const-string v1, "WHISPERSYNC_OFF"

    invoke-direct {v0, v1, v5}, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->WHISPERSYNC_OFF:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    .line 37
    new-instance v0, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    const-string v1, "FAILURE"

    invoke-direct {v0, v1, v6}, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->FAILURE:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    .line 11
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    sget-object v1, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->SUCCESS:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    aput-object v1, v0, v2

    sget-object v1, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->NO_DATA:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    aput-object v1, v0, v3

    sget-object v1, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->NETWORK_FAILURE:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    aput-object v1, v0, v4

    sget-object v1, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->WHISPERSYNC_OFF:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    aput-object v1, v0, v5

    sget-object v1, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->FAILURE:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    aput-object v1, v0, v6

    sput-object v0, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->$VALUES:[Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

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
    .line 11
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 11
    const-class v0, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    return-object v0
.end method

.method public static values()[Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;
    .locals 1

    .prologue
    .line 11
    sget-object v0, Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->$VALUES:[Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    invoke-virtual {v0}, [Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    return-object v0
.end method
