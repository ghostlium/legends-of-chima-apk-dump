.class public final enum Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;
.super Ljava/lang/Enum;
.source "AccountManagerConstants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/identity/auth/device/AccountManagerConstants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "LOCALE"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;

.field public static final enum CA:Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;

.field public static final enum CN:Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;

.field public static final enum DE:Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;

.field public static final enum ES:Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;

.field public static final enum FR:Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;

.field public static final enum JP:Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;

.field private static final LOCALE_SEPERATOR:Ljava/lang/String; = "-"

.field public static final enum UK:Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;

.field public static final enum US:Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;


# instance fields
.field private final mLocale:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 68
    new-instance v0, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;

    const-string v1, "US"

    const-string v2, "us"

    invoke-direct {v0, v1, v4, v2}, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;->US:Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;

    new-instance v0, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;

    const-string v1, "DE"

    const-string v2, "de"

    invoke-direct {v0, v1, v5, v2}, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;->DE:Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;

    new-instance v0, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;

    const-string v1, "UK"

    const-string v2, "uk"

    invoke-direct {v0, v1, v6, v2}, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;->UK:Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;

    new-instance v0, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;

    const-string v1, "JP"

    const-string v2, "jp"

    invoke-direct {v0, v1, v7, v2}, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;->JP:Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;

    new-instance v0, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;

    const-string v1, "FR"

    const-string v2, "fr"

    invoke-direct {v0, v1, v8, v2}, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;->FR:Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;

    new-instance v0, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;

    const-string v1, "CA"

    const/4 v2, 0x5

    const-string v3, "ca"

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;->CA:Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;

    new-instance v0, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;

    const-string v1, "ES"

    const/4 v2, 0x6

    const-string v3, "es"

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;->ES:Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;

    new-instance v0, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;

    const-string v1, "CN"

    const/4 v2, 0x7

    const-string v3, "cn"

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;->CN:Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;

    .line 66
    const/16 v0, 0x8

    new-array v0, v0, [Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;

    sget-object v1, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;->US:Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;

    aput-object v1, v0, v4

    sget-object v1, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;->DE:Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;

    aput-object v1, v0, v5

    sget-object v1, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;->UK:Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;

    aput-object v1, v0, v6

    sget-object v1, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;->JP:Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;

    aput-object v1, v0, v7

    sget-object v1, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;->FR:Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;->CA:Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;->ES:Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;->CN:Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;

    aput-object v2, v0, v1

    sput-object v0, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;->$VALUES:[Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p3, "locale"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 74
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 75
    iput-object p3, p0, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;->mLocale:Ljava/lang/String;

    .line 76
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 66
    const-class v0, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;

    return-object v0
.end method

.method public static values()[Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;
    .locals 1

    .prologue
    .line 66
    sget-object v0, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;->$VALUES:[Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;

    invoke-virtual {v0}, [Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;

    return-object v0
.end method


# virtual methods
.method public toUrlString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 81
    sget-object v0, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;->US:Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;

    invoke-virtual {p0, v0}, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 83
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/amazon/identity/auth/device/AccountManagerConstants$LOCALE;->mLocale:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 87
    :goto_0
    return-object v0

    :cond_0
    const-string v0, ""

    goto :goto_0
.end method
