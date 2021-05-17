.class public final enum Lcom/amazon/ags/html5/overlay/PopUpPrefs;
.super Ljava/lang/Enum;
.source "PopUpPrefs.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/amazon/ags/html5/overlay/PopUpPrefs;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/amazon/ags/html5/overlay/PopUpPrefs;

.field private static final FADE_IN_DURATION_MS:I = 0x1f4

.field private static final FADE_OUT_DURATION_MS:I = 0x7d0

.field public static final enum INSTANCE:Lcom/amazon/ags/html5/overlay/PopUpPrefs;

.field private static final WELCOME_BACK_FADE_IN_DURATION_MS:I = 0x1f4

.field private static final WELCOME_BACK_FADE_OUT_DURATION_MS:I = 0xbb8


# instance fields
.field private popUpLocation:Lcom/amazon/ags/api/overlay/PopUpLocation;

.field private popUpsEnabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 17
    new-instance v0, Lcom/amazon/ags/html5/overlay/PopUpPrefs;

    const-string v1, "INSTANCE"

    invoke-direct {v0, v1, v2}, Lcom/amazon/ags/html5/overlay/PopUpPrefs;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/html5/overlay/PopUpPrefs;->INSTANCE:Lcom/amazon/ags/html5/overlay/PopUpPrefs;

    .line 15
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/amazon/ags/html5/overlay/PopUpPrefs;

    sget-object v1, Lcom/amazon/ags/html5/overlay/PopUpPrefs;->INSTANCE:Lcom/amazon/ags/html5/overlay/PopUpPrefs;

    aput-object v1, v0, v2

    sput-object v0, Lcom/amazon/ags/html5/overlay/PopUpPrefs;->$VALUES:[Lcom/amazon/ags/html5/overlay/PopUpPrefs;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 15
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 19
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/amazon/ags/html5/overlay/PopUpPrefs;->popUpsEnabled:Z

    .line 20
    sget-object v0, Lcom/amazon/ags/api/overlay/PopUpLocation;->BOTTOM_CENTER:Lcom/amazon/ags/api/overlay/PopUpLocation;

    iput-object v0, p0, Lcom/amazon/ags/html5/overlay/PopUpPrefs;->popUpLocation:Lcom/amazon/ags/api/overlay/PopUpLocation;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/amazon/ags/html5/overlay/PopUpPrefs;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 15
    const-class v0, Lcom/amazon/ags/html5/overlay/PopUpPrefs;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/amazon/ags/html5/overlay/PopUpPrefs;

    return-object v0
.end method

.method public static values()[Lcom/amazon/ags/html5/overlay/PopUpPrefs;
    .locals 1

    .prologue
    .line 15
    sget-object v0, Lcom/amazon/ags/html5/overlay/PopUpPrefs;->$VALUES:[Lcom/amazon/ags/html5/overlay/PopUpPrefs;

    invoke-virtual {v0}, [Lcom/amazon/ags/html5/overlay/PopUpPrefs;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazon/ags/html5/overlay/PopUpPrefs;

    return-object v0
.end method


# virtual methods
.method public declared-synchronized disable()V
    .locals 2

    .prologue
    .line 28
    monitor-enter p0

    :try_start_0
    sget-object v0, Lcom/amazon/ags/html5/overlay/PopUpPrefs;->INSTANCE:Lcom/amazon/ags/html5/overlay/PopUpPrefs;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/amazon/ags/html5/overlay/PopUpPrefs;->popUpsEnabled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    monitor-exit p0

    return-void

    .line 28
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized enable()V
    .locals 2

    .prologue
    .line 32
    monitor-enter p0

    :try_start_0
    sget-object v0, Lcom/amazon/ags/html5/overlay/PopUpPrefs;->INSTANCE:Lcom/amazon/ags/html5/overlay/PopUpPrefs;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/amazon/ags/html5/overlay/PopUpPrefs;->popUpsEnabled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    monitor-exit p0

    return-void

    .line 32
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getFadeInDuration()I
    .locals 1

    .prologue
    .line 48
    const/16 v0, 0x1f4

    return v0
.end method

.method public getFadeOutDuration()I
    .locals 1

    .prologue
    .line 52
    const/16 v0, 0x7d0

    return v0
.end method

.method public declared-synchronized getLocation()Lcom/amazon/ags/api/overlay/PopUpLocation;
    .locals 1

    .prologue
    .line 44
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/PopUpPrefs;->popUpLocation:Lcom/amazon/ags/api/overlay/PopUpLocation;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getWelcomeBackFadeInDuration()I
    .locals 1

    .prologue
    .line 56
    const/16 v0, 0x1f4

    return v0
.end method

.method public getWelcomeBackFadeOutDuration()I
    .locals 1

    .prologue
    .line 60
    const/16 v0, 0xbb8

    return v0
.end method

.method public declared-synchronized isEnabled()Z
    .locals 1

    .prologue
    .line 40
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/amazon/ags/html5/overlay/PopUpPrefs;->popUpsEnabled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setLocation(Lcom/amazon/ags/api/overlay/PopUpLocation;)V
    .locals 1
    .param p1, "location"    # Lcom/amazon/ags/api/overlay/PopUpLocation;

    .prologue
    .line 36
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcom/amazon/ags/html5/overlay/PopUpPrefs;->popUpLocation:Lcom/amazon/ags/api/overlay/PopUpLocation;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    monitor-exit p0

    return-void

    .line 36
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
