; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [348 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [690 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 67
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 66
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 107
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 265
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 299
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 47
	i32 39485524, ; 6: System.Net.WebSockets.dll => 0x25a8054 => 79
	i32 42639949, ; 7: System.Threading.Thread => 0x28aa24d => 144
	i32 66541672, ; 8: System.Diagnostics.StackTrace => 0x3f75868 => 29
	i32 67008169, ; 9: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 340
	i32 68219467, ; 10: System.Security.Cryptography.Primitives => 0x410f24b => 123
	i32 72070932, ; 11: Microsoft.Maui.Graphics.dll => 0x44bb714 => 207
	i32 82292897, ; 12: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 101
	i32 101534019, ; 13: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 283
	i32 117431740, ; 14: System.Runtime.InteropServices => 0x6ffddbc => 106
	i32 120558881, ; 15: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 283
	i32 122350210, ; 16: System.Threading.Channels.dll => 0x74aea82 => 138
	i32 134690465, ; 17: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 303
	i32 142721839, ; 18: System.Net.WebHeaderCollection => 0x881c32f => 76
	i32 149764678, ; 19: Svg.Skia.dll => 0x8ed3a46 => 221
	i32 149972175, ; 20: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 123
	i32 159306688, ; 21: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 22: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 239
	i32 176265551, ; 23: System.ServiceProcess => 0xa81994f => 131
	i32 182336117, ; 24: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 285
	i32 184328833, ; 25: System.ValueTuple.dll => 0xafca281 => 150
	i32 195452805, ; 26: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 337
	i32 199333315, ; 27: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 338
	i32 205061960, ; 28: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 29: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 237
	i32 220171995, ; 30: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230180113, ; 31: System.Web.WebPages.dll => 0xdb84511 => 187
	i32 230216969, ; 32: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 259
	i32 230752869, ; 33: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 34: System.Linq.Parallel => 0xdcb05c4 => 58
	i32 231814094, ; 35: System.Globalization => 0xdd133ce => 41
	i32 246610117, ; 36: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 90
	i32 261689757, ; 37: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 242
	i32 276479776, ; 38: System.Threading.Timer.dll => 0x107abf20 => 146
	i32 278686392, ; 39: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 261
	i32 280482487, ; 40: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 258
	i32 280992041, ; 41: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 309
	i32 291076382, ; 42: System.IO.Pipes.AccessControl.dll => 0x1159791e => 53
	i32 292822316, ; 43: Mapsui.UI.Maui => 0x11741d2c => 178
	i32 298918909, ; 44: System.Net.Ping.dll => 0x11d123fd => 68
	i32 317674968, ; 45: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 337
	i32 318968648, ; 46: Xamarin.AndroidX.Activity.dll => 0x13031348 => 228
	i32 321597661, ; 47: System.Numerics => 0x132b30dd => 82
	i32 336156722, ; 48: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 322
	i32 342366114, ; 49: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 260
	i32 356389973, ; 50: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 321
	i32 360082299, ; 51: System.ServiceModel.Web => 0x15766b7b => 130
	i32 367780167, ; 52: System.IO.Pipes => 0x15ebe147 => 54
	i32 374914964, ; 53: System.Transactions.Local => 0x1658bf94 => 148
	i32 375677976, ; 54: System.Net.ServicePoint.dll => 0x16646418 => 73
	i32 379916513, ; 55: System.Threading.Thread.dll => 0x16a510e1 => 144
	i32 385762202, ; 56: System.Memory.dll => 0x16fe439a => 61
	i32 392610295, ; 57: System.Threading.ThreadPool.dll => 0x1766c1f7 => 145
	i32 395744057, ; 58: _Microsoft.Android.Resource.Designer => 0x17969339 => 344
	i32 403441872, ; 59: WindowsBase => 0x180c08d0 => 164
	i32 435591531, ; 60: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 333
	i32 441335492, ; 61: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 243
	i32 442565967, ; 62: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 63: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 256
	i32 451504562, ; 64: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 124
	i32 456227837, ; 65: System.Web.HttpUtility.dll => 0x1b317bfd => 151
	i32 459347974, ; 66: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 112
	i32 465658307, ; 67: ExCSS => 0x1bc161c3 => 174
	i32 465846621, ; 68: mscorlib => 0x1bc4415d => 165
	i32 469710990, ; 69: System.dll => 0x1bff388e => 163
	i32 469965489, ; 70: Svg.Model => 0x1c031ab1 => 220
	i32 476646585, ; 71: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 258
	i32 486930444, ; 72: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 271
	i32 498788369, ; 73: System.ObjectModel => 0x1dbae811 => 83
	i32 500358224, ; 74: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 320
	i32 503918385, ; 75: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 314
	i32 513247710, ; 76: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 201
	i32 525008092, ; 77: SkiaSharp.dll => 0x1f4afcdc => 213
	i32 526420162, ; 78: System.Transactions.dll => 0x1f6088c2 => 149
	i32 527452488, ; 79: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 303
	i32 530272170, ; 80: System.Linq.Queryable => 0x1f9b4faa => 59
	i32 539058512, ; 81: Microsoft.Extensions.Logging => 0x20216150 => 197
	i32 540030774, ; 82: System.IO.FileSystem.dll => 0x20303736 => 50
	i32 545304856, ; 83: System.Runtime.Extensions => 0x2080b118 => 102
	i32 546455878, ; 84: System.Runtime.Serialization.Xml => 0x20924146 => 113
	i32 549171840, ; 85: System.Globalization.Calendars => 0x20bbb280 => 39
	i32 557405415, ; 86: Jsr305Binding => 0x213954e7 => 296
	i32 569601784, ; 87: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 294
	i32 577335427, ; 88: System.Security.Cryptography.Cng => 0x22697083 => 119
	i32 592146354, ; 89: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 328
	i32 601371474, ; 90: System.IO.IsolatedStorage.dll => 0x23d83352 => 51
	i32 605376203, ; 91: System.IO.Compression.FileSystem => 0x24154ecb => 43
	i32 613668793, ; 92: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 118
	i32 627609679, ; 93: Xamarin.AndroidX.CustomView => 0x2568904f => 248
	i32 627931235, ; 94: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 326
	i32 639843206, ; 95: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 254
	i32 643868501, ; 96: System.Net => 0x2660a755 => 80
	i32 662205335, ; 97: System.Text.Encodings.Web.dll => 0x27787397 => 135
	i32 663517072, ; 98: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 290
	i32 666292255, ; 99: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 235
	i32 672442732, ; 100: System.Collections.Concurrent => 0x2814a96c => 8
	i32 680049820, ; 101: Mapsui.Rendering.Skia.dll => 0x2888bc9c => 180
	i32 683518922, ; 102: System.Net.Security => 0x28bdabca => 72
	i32 688181140, ; 103: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 308
	i32 690569205, ; 104: System.Xml.Linq.dll => 0x29293ff5 => 154
	i32 691348768, ; 105: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 305
	i32 693804605, ; 106: System.Windows => 0x295a9e3d => 153
	i32 699345723, ; 107: System.Reflection.Emit => 0x29af2b3b => 91
	i32 700284507, ; 108: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 300
	i32 700358131, ; 109: System.IO.Compression.ZipFile => 0x29be9df3 => 44
	i32 706645707, ; 110: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 323
	i32 707711739, ; 111: System.Web.WebPages.Razor => 0x2a2ed2fb => 186
	i32 709557578, ; 112: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 311
	i32 720511267, ; 113: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 304
	i32 722857257, ; 114: System.Runtime.Loader.dll => 0x2b15ed29 => 108
	i32 735137430, ; 115: System.Security.SecureString.dll => 0x2bd14e96 => 128
	i32 752232764, ; 116: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 117: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 225
	i32 759454413, ; 118: System.Net.Requests => 0x2d445acd => 71
	i32 762598435, ; 119: System.IO.Pipes.dll => 0x2d745423 => 54
	i32 775507847, ; 120: System.IO.Compression => 0x2e394f87 => 45
	i32 777317022, ; 121: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 332
	i32 778756650, ; 122: SkiaSharp.HarfBuzz.dll => 0x2e6ae22a => 214
	i32 784326662, ; 123: System.Web.WebPages => 0x2ebfe006 => 187
	i32 789151979, ; 124: Microsoft.Extensions.Options => 0x2f0980eb => 200
	i32 790371945, ; 125: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 249
	i32 804715423, ; 126: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 127: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 263
	i32 823281589, ; 128: System.Private.Uri.dll => 0x311247b5 => 85
	i32 830298997, ; 129: System.IO.Compression.Brotli => 0x317d5b75 => 42
	i32 832635846, ; 130: System.Xml.XPath.dll => 0x31a103c6 => 159
	i32 834051424, ; 131: System.Net.Quic => 0x31b69d60 => 70
	i32 843511501, ; 132: Xamarin.AndroidX.Print => 0x3246f6cd => 276
	i32 873119928, ; 133: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 134: System.Globalization.dll => 0x34505120 => 41
	i32 878954865, ; 135: System.Net.Http.Json => 0x3463c971 => 62
	i32 899130691, ; 136: NetTopologySuite.dll => 0x3597a543 => 209
	i32 904024072, ; 137: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 138: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 52
	i32 926902833, ; 139: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 335
	i32 928116545, ; 140: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 299
	i32 952186615, ; 141: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 104
	i32 956575887, ; 142: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 304
	i32 966729478, ; 143: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 297
	i32 967690846, ; 144: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 260
	i32 975236339, ; 145: System.Diagnostics.Tracing => 0x3a20ecf3 => 33
	i32 975874589, ; 146: System.Xml.XDocument => 0x3a2aaa1d => 157
	i32 986514023, ; 147: System.Private.DataContractSerialization.dll => 0x3acd0267 => 84
	i32 987214855, ; 148: System.Diagnostics.Tools => 0x3ad7b407 => 31
	i32 992768348, ; 149: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 150: System.IO.FileSystem => 0x3b45fb35 => 50
	i32 1001831731, ; 151: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 55
	i32 1012816738, ; 152: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 280
	i32 1019214401, ; 153: System.Drawing => 0x3cbffa41 => 35
	i32 1019642471, ; 154: System.Web.WebPages.Deployment.dll => 0x3cc68267 => 185
	i32 1028951442, ; 155: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 196
	i32 1029334545, ; 156: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 310
	i32 1031528504, ; 157: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 298
	i32 1035644815, ; 158: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 233
	i32 1036536393, ; 159: System.Drawing.Primitives.dll => 0x3dc84a49 => 34
	i32 1044663988, ; 160: System.Linq.Expressions.dll => 0x3e444eb4 => 57
	i32 1052210849, ; 161: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 267
	i32 1067306892, ; 162: GoogleGson => 0x3f9dcf8c => 175
	i32 1082857460, ; 163: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 164: Xamarin.Kotlin.StdLib => 0x409e66d8 => 301
	i32 1097780905, ; 165: Microsoft.Web.Infrastructure => 0x416ecea9 => 208
	i32 1098259244, ; 166: System => 0x41761b2c => 163
	i32 1118262833, ; 167: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 323
	i32 1121599056, ; 168: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 266
	i32 1127624469, ; 169: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 199
	i32 1149092582, ; 170: Xamarin.AndroidX.Window => 0x447dc2e6 => 293
	i32 1157931901, ; 171: Microsoft.EntityFrameworkCore.Abstractions => 0x4504a37d => 189
	i32 1168523401, ; 172: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 329
	i32 1170634674, ; 173: System.Web.dll => 0x45c677b2 => 152
	i32 1175144683, ; 174: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 289
	i32 1178241025, ; 175: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 274
	i32 1202000627, ; 176: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x47a512f3 => 189
	i32 1203215381, ; 177: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 327
	i32 1204270330, ; 178: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 235
	i32 1204575371, ; 179: Microsoft.Extensions.Caching.Memory.dll => 0x47cc5c8b => 192
	i32 1208641965, ; 180: System.Diagnostics.Process => 0x480a69ad => 28
	i32 1214827643, ; 181: CommunityToolkit.Mvvm => 0x4868cc7b => 173
	i32 1219128291, ; 182: System.IO.IsolatedStorage => 0x48aa6be3 => 51
	i32 1234928153, ; 183: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 325
	i32 1243150071, ; 184: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 294
	i32 1253011324, ; 185: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 186: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 309
	i32 1264511973, ; 187: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 284
	i32 1267360935, ; 188: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 288
	i32 1273260888, ; 189: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 240
	i32 1275534314, ; 190: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 305
	i32 1278448581, ; 191: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 232
	i32 1289720649, ; 192: System.Web.Helpers.dll => 0x4cdf9349 => 184
	i32 1293217323, ; 193: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 251
	i32 1309188875, ; 194: System.Private.DataContractSerialization => 0x4e08a30b => 84
	i32 1313028017, ; 195: Topten.RichTextKit => 0x4e4337b1 => 223
	i32 1322716291, ; 196: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 293
	i32 1324164729, ; 197: System.Linq => 0x4eed2679 => 60
	i32 1335329327, ; 198: System.Runtime.Serialization.Json.dll => 0x4f97822f => 111
	i32 1364015309, ; 199: System.IO => 0x514d38cd => 56
	i32 1373134921, ; 200: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 339
	i32 1376866003, ; 201: Xamarin.AndroidX.SavedState => 0x52114ed3 => 280
	i32 1379779777, ; 202: System.Resources.ResourceManager => 0x523dc4c1 => 98
	i32 1388087747, ; 203: Mapsui.dll => 0x52bc89c3 => 177
	i32 1402170036, ; 204: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 205: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 244
	i32 1408764838, ; 206: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 110
	i32 1411638395, ; 207: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 100
	i32 1422545099, ; 208: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 101
	i32 1422967952, ; 209: Mapsui.Tiling.dll => 0x54d0c490 => 181
	i32 1430672901, ; 210: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 307
	i32 1434145427, ; 211: System.Runtime.Handles => 0x557b5293 => 103
	i32 1435222561, ; 212: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 297
	i32 1439761251, ; 213: System.Net.Quic.dll => 0x55d10363 => 70
	i32 1443938015, ; 214: NetTopologySuite => 0x5610bedf => 209
	i32 1452070440, ; 215: System.Formats.Asn1.dll => 0x568cd628 => 37
	i32 1453312822, ; 216: System.Diagnostics.Tools.dll => 0x569fcb36 => 31
	i32 1457743152, ; 217: System.Runtime.Extensions.dll => 0x56e36530 => 102
	i32 1458022317, ; 218: System.Net.Security.dll => 0x56e7a7ad => 72
	i32 1461004990, ; 219: es\Microsoft.Maui.Controls.resources => 0x57152abe => 313
	i32 1461234159, ; 220: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 221: System.Security.Cryptography.OpenSsl => 0x57201017 => 122
	i32 1462112819, ; 222: System.IO.Compression.dll => 0x57261233 => 45
	i32 1469204771, ; 223: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 234
	i32 1470490898, ; 224: Microsoft.Extensions.Primitives => 0x57a5e912 => 201
	i32 1479771757, ; 225: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 226: System.IO.Compression.Brotli.dll => 0x583e844f => 42
	i32 1487239319, ; 227: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 228: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 281
	i32 1493001747, ; 229: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 317
	i32 1514721132, ; 230: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 312
	i32 1518211063, ; 231: Microsoft.Web.Infrastructure.dll => 0x5a7e0ff7 => 208
	i32 1518271285, ; 232: System.Web.WebPages.Razor.dll => 0x5a7efb35 => 186
	i32 1536373174, ; 233: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 30
	i32 1543031311, ; 234: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 137
	i32 1543355203, ; 235: System.Reflection.Emit.dll => 0x5bfdbb43 => 91
	i32 1550322496, ; 236: System.Reflection.Extensions.dll => 0x5c680b40 => 92
	i32 1551623176, ; 237: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 332
	i32 1565862583, ; 238: System.IO.FileSystem.Primitives => 0x5d552ab7 => 48
	i32 1566207040, ; 239: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 140
	i32 1573704789, ; 240: System.Runtime.Serialization.Json => 0x5dccd455 => 111
	i32 1580037396, ; 241: System.Threading.Overlapped => 0x5e2d7514 => 139
	i32 1582372066, ; 242: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 250
	i32 1592978981, ; 243: System.Runtime.Serialization.dll => 0x5ef2ee25 => 114
	i32 1597949149, ; 244: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 298
	i32 1600541741, ; 245: ShimSkiaSharp => 0x5f66542d => 212
	i32 1601112923, ; 246: System.Xml.Serialization => 0x5f6f0b5b => 156
	i32 1603525486, ; 247: Microsoft.Maui.Controls.HotReload.Forms.dll => 0x5f93db6e => 341
	i32 1604827217, ; 248: System.Net.WebClient => 0x5fa7b851 => 75
	i32 1618516317, ; 249: System.Net.WebSockets.Client.dll => 0x6078995d => 78
	i32 1622152042, ; 250: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 270
	i32 1622358360, ; 251: System.Dynamic.Runtime => 0x60b33958 => 36
	i32 1623212457, ; 252: SkiaSharp.Views.Maui.Controls => 0x60c041a9 => 216
	i32 1624863272, ; 253: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 292
	i32 1635184631, ; 254: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 254
	i32 1636350590, ; 255: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 247
	i32 1639515021, ; 256: System.Net.Http.dll => 0x61b9038d => 63
	i32 1639986890, ; 257: System.Text.RegularExpressions => 0x61c036ca => 137
	i32 1641389582, ; 258: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 259: System.Runtime => 0x62c6282e => 115
	i32 1658241508, ; 260: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 286
	i32 1658251792, ; 261: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 295
	i32 1670060433, ; 262: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 242
	i32 1672364457, ; 263: NetTopologySuite.IO.GeoJSON4STJ.dll => 0x63ae41a9 => 211
	i32 1675553242, ; 264: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 47
	i32 1677501392, ; 265: System.Net.Primitives.dll => 0x63fca3d0 => 69
	i32 1678508291, ; 266: System.Net.WebSockets => 0x640c0103 => 79
	i32 1679769178, ; 267: System.Security.Cryptography => 0x641f3e5a => 125
	i32 1689493916, ; 268: Microsoft.EntityFrameworkCore.dll => 0x64b3a19c => 188
	i32 1691477237, ; 269: System.Reflection.Metadata => 0x64d1e4f5 => 93
	i32 1696967625, ; 270: System.Security.Cryptography.Csp => 0x6525abc9 => 120
	i32 1698840827, ; 271: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 302
	i32 1701541528, ; 272: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 273: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 263
	i32 1726116996, ; 274: System.Reflection.dll => 0x66e27484 => 96
	i32 1728033016, ; 275: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 27
	i32 1729485958, ; 276: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 238
	i32 1736233607, ; 277: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 330
	i32 1743415430, ; 278: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 308
	i32 1744735666, ; 279: System.Transactions.Local.dll => 0x67fe8db2 => 148
	i32 1746316138, ; 280: Mono.Android.Export => 0x6816ab6a => 168
	i32 1750313021, ; 281: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 282: System.Resources.Reader.dll => 0x68cc9d1e => 97
	i32 1763938596, ; 283: System.Diagnostics.TraceSource.dll => 0x69239124 => 32
	i32 1765942094, ; 284: System.Reflection.Extensions => 0x6942234e => 92
	i32 1766324549, ; 285: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 285
	i32 1770582343, ; 286: Microsoft.Extensions.Logging.dll => 0x6988f147 => 197
	i32 1776026572, ; 287: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 288: System.Globalization.Extensions.dll => 0x69ec0683 => 40
	i32 1780572499, ; 289: Mono.Android.Runtime.dll => 0x6a216153 => 169
	i32 1782862114, ; 290: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 324
	i32 1788241197, ; 291: Xamarin.AndroidX.Fragment => 0x6a96652d => 256
	i32 1793755602, ; 292: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 316
	i32 1808609942, ; 293: Xamarin.AndroidX.Loader => 0x6bcd3296 => 270
	i32 1813058853, ; 294: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 301
	i32 1813201214, ; 295: Xamarin.Google.Android.Material => 0x6c13413e => 295
	i32 1818569960, ; 296: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 275
	i32 1818787751, ; 297: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 298: System.Text.Encoding.Extensions => 0x6cbab720 => 133
	i32 1824722060, ; 299: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 110
	i32 1827303595, ; 300: Microsoft.VisualStudio.DesignTools.TapContract => 0x6cea70ab => 343
	i32 1828688058, ; 301: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 198
	i32 1839733746, ; 302: Mapsui.Nts.dll => 0x6da81bf2 => 179
	i32 1842015223, ; 303: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 336
	i32 1847515442, ; 304: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 225
	i32 1853025655, ; 305: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 333
	i32 1858542181, ; 306: System.Linq.Expressions => 0x6ec71a65 => 57
	i32 1870277092, ; 307: System.Reflection.Primitives => 0x6f7a29e4 => 94
	i32 1875935024, ; 308: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 315
	i32 1879696579, ; 309: System.Formats.Tar.dll => 0x7009e4c3 => 38
	i32 1885316902, ; 310: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 236
	i32 1885918049, ; 311: Microsoft.VisualStudio.DesignTools.TapContract.dll => 0x7068d361 => 343
	i32 1888955245, ; 312: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 313: System.Reflection.Metadata.dll => 0x70a66bdd => 93
	i32 1898237753, ; 314: System.Reflection.DispatchProxy => 0x7124cf39 => 88
	i32 1900610850, ; 315: System.Resources.ResourceManager.dll => 0x71490522 => 98
	i32 1910275211, ; 316: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1910702736, ; 317: TransRD.dll => 0x71e30290 => 0
	i32 1939592360, ; 318: System.Private.Xml.Linq => 0x739bd4a8 => 86
	i32 1946635558, ; 319: System.Web.Razor => 0x74074d26 => 183
	i32 1956758971, ; 320: System.Resources.Writer => 0x74a1c5bb => 99
	i32 1961813231, ; 321: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 282
	i32 1968388702, ; 322: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 193
	i32 1983156543, ; 323: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 302
	i32 1985761444, ; 324: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 227
	i32 1998845772, ; 325: Microsoft.EntityFrameworkCore.InMemory.dll => 0x7723f74c => 190
	i32 2003115576, ; 326: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 312
	i32 2011961780, ; 327: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 328: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 267
	i32 2025202353, ; 329: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 307
	i32 2031763787, ; 330: Xamarin.Android.Glide => 0x791a414b => 224
	i32 2045470958, ; 331: System.Private.Xml => 0x79eb68ee => 87
	i32 2055257422, ; 332: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 262
	i32 2060060697, ; 333: System.Windows.dll => 0x7aca0819 => 153
	i32 2066184531, ; 334: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 311
	i32 2070888862, ; 335: System.Diagnostics.TraceSource => 0x7b6f419e => 32
	i32 2079903147, ; 336: System.Runtime.dll => 0x7bf8cdab => 115
	i32 2090596640, ; 337: System.Numerics.Vectors => 0x7c9bf920 => 81
	i32 2127167465, ; 338: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 339: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 340: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 161
	i32 2146852085, ; 341: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 342: Microsoft.Maui => 0x80bd55ad => 205
	i32 2169148018, ; 343: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 319
	i32 2181898931, ; 344: Microsoft.Extensions.Options.dll => 0x820d22b3 => 200
	i32 2188602587, ; 345: Microcharts.Maui => 0x82736cdb => 182
	i32 2192057212, ; 346: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 198
	i32 2193016926, ; 347: System.ObjectModel.dll => 0x82b6c85e => 83
	i32 2201107256, ; 348: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 306
	i32 2201231467, ; 349: System.Net.Http => 0x8334206b => 63
	i32 2207618523, ; 350: it\Microsoft.Maui.Controls.resources => 0x839595db => 321
	i32 2217644978, ; 351: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 289
	i32 2222056684, ; 352: System.Threading.Tasks.Parallel => 0x8471e4ec => 142
	i32 2244775296, ; 353: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 271
	i32 2252106437, ; 354: System.Xml.Serialization.dll => 0x863c6ac5 => 156
	i32 2252897993, ; 355: Microsoft.EntityFrameworkCore => 0x86487ec9 => 188
	i32 2256313426, ; 356: System.Globalization.Extensions => 0x867c9c52 => 40
	i32 2265110946, ; 357: System.Security.AccessControl.dll => 0x8702d9a2 => 116
	i32 2266799131, ; 358: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 194
	i32 2267999099, ; 359: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 226
	i32 2270573516, ; 360: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 315
	i32 2279755925, ; 361: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 278
	i32 2293034957, ; 362: System.ServiceModel.Web.dll => 0x88acefcd => 130
	i32 2295906218, ; 363: System.Net.Sockets => 0x88d8bfaa => 74
	i32 2298471582, ; 364: System.Net.Mail => 0x88ffe49e => 65
	i32 2303942373, ; 365: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 325
	i32 2305521784, ; 366: System.Private.CoreLib.dll => 0x896b7878 => 171
	i32 2315684594, ; 367: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 230
	i32 2320631194, ; 368: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 142
	i32 2327893114, ; 369: ExCSS.dll => 0x8ac0d47a => 174
	i32 2340441535, ; 370: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 105
	i32 2344264397, ; 371: System.ValueTuple => 0x8bbaa2cd => 150
	i32 2353062107, ; 372: System.Net.Primitives => 0x8c40e0db => 69
	i32 2364201794, ; 373: SkiaSharp.Views.Maui.Core => 0x8ceadb42 => 218
	i32 2368005991, ; 374: System.Xml.ReaderWriter.dll => 0x8d24e767 => 155
	i32 2371007202, ; 375: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 193
	i32 2378619854, ; 376: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 120
	i32 2383496789, ; 377: System.Security.Principal.Windows.dll => 0x8e114655 => 126
	i32 2395872292, ; 378: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 320
	i32 2401565422, ; 379: System.Web.HttpUtility => 0x8f24faee => 151
	i32 2403452196, ; 380: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 253
	i32 2409983638, ; 381: Microsoft.VisualStudio.DesignTools.MobileTapContracts.dll => 0x8fa56e96 => 342
	i32 2421380589, ; 382: System.Threading.Tasks.Dataflow => 0x905355ed => 140
	i32 2423080555, ; 383: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 240
	i32 2427813419, ; 384: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 317
	i32 2435356389, ; 385: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 386: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2436099724, ; 387: Microsoft.EntityFrameworkCore.InMemory => 0x9133ee8c => 190
	i32 2454642406, ; 388: System.Text.Encoding.dll => 0x924edee6 => 134
	i32 2458678730, ; 389: System.Net.Sockets.dll => 0x928c75ca => 74
	i32 2459001652, ; 390: System.Linq.Parallel.dll => 0x92916334 => 58
	i32 2465532216, ; 391: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 243
	i32 2471841756, ; 392: netstandard.dll => 0x93554fdc => 166
	i32 2475788418, ; 393: Java.Interop.dll => 0x93918882 => 167
	i32 2480646305, ; 394: Microsoft.Maui.Controls => 0x93dba8a1 => 203
	i32 2483903535, ; 395: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 396: System.Net.ServicePoint => 0x94147f61 => 73
	i32 2490993605, ; 397: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 398: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 399: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 265
	i32 2521915375, ; 400: SkiaSharp.Views.Maui.Controls.Compatibility => 0x96515fef => 217
	i32 2522472828, ; 401: Xamarin.Android.Glide.dll => 0x9659e17c => 224
	i32 2523023297, ; 402: Svg.Custom.dll => 0x966247c1 => 219
	i32 2538310050, ; 403: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 90
	i32 2550873716, ; 404: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 318
	i32 2562349572, ; 405: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 406: System.Text.Encodings.Web => 0x9930ee42 => 135
	i32 2577414832, ; 407: Mapsui.Nts => 0x99a03ab0 => 179
	i32 2581783588, ; 408: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 266
	i32 2581819634, ; 409: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 288
	i32 2585220780, ; 410: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 133
	i32 2585805581, ; 411: System.Net.Ping => 0x9a20430d => 68
	i32 2589602615, ; 412: System.Threading.ThreadPool => 0x9a5a3337 => 145
	i32 2593496499, ; 413: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 327
	i32 2602257211, ; 414: Svg.Model.dll => 0x9b1b4b3b => 220
	i32 2605712449, ; 415: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 306
	i32 2609324236, ; 416: Svg.Custom => 0x9b8720cc => 219
	i32 2615233544, ; 417: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 257
	i32 2616218305, ; 418: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 199
	i32 2617129537, ; 419: System.Private.Xml.dll => 0x9bfe3a41 => 87
	i32 2618712057, ; 420: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 95
	i32 2620871830, ; 421: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 247
	i32 2624644809, ; 422: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 252
	i32 2625339995, ; 423: SkiaSharp.Views.Maui.Core.dll => 0x9c7b825b => 218
	i32 2626831493, ; 424: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 322
	i32 2627185994, ; 425: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 30
	i32 2629843544, ; 426: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 44
	i32 2633051222, ; 427: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 261
	i32 2663391936, ; 428: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 226
	i32 2663698177, ; 429: System.Runtime.Loader => 0x9ec4cf01 => 108
	i32 2664396074, ; 430: System.Xml.XDocument.dll => 0x9ecf752a => 157
	i32 2665622720, ; 431: System.Drawing.Primitives => 0x9ee22cc0 => 34
	i32 2676780864, ; 432: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 433: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 113
	i32 2693849962, ; 434: System.IO.dll => 0xa090e36a => 56
	i32 2701096212, ; 435: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 286
	i32 2715334215, ; 436: System.Threading.Tasks.dll => 0xa1d8b647 => 143
	i32 2717744543, ; 437: System.Security.Claims => 0xa1fd7d9f => 117
	i32 2719963679, ; 438: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 119
	i32 2724373263, ; 439: System.Runtime.Numerics.dll => 0xa262a30f => 109
	i32 2732626843, ; 440: Xamarin.AndroidX.Activity => 0xa2e0939b => 228
	i32 2735172069, ; 441: System.Threading.Channels => 0xa30769e5 => 138
	i32 2737747696, ; 442: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 234
	i32 2740948882, ; 443: System.IO.Pipes.AccessControl => 0xa35f8f92 => 53
	i32 2748088231, ; 444: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 104
	i32 2752995522, ; 445: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 328
	i32 2756874198, ; 446: NetTopologySuite.IO.GeoJSON4STJ => 0xa4528fd6 => 211
	i32 2758225723, ; 447: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 204
	i32 2764765095, ; 448: Microsoft.Maui.dll => 0xa4caf7a7 => 205
	i32 2765824710, ; 449: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 132
	i32 2770495804, ; 450: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 300
	i32 2778768386, ; 451: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 291
	i32 2779977773, ; 452: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 279
	i32 2785988530, ; 453: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 334
	i32 2788224221, ; 454: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 257
	i32 2795602088, ; 455: SkiaSharp.Views.Android.dll => 0xa6a180a8 => 215
	i32 2801831435, ; 456: Microsoft.Maui.Graphics => 0xa7008e0b => 207
	i32 2803228030, ; 457: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 158
	i32 2806116107, ; 458: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 313
	i32 2810250172, ; 459: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 244
	i32 2819470561, ; 460: System.Xml.dll => 0xa80db4e1 => 162
	i32 2821205001, ; 461: System.ServiceProcess.dll => 0xa8282c09 => 131
	i32 2821294376, ; 462: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 279
	i32 2824502124, ; 463: System.Xml.XmlDocument => 0xa85a7b6c => 160
	i32 2831556043, ; 464: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 326
	i32 2838993487, ; 465: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 268
	i32 2842508798, ; 466: System.Web.Helpers => 0xa96d3dfe => 184
	i32 2849599387, ; 467: System.Threading.Overlapped.dll => 0xa9d96f9b => 139
	i32 2853208004, ; 468: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 291
	i32 2855708567, ; 469: Xamarin.AndroidX.Transition => 0xaa36a797 => 287
	i32 2861098320, ; 470: Mono.Android.Export.dll => 0xaa88e550 => 168
	i32 2861189240, ; 471: Microsoft.Maui.Essentials => 0xaa8a4878 => 206
	i32 2870099610, ; 472: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 229
	i32 2875164099, ; 473: Jsr305Binding.dll => 0xab5f85c3 => 296
	i32 2875220617, ; 474: System.Globalization.Calendars.dll => 0xab606289 => 39
	i32 2884993177, ; 475: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 255
	i32 2887636118, ; 476: System.Net.dll => 0xac1dd496 => 80
	i32 2899753641, ; 477: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 55
	i32 2900621748, ; 478: System.Dynamic.Runtime.dll => 0xace3f9b4 => 36
	i32 2901442782, ; 479: System.Reflection => 0xacf080de => 96
	i32 2905242038, ; 480: mscorlib.dll => 0xad2a79b6 => 165
	i32 2909740682, ; 481: System.Private.CoreLib => 0xad6f1e8a => 171
	i32 2912489636, ; 482: SkiaSharp.Views.Android => 0xad9910a4 => 215
	i32 2916838712, ; 483: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 292
	i32 2919462931, ; 484: System.Numerics.Vectors.dll => 0xae037813 => 81
	i32 2921128767, ; 485: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 231
	i32 2936416060, ; 486: System.Resources.Reader => 0xaf06273c => 97
	i32 2940926066, ; 487: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 29
	i32 2942453041, ; 488: System.Xml.XPath.XDocument => 0xaf624531 => 158
	i32 2959614098, ; 489: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 490: System.Security.Principal.Windows => 0xb0ed41f3 => 126
	i32 2972252294, ; 491: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 118
	i32 2978675010, ; 492: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 251
	i32 2987532451, ; 493: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 282
	i32 2996846495, ; 494: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 264
	i32 3016983068, ; 495: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 284
	i32 3023353419, ; 496: WindowsBase.dll => 0xb434b64b => 164
	i32 3024354802, ; 497: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 259
	i32 3038032645, ; 498: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 344
	i32 3056245963, ; 499: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 281
	i32 3057625584, ; 500: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 272
	i32 3059408633, ; 501: Mono.Android.Runtime => 0xb65adef9 => 169
	i32 3059793426, ; 502: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3069363400, ; 503: Microsoft.Extensions.Caching.Abstractions.dll => 0xb6f2c4c8 => 191
	i32 3075834255, ; 504: System.Threading.Tasks => 0xb755818f => 143
	i32 3077302341, ; 505: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 319
	i32 3090735792, ; 506: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 124
	i32 3099732863, ; 507: System.Security.Claims.dll => 0xb8c22b7f => 117
	i32 3103600923, ; 508: System.Formats.Asn1 => 0xb8fd311b => 37
	i32 3111772706, ; 509: System.Runtime.Serialization => 0xb979e222 => 114
	i32 3121463068, ; 510: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 46
	i32 3124832203, ; 511: System.Threading.Tasks.Extensions => 0xba4127cb => 141
	i32 3132293585, ; 512: System.Security.AccessControl => 0xbab301d1 => 116
	i32 3134694676, ; 513: ShimSkiaSharp.dll => 0xbad7a514 => 212
	i32 3147165239, ; 514: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 33
	i32 3148237826, ; 515: GoogleGson.dll => 0xbba64c02 => 175
	i32 3159123045, ; 516: System.Reflection.Primitives.dll => 0xbc4c6465 => 94
	i32 3160747431, ; 517: System.IO.MemoryMappedFiles => 0xbc652da7 => 52
	i32 3178803400, ; 518: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 273
	i32 3192346100, ; 519: System.Security.SecureString => 0xbe4755f4 => 128
	i32 3193515020, ; 520: System.Web => 0xbe592c0c => 152
	i32 3195844289, ; 521: Microsoft.Extensions.Caching.Abstractions => 0xbe7cb6c1 => 191
	i32 3204380047, ; 522: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 523: System.Xml.XmlDocument.dll => 0xbf506931 => 160
	i32 3211777861, ; 524: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 250
	i32 3220365878, ; 525: System.Threading => 0xbff2e236 => 147
	i32 3226221578, ; 526: System.Runtime.Handles.dll => 0xc04c3c0a => 103
	i32 3251039220, ; 527: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 88
	i32 3258312781, ; 528: Xamarin.AndroidX.CardView => 0xc235e84d => 238
	i32 3265493905, ; 529: System.Linq.Queryable.dll => 0xc2a37b91 => 59
	i32 3265893370, ; 530: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 141
	i32 3277815716, ; 531: System.Resources.Writer.dll => 0xc35f7fa4 => 99
	i32 3278552754, ; 532: Mapsui => 0xc36abeb2 => 177
	i32 3279906254, ; 533: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 534: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 535: System.Security.Cryptography.Encoding => 0xc4251ff9 => 121
	i32 3299363146, ; 536: System.Text.Encoding => 0xc4a8494a => 134
	i32 3303498502, ; 537: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 27
	i32 3305363605, ; 538: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 314
	i32 3316684772, ; 539: System.Net.Requests.dll => 0xc5b097e4 => 71
	i32 3317135071, ; 540: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 248
	i32 3317144872, ; 541: System.Data => 0xc5b79d28 => 24
	i32 3340387945, ; 542: SkiaSharp => 0xc71a4669 => 213
	i32 3340431453, ; 543: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 236
	i32 3345895724, ; 544: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 277
	i32 3346324047, ; 545: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 274
	i32 3357674450, ; 546: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 331
	i32 3358260929, ; 547: System.Text.Json => 0xc82afec1 => 136
	i32 3362336904, ; 548: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 229
	i32 3362522851, ; 549: Xamarin.AndroidX.Core => 0xc86c06e3 => 245
	i32 3366347497, ; 550: Java.Interop => 0xc8a662e9 => 167
	i32 3374999561, ; 551: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 278
	i32 3381016424, ; 552: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 310
	i32 3395150330, ; 553: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 100
	i32 3403906625, ; 554: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 122
	i32 3405233483, ; 555: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 249
	i32 3428513518, ; 556: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 195
	i32 3429136800, ; 557: System.Xml => 0xcc6479a0 => 162
	i32 3430777524, ; 558: netstandard => 0xcc7d82b4 => 166
	i32 3441283291, ; 559: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 252
	i32 3445260447, ; 560: System.Formats.Tar => 0xcd5a809f => 38
	i32 3452344032, ; 561: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 202
	i32 3459815001, ; 562: Mapsui.Rendering.Skia => 0xce389659 => 180
	i32 3463511458, ; 563: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 318
	i32 3466574376, ; 564: SkiaSharp.Views.Maui.Controls.Compatibility.dll => 0xce9fba28 => 217
	i32 3471940407, ; 565: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3473156932, ; 566: SkiaSharp.Views.Maui.Controls.dll => 0xcf042b44 => 216
	i32 3476120550, ; 567: Mono.Android => 0xcf3163e6 => 170
	i32 3479583265, ; 568: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 331
	i32 3484440000, ; 569: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 330
	i32 3485117614, ; 570: System.Text.Json.dll => 0xcfbaacae => 136
	i32 3486566296, ; 571: System.Transactions => 0xcfd0c798 => 149
	i32 3493954962, ; 572: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 241
	i32 3509114376, ; 573: System.Xml.Linq => 0xd128d608 => 154
	i32 3515174580, ; 574: System.Security.dll => 0xd1854eb4 => 129
	i32 3530912306, ; 575: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 576: System.Net.HttpListener => 0xd2ff69f1 => 64
	i32 3560100363, ; 577: System.Threading.Timer => 0xd432d20b => 146
	i32 3570554715, ; 578: System.IO.FileSystem.AccessControl => 0xd4d2575b => 46
	i32 3580758918, ; 579: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 338
	i32 3597029428, ; 580: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 227
	i32 3598340787, ; 581: System.Net.WebSockets.Client => 0xd67a52b3 => 78
	i32 3608519521, ; 582: System.Linq.dll => 0xd715a361 => 60
	i32 3624195450, ; 583: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 105
	i32 3627220390, ; 584: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 276
	i32 3633644679, ; 585: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 231
	i32 3638274909, ; 586: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 48
	i32 3641597786, ; 587: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 262
	i32 3643446276, ; 588: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 335
	i32 3643854240, ; 589: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 273
	i32 3645089577, ; 590: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 591: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 194
	i32 3660523487, ; 592: System.Net.NetworkInformation => 0xda2f27df => 67
	i32 3672681054, ; 593: Mono.Android.dll => 0xdae8aa5e => 170
	i32 3676670898, ; 594: Microsoft.Maui.Controls.HotReload.Forms => 0xdb258bb2 => 341
	i32 3682565725, ; 595: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 237
	i32 3684561358, ; 596: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 241
	i32 3697841164, ; 597: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 340
	i32 3700866549, ; 598: System.Net.WebProxy.dll => 0xdc96bdf5 => 77
	i32 3706696989, ; 599: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 246
	i32 3712156464, ; 600: Mapsui.UI.Maui.dll => 0xdd430330 => 178
	i32 3716563718, ; 601: System.Runtime.Intrinsics => 0xdd864306 => 107
	i32 3718780102, ; 602: Xamarin.AndroidX.Annotation => 0xdda814c6 => 230
	i32 3724971120, ; 603: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 272
	i32 3732100267, ; 604: System.Net.NameResolution => 0xde7354ab => 66
	i32 3737834244, ; 605: System.Net.Http.Json.dll => 0xdecad304 => 62
	i32 3748608112, ; 606: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 222
	i32 3751444290, ; 607: System.Xml.XPath => 0xdf9a7f42 => 159
	i32 3786282454, ; 608: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 239
	i32 3792276235, ; 609: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3792835768, ; 610: HarfBuzzSharp => 0xe21214b8 => 176
	i32 3798102808, ; 611: BruTile => 0xe2627318 => 172
	i32 3800979733, ; 612: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 202
	i32 3802395368, ; 613: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3819260425, ; 614: System.Net.WebProxy => 0xe3a54a09 => 77
	i32 3823082795, ; 615: System.Security.Cryptography.dll => 0xe3df9d2b => 125
	i32 3829621856, ; 616: System.Numerics.dll => 0xe4436460 => 82
	i32 3841636137, ; 617: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 196
	i32 3844307129, ; 618: System.Net.Mail.dll => 0xe52378b9 => 65
	i32 3849253459, ; 619: System.Runtime.InteropServices.dll => 0xe56ef253 => 106
	i32 3870376305, ; 620: System.Net.HttpListener.dll => 0xe6b14171 => 64
	i32 3873536506, ; 621: System.Security.Principal => 0xe6e179fa => 127
	i32 3875112723, ; 622: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 121
	i32 3885497537, ; 623: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 76
	i32 3885922214, ; 624: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 287
	i32 3888767677, ; 625: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 277
	i32 3889960447, ; 626: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 339
	i32 3896106733, ; 627: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 628: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 245
	i32 3901907137, ; 629: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 630: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 43
	i32 3921031405, ; 631: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 290
	i32 3928044579, ; 632: System.Xml.ReaderWriter => 0xea213423 => 155
	i32 3930554604, ; 633: System.Security.Principal.dll => 0xea4780ec => 127
	i32 3931092270, ; 634: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 275
	i32 3934069706, ; 635: Topten.RichTextKit.dll => 0xea7d23ca => 223
	i32 3945713374, ; 636: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3952289091, ; 637: NetTopologySuite.Features.dll => 0xeb932543 => 210
	i32 3953583589, ; 638: Svg.Skia => 0xeba6e5e5 => 221
	i32 3953953790, ; 639: System.Text.Encoding.CodePages => 0xebac8bfe => 132
	i32 3955647286, ; 640: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 233
	i32 3959773229, ; 641: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 264
	i32 3980434154, ; 642: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 334
	i32 3987592930, ; 643: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 316
	i32 4003436829, ; 644: System.Diagnostics.Process.dll => 0xee9f991d => 28
	i32 4003906742, ; 645: HarfBuzzSharp.dll => 0xeea6c4b6 => 176
	i32 4013003792, ; 646: BruTile.dll => 0xef319410 => 172
	i32 4015948917, ; 647: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 232
	i32 4022681963, ; 648: Mapsui.Tiling => 0xefc5416b => 181
	i32 4025784931, ; 649: System.Memory => 0xeff49a63 => 61
	i32 4046471985, ; 650: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 204
	i32 4054681211, ; 651: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 89
	i32 4066802364, ; 652: SkiaSharp.HarfBuzz => 0xf2667abc => 214
	i32 4068434129, ; 653: System.Private.Xml.Linq.dll => 0xf27f60d1 => 86
	i32 4073602200, ; 654: System.Threading.dll => 0xf2ce3c98 => 147
	i32 4082724041, ; 655: System.Web.Razor.dll => 0xf3596cc9 => 183
	i32 4094352644, ; 656: Microsoft.Maui.Essentials.dll => 0xf40add04 => 206
	i32 4099507663, ; 657: System.Drawing.dll => 0xf45985cf => 35
	i32 4100113165, ; 658: System.Private.Uri => 0xf462c30d => 85
	i32 4101593132, ; 659: Xamarin.AndroidX.Emoji2 => 0xf479582c => 253
	i32 4101842092, ; 660: Microsoft.Extensions.Caching.Memory => 0xf47d24ac => 192
	i32 4102112229, ; 661: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 329
	i32 4125707920, ; 662: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 324
	i32 4126470640, ; 663: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 195
	i32 4127667938, ; 664: System.IO.FileSystem.Watcher => 0xf60736e2 => 49
	i32 4130442656, ; 665: System.AppContext => 0xf6318da0 => 6
	i32 4144557198, ; 666: NetTopologySuite.Features => 0xf708ec8e => 210
	i32 4147896353, ; 667: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 89
	i32 4150783345, ; 668: System.Web.WebPages.Deployment => 0xf767ed71 => 185
	i32 4150914736, ; 669: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 336
	i32 4151237749, ; 670: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 671: System.Xml.XmlSerializer => 0xf7e95c85 => 161
	i32 4161255271, ; 672: System.Reflection.TypeExtensions => 0xf807b767 => 95
	i32 4164802419, ; 673: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 49
	i32 4181436372, ; 674: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 112
	i32 4182413190, ; 675: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 269
	i32 4182880526, ; 676: Microsoft.VisualStudio.DesignTools.MobileTapContracts => 0xf951b10e => 342
	i32 4185676441, ; 677: System.Security => 0xf97c5a99 => 129
	i32 4189085287, ; 678: Microcharts.Maui.dll => 0xf9b05e67 => 182
	i32 4196529839, ; 679: System.Net.WebClient.dll => 0xfa21f6af => 75
	i32 4213026141, ; 680: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 222
	i32 4231761228, ; 681: TransRD => 0xfc3b8d4c => 0
	i32 4256097574, ; 682: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 246
	i32 4258378803, ; 683: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 268
	i32 4260525087, ; 684: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 685: Microsoft.Maui.Controls.dll => 0xfea12dee => 203
	i32 4274623895, ; 686: CommunityToolkit.Mvvm.dll => 0xfec99597 => 173
	i32 4274976490, ; 687: System.Runtime.Numerics => 0xfecef6ea => 109
	i32 4292120959, ; 688: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 269
	i32 4294763496 ; 689: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 255
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [690 x i32] [
	i32 67, ; 0
	i32 66, ; 1
	i32 107, ; 2
	i32 265, ; 3
	i32 299, ; 4
	i32 47, ; 5
	i32 79, ; 6
	i32 144, ; 7
	i32 29, ; 8
	i32 340, ; 9
	i32 123, ; 10
	i32 207, ; 11
	i32 101, ; 12
	i32 283, ; 13
	i32 106, ; 14
	i32 283, ; 15
	i32 138, ; 16
	i32 303, ; 17
	i32 76, ; 18
	i32 221, ; 19
	i32 123, ; 20
	i32 13, ; 21
	i32 239, ; 22
	i32 131, ; 23
	i32 285, ; 24
	i32 150, ; 25
	i32 337, ; 26
	i32 338, ; 27
	i32 18, ; 28
	i32 237, ; 29
	i32 26, ; 30
	i32 187, ; 31
	i32 259, ; 32
	i32 1, ; 33
	i32 58, ; 34
	i32 41, ; 35
	i32 90, ; 36
	i32 242, ; 37
	i32 146, ; 38
	i32 261, ; 39
	i32 258, ; 40
	i32 309, ; 41
	i32 53, ; 42
	i32 178, ; 43
	i32 68, ; 44
	i32 337, ; 45
	i32 228, ; 46
	i32 82, ; 47
	i32 322, ; 48
	i32 260, ; 49
	i32 321, ; 50
	i32 130, ; 51
	i32 54, ; 52
	i32 148, ; 53
	i32 73, ; 54
	i32 144, ; 55
	i32 61, ; 56
	i32 145, ; 57
	i32 344, ; 58
	i32 164, ; 59
	i32 333, ; 60
	i32 243, ; 61
	i32 12, ; 62
	i32 256, ; 63
	i32 124, ; 64
	i32 151, ; 65
	i32 112, ; 66
	i32 174, ; 67
	i32 165, ; 68
	i32 163, ; 69
	i32 220, ; 70
	i32 258, ; 71
	i32 271, ; 72
	i32 83, ; 73
	i32 320, ; 74
	i32 314, ; 75
	i32 201, ; 76
	i32 213, ; 77
	i32 149, ; 78
	i32 303, ; 79
	i32 59, ; 80
	i32 197, ; 81
	i32 50, ; 82
	i32 102, ; 83
	i32 113, ; 84
	i32 39, ; 85
	i32 296, ; 86
	i32 294, ; 87
	i32 119, ; 88
	i32 328, ; 89
	i32 51, ; 90
	i32 43, ; 91
	i32 118, ; 92
	i32 248, ; 93
	i32 326, ; 94
	i32 254, ; 95
	i32 80, ; 96
	i32 135, ; 97
	i32 290, ; 98
	i32 235, ; 99
	i32 8, ; 100
	i32 180, ; 101
	i32 72, ; 102
	i32 308, ; 103
	i32 154, ; 104
	i32 305, ; 105
	i32 153, ; 106
	i32 91, ; 107
	i32 300, ; 108
	i32 44, ; 109
	i32 323, ; 110
	i32 186, ; 111
	i32 311, ; 112
	i32 304, ; 113
	i32 108, ; 114
	i32 128, ; 115
	i32 25, ; 116
	i32 225, ; 117
	i32 71, ; 118
	i32 54, ; 119
	i32 45, ; 120
	i32 332, ; 121
	i32 214, ; 122
	i32 187, ; 123
	i32 200, ; 124
	i32 249, ; 125
	i32 22, ; 126
	i32 263, ; 127
	i32 85, ; 128
	i32 42, ; 129
	i32 159, ; 130
	i32 70, ; 131
	i32 276, ; 132
	i32 3, ; 133
	i32 41, ; 134
	i32 62, ; 135
	i32 209, ; 136
	i32 16, ; 137
	i32 52, ; 138
	i32 335, ; 139
	i32 299, ; 140
	i32 104, ; 141
	i32 304, ; 142
	i32 297, ; 143
	i32 260, ; 144
	i32 33, ; 145
	i32 157, ; 146
	i32 84, ; 147
	i32 31, ; 148
	i32 12, ; 149
	i32 50, ; 150
	i32 55, ; 151
	i32 280, ; 152
	i32 35, ; 153
	i32 185, ; 154
	i32 196, ; 155
	i32 310, ; 156
	i32 298, ; 157
	i32 233, ; 158
	i32 34, ; 159
	i32 57, ; 160
	i32 267, ; 161
	i32 175, ; 162
	i32 17, ; 163
	i32 301, ; 164
	i32 208, ; 165
	i32 163, ; 166
	i32 323, ; 167
	i32 266, ; 168
	i32 199, ; 169
	i32 293, ; 170
	i32 189, ; 171
	i32 329, ; 172
	i32 152, ; 173
	i32 289, ; 174
	i32 274, ; 175
	i32 189, ; 176
	i32 327, ; 177
	i32 235, ; 178
	i32 192, ; 179
	i32 28, ; 180
	i32 173, ; 181
	i32 51, ; 182
	i32 325, ; 183
	i32 294, ; 184
	i32 5, ; 185
	i32 309, ; 186
	i32 284, ; 187
	i32 288, ; 188
	i32 240, ; 189
	i32 305, ; 190
	i32 232, ; 191
	i32 184, ; 192
	i32 251, ; 193
	i32 84, ; 194
	i32 223, ; 195
	i32 293, ; 196
	i32 60, ; 197
	i32 111, ; 198
	i32 56, ; 199
	i32 339, ; 200
	i32 280, ; 201
	i32 98, ; 202
	i32 177, ; 203
	i32 19, ; 204
	i32 244, ; 205
	i32 110, ; 206
	i32 100, ; 207
	i32 101, ; 208
	i32 181, ; 209
	i32 307, ; 210
	i32 103, ; 211
	i32 297, ; 212
	i32 70, ; 213
	i32 209, ; 214
	i32 37, ; 215
	i32 31, ; 216
	i32 102, ; 217
	i32 72, ; 218
	i32 313, ; 219
	i32 9, ; 220
	i32 122, ; 221
	i32 45, ; 222
	i32 234, ; 223
	i32 201, ; 224
	i32 9, ; 225
	i32 42, ; 226
	i32 4, ; 227
	i32 281, ; 228
	i32 317, ; 229
	i32 312, ; 230
	i32 208, ; 231
	i32 186, ; 232
	i32 30, ; 233
	i32 137, ; 234
	i32 91, ; 235
	i32 92, ; 236
	i32 332, ; 237
	i32 48, ; 238
	i32 140, ; 239
	i32 111, ; 240
	i32 139, ; 241
	i32 250, ; 242
	i32 114, ; 243
	i32 298, ; 244
	i32 212, ; 245
	i32 156, ; 246
	i32 341, ; 247
	i32 75, ; 248
	i32 78, ; 249
	i32 270, ; 250
	i32 36, ; 251
	i32 216, ; 252
	i32 292, ; 253
	i32 254, ; 254
	i32 247, ; 255
	i32 63, ; 256
	i32 137, ; 257
	i32 15, ; 258
	i32 115, ; 259
	i32 286, ; 260
	i32 295, ; 261
	i32 242, ; 262
	i32 211, ; 263
	i32 47, ; 264
	i32 69, ; 265
	i32 79, ; 266
	i32 125, ; 267
	i32 188, ; 268
	i32 93, ; 269
	i32 120, ; 270
	i32 302, ; 271
	i32 26, ; 272
	i32 263, ; 273
	i32 96, ; 274
	i32 27, ; 275
	i32 238, ; 276
	i32 330, ; 277
	i32 308, ; 278
	i32 148, ; 279
	i32 168, ; 280
	i32 4, ; 281
	i32 97, ; 282
	i32 32, ; 283
	i32 92, ; 284
	i32 285, ; 285
	i32 197, ; 286
	i32 21, ; 287
	i32 40, ; 288
	i32 169, ; 289
	i32 324, ; 290
	i32 256, ; 291
	i32 316, ; 292
	i32 270, ; 293
	i32 301, ; 294
	i32 295, ; 295
	i32 275, ; 296
	i32 2, ; 297
	i32 133, ; 298
	i32 110, ; 299
	i32 343, ; 300
	i32 198, ; 301
	i32 179, ; 302
	i32 336, ; 303
	i32 225, ; 304
	i32 333, ; 305
	i32 57, ; 306
	i32 94, ; 307
	i32 315, ; 308
	i32 38, ; 309
	i32 236, ; 310
	i32 343, ; 311
	i32 25, ; 312
	i32 93, ; 313
	i32 88, ; 314
	i32 98, ; 315
	i32 10, ; 316
	i32 0, ; 317
	i32 86, ; 318
	i32 183, ; 319
	i32 99, ; 320
	i32 282, ; 321
	i32 193, ; 322
	i32 302, ; 323
	i32 227, ; 324
	i32 190, ; 325
	i32 312, ; 326
	i32 7, ; 327
	i32 267, ; 328
	i32 307, ; 329
	i32 224, ; 330
	i32 87, ; 331
	i32 262, ; 332
	i32 153, ; 333
	i32 311, ; 334
	i32 32, ; 335
	i32 115, ; 336
	i32 81, ; 337
	i32 20, ; 338
	i32 11, ; 339
	i32 161, ; 340
	i32 3, ; 341
	i32 205, ; 342
	i32 319, ; 343
	i32 200, ; 344
	i32 182, ; 345
	i32 198, ; 346
	i32 83, ; 347
	i32 306, ; 348
	i32 63, ; 349
	i32 321, ; 350
	i32 289, ; 351
	i32 142, ; 352
	i32 271, ; 353
	i32 156, ; 354
	i32 188, ; 355
	i32 40, ; 356
	i32 116, ; 357
	i32 194, ; 358
	i32 226, ; 359
	i32 315, ; 360
	i32 278, ; 361
	i32 130, ; 362
	i32 74, ; 363
	i32 65, ; 364
	i32 325, ; 365
	i32 171, ; 366
	i32 230, ; 367
	i32 142, ; 368
	i32 174, ; 369
	i32 105, ; 370
	i32 150, ; 371
	i32 69, ; 372
	i32 218, ; 373
	i32 155, ; 374
	i32 193, ; 375
	i32 120, ; 376
	i32 126, ; 377
	i32 320, ; 378
	i32 151, ; 379
	i32 253, ; 380
	i32 342, ; 381
	i32 140, ; 382
	i32 240, ; 383
	i32 317, ; 384
	i32 20, ; 385
	i32 14, ; 386
	i32 190, ; 387
	i32 134, ; 388
	i32 74, ; 389
	i32 58, ; 390
	i32 243, ; 391
	i32 166, ; 392
	i32 167, ; 393
	i32 203, ; 394
	i32 15, ; 395
	i32 73, ; 396
	i32 6, ; 397
	i32 23, ; 398
	i32 265, ; 399
	i32 217, ; 400
	i32 224, ; 401
	i32 219, ; 402
	i32 90, ; 403
	i32 318, ; 404
	i32 1, ; 405
	i32 135, ; 406
	i32 179, ; 407
	i32 266, ; 408
	i32 288, ; 409
	i32 133, ; 410
	i32 68, ; 411
	i32 145, ; 412
	i32 327, ; 413
	i32 220, ; 414
	i32 306, ; 415
	i32 219, ; 416
	i32 257, ; 417
	i32 199, ; 418
	i32 87, ; 419
	i32 95, ; 420
	i32 247, ; 421
	i32 252, ; 422
	i32 218, ; 423
	i32 322, ; 424
	i32 30, ; 425
	i32 44, ; 426
	i32 261, ; 427
	i32 226, ; 428
	i32 108, ; 429
	i32 157, ; 430
	i32 34, ; 431
	i32 22, ; 432
	i32 113, ; 433
	i32 56, ; 434
	i32 286, ; 435
	i32 143, ; 436
	i32 117, ; 437
	i32 119, ; 438
	i32 109, ; 439
	i32 228, ; 440
	i32 138, ; 441
	i32 234, ; 442
	i32 53, ; 443
	i32 104, ; 444
	i32 328, ; 445
	i32 211, ; 446
	i32 204, ; 447
	i32 205, ; 448
	i32 132, ; 449
	i32 300, ; 450
	i32 291, ; 451
	i32 279, ; 452
	i32 334, ; 453
	i32 257, ; 454
	i32 215, ; 455
	i32 207, ; 456
	i32 158, ; 457
	i32 313, ; 458
	i32 244, ; 459
	i32 162, ; 460
	i32 131, ; 461
	i32 279, ; 462
	i32 160, ; 463
	i32 326, ; 464
	i32 268, ; 465
	i32 184, ; 466
	i32 139, ; 467
	i32 291, ; 468
	i32 287, ; 469
	i32 168, ; 470
	i32 206, ; 471
	i32 229, ; 472
	i32 296, ; 473
	i32 39, ; 474
	i32 255, ; 475
	i32 80, ; 476
	i32 55, ; 477
	i32 36, ; 478
	i32 96, ; 479
	i32 165, ; 480
	i32 171, ; 481
	i32 215, ; 482
	i32 292, ; 483
	i32 81, ; 484
	i32 231, ; 485
	i32 97, ; 486
	i32 29, ; 487
	i32 158, ; 488
	i32 18, ; 489
	i32 126, ; 490
	i32 118, ; 491
	i32 251, ; 492
	i32 282, ; 493
	i32 264, ; 494
	i32 284, ; 495
	i32 164, ; 496
	i32 259, ; 497
	i32 344, ; 498
	i32 281, ; 499
	i32 272, ; 500
	i32 169, ; 501
	i32 16, ; 502
	i32 191, ; 503
	i32 143, ; 504
	i32 319, ; 505
	i32 124, ; 506
	i32 117, ; 507
	i32 37, ; 508
	i32 114, ; 509
	i32 46, ; 510
	i32 141, ; 511
	i32 116, ; 512
	i32 212, ; 513
	i32 33, ; 514
	i32 175, ; 515
	i32 94, ; 516
	i32 52, ; 517
	i32 273, ; 518
	i32 128, ; 519
	i32 152, ; 520
	i32 191, ; 521
	i32 24, ; 522
	i32 160, ; 523
	i32 250, ; 524
	i32 147, ; 525
	i32 103, ; 526
	i32 88, ; 527
	i32 238, ; 528
	i32 59, ; 529
	i32 141, ; 530
	i32 99, ; 531
	i32 177, ; 532
	i32 5, ; 533
	i32 13, ; 534
	i32 121, ; 535
	i32 134, ; 536
	i32 27, ; 537
	i32 314, ; 538
	i32 71, ; 539
	i32 248, ; 540
	i32 24, ; 541
	i32 213, ; 542
	i32 236, ; 543
	i32 277, ; 544
	i32 274, ; 545
	i32 331, ; 546
	i32 136, ; 547
	i32 229, ; 548
	i32 245, ; 549
	i32 167, ; 550
	i32 278, ; 551
	i32 310, ; 552
	i32 100, ; 553
	i32 122, ; 554
	i32 249, ; 555
	i32 195, ; 556
	i32 162, ; 557
	i32 166, ; 558
	i32 252, ; 559
	i32 38, ; 560
	i32 202, ; 561
	i32 180, ; 562
	i32 318, ; 563
	i32 217, ; 564
	i32 17, ; 565
	i32 216, ; 566
	i32 170, ; 567
	i32 331, ; 568
	i32 330, ; 569
	i32 136, ; 570
	i32 149, ; 571
	i32 241, ; 572
	i32 154, ; 573
	i32 129, ; 574
	i32 19, ; 575
	i32 64, ; 576
	i32 146, ; 577
	i32 46, ; 578
	i32 338, ; 579
	i32 227, ; 580
	i32 78, ; 581
	i32 60, ; 582
	i32 105, ; 583
	i32 276, ; 584
	i32 231, ; 585
	i32 48, ; 586
	i32 262, ; 587
	i32 335, ; 588
	i32 273, ; 589
	i32 14, ; 590
	i32 194, ; 591
	i32 67, ; 592
	i32 170, ; 593
	i32 341, ; 594
	i32 237, ; 595
	i32 241, ; 596
	i32 340, ; 597
	i32 77, ; 598
	i32 246, ; 599
	i32 178, ; 600
	i32 107, ; 601
	i32 230, ; 602
	i32 272, ; 603
	i32 66, ; 604
	i32 62, ; 605
	i32 222, ; 606
	i32 159, ; 607
	i32 239, ; 608
	i32 10, ; 609
	i32 176, ; 610
	i32 172, ; 611
	i32 202, ; 612
	i32 11, ; 613
	i32 77, ; 614
	i32 125, ; 615
	i32 82, ; 616
	i32 196, ; 617
	i32 65, ; 618
	i32 106, ; 619
	i32 64, ; 620
	i32 127, ; 621
	i32 121, ; 622
	i32 76, ; 623
	i32 287, ; 624
	i32 277, ; 625
	i32 339, ; 626
	i32 8, ; 627
	i32 245, ; 628
	i32 2, ; 629
	i32 43, ; 630
	i32 290, ; 631
	i32 155, ; 632
	i32 127, ; 633
	i32 275, ; 634
	i32 223, ; 635
	i32 23, ; 636
	i32 210, ; 637
	i32 221, ; 638
	i32 132, ; 639
	i32 233, ; 640
	i32 264, ; 641
	i32 334, ; 642
	i32 316, ; 643
	i32 28, ; 644
	i32 176, ; 645
	i32 172, ; 646
	i32 232, ; 647
	i32 181, ; 648
	i32 61, ; 649
	i32 204, ; 650
	i32 89, ; 651
	i32 214, ; 652
	i32 86, ; 653
	i32 147, ; 654
	i32 183, ; 655
	i32 206, ; 656
	i32 35, ; 657
	i32 85, ; 658
	i32 253, ; 659
	i32 192, ; 660
	i32 329, ; 661
	i32 324, ; 662
	i32 195, ; 663
	i32 49, ; 664
	i32 6, ; 665
	i32 210, ; 666
	i32 89, ; 667
	i32 185, ; 668
	i32 336, ; 669
	i32 21, ; 670
	i32 161, ; 671
	i32 95, ; 672
	i32 49, ; 673
	i32 112, ; 674
	i32 269, ; 675
	i32 342, ; 676
	i32 129, ; 677
	i32 182, ; 678
	i32 75, ; 679
	i32 222, ; 680
	i32 0, ; 681
	i32 246, ; 682
	i32 268, ; 683
	i32 7, ; 684
	i32 203, ; 685
	i32 173, ; 686
	i32 109, ; 687
	i32 269, ; 688
	i32 255 ; 689
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ a8cd27e430e55df3e3c1e3a43d35c11d9512a2db"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
