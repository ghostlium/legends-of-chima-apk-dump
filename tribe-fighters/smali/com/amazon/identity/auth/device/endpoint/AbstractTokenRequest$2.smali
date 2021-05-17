.class synthetic Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest$2;
.super Ljava/lang/Object;
.source "AbstractTokenRequest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$amazon$identity$auth$device$AccountManagerConstants$OVERIDE_APP_STATE:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 590
    invoke-static {}, Lcom/amazon/identity/auth/device/AccountManagerConstants$OVERIDE_APP_STATE;->values()[Lcom/amazon/identity/auth/device/AccountManagerConstants$OVERIDE_APP_STATE;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest$2;->$SwitchMap$com$amazon$identity$auth$device$AccountManagerConstants$OVERIDE_APP_STATE:[I

    :try_start_0
    sget-object v0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest$2;->$SwitchMap$com$amazon$identity$auth$device$AccountManagerConstants$OVERIDE_APP_STATE:[I

    sget-object v1, Lcom/amazon/identity/auth/device/AccountManagerConstants$OVERIDE_APP_STATE;->FORCE_DEVO:Lcom/amazon/identity/auth/device/AccountManagerConstants$OVERIDE_APP_STATE;

    invoke-virtual {v1}, Lcom/amazon/identity/auth/device/AccountManagerConstants$OVERIDE_APP_STATE;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_1

    :goto_0
    :try_start_1
    sget-object v0, Lcom/amazon/identity/auth/device/endpoint/AbstractTokenRequest$2;->$SwitchMap$com$amazon$identity$auth$device$AccountManagerConstants$OVERIDE_APP_STATE:[I

    sget-object v1, Lcom/amazon/identity/auth/device/AccountManagerConstants$OVERIDE_APP_STATE;->FORCE_PRE_PROD:Lcom/amazon/identity/auth/device/AccountManagerConstants$OVERIDE_APP_STATE;

    invoke-virtual {v1}, Lcom/amazon/identity/auth/device/AccountManagerConstants$OVERIDE_APP_STATE;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_0

    :goto_1
    return-void

    :catch_0
    move-exception v0

    goto :goto_1

    :catch_1
    move-exception v0

    goto :goto_0
.end method
