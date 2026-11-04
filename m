Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BC8606A326
	for <linux-firmware@archiver.kernel.org>; Wed,  4 Nov 2026 02:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=EDTtbSLs
Received: by smtp.kernel.org (Postfix)
	id 696A91F0093A; Wed,  4 Nov 2026 02:36:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793759797;
	b=DIQtn+k+xYPTMfzG5bGJpa5Dt4hZLsBd8Nvrwup52jkVkAvH+dl9jMJv4qCLPqZVW/eD
	 9opH2lCLVOvoHgbqEi2d3AlflMBmP3esc4ggoX1X6AKUOiy/k8JAe3am61f0iYg+vA3BY
	 CD/Zs5MUKxMGenelJAZAHTyNKSmUQI+JqDMx7VeGr3AGuhdsHL87lfNjwO4drGrav+TIG
	 NqDUuAsGDDJnZjiUg5/5fHd5zf2VZNLEtpfYCb3huafeHfT5yHQexMbW1FFliH9R6NTJV
	 jEspaSg7NdXEdhg5S9fu9xs/1Aqd1Bt320VB9vwsLVKTn3LwDrF1jkQNIOoEVrRiFMg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793759797;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:List-Id:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=XdufrmI0ixN7799ghtar1fWU6dowWAWeH8b9RrzsoOY=;
	b=geaapZFmo0HadZg4XoLVcC6vY02lmy4h+Dxsz5hiaTXgkawGSIPqWh4PlW/J8qxjkb+v
	 RjuKJz0uwwPyImPa6SyWOy8c6iSqhF1ABEWBJnh0UX/56TLCu1X1UCF2F4djr//wd1XyG
	 +h4cp5cPSddX8Z5C93Z9gP8SGPiWp14bk9bWoXRV7ZOI0cuRnRt3mMgamZ7kY/eYHLgaZ
	 E1QPXSWYaAS2xRQpHL/8P44jaHa+t8CQx6zWOdnMR8/Lms2rugIQfEWlapeUaU8iqLqRM
	 iWH6GsQHWUduD58s40iKemOnYYCA3DEyvy491td6/oWQZ3+9TaRZkbtI1b2oXmsn6bQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=EDTtbSLs;
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EF3971F000C1
	for <linux-firmware@kernel.org>; Wed,  4 Nov 2026 02:36:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=EDTtbSLs
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org EF3971F000C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6A42aNzpD3626910, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1793759793; bh=XdufrmI0ixN7799ghtar1fWU6dowWAWeH8b9RrzsoOY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=EDTtbSLsHuu5wvdcMZKs0mI+hX2pmWi5TbkN4ryVXqk9UsAfW5wmyL0MA5bp5J7vF
	 OXp7wle3qYhfA6neBmHlg+Wp6g90vTEAQOOUN9AU/SOzGioBiVogGwbIeaRhG+lJZo
	 VCzbaIUFeJF8bJ9rF0R5WtBO9EHE+Tgpg6hhPgLUCXNYIuS3d5oWCsuaGY0WCrD/eN
	 diu/c27xg0rgQnkvSB7mvC5AJz9GncwvDltu263rVWWEiQpSCqtZEYODDHemmwHxMF
	 YR4HhEz3uxU+F62FHU5T34o8BXFvIufGQnuBvauDOw1tb1pvstmyDsWeR90zEutqk9
	 /+kKVmfa3lCvA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6A42aNzpD3626910
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <linux-firmware@kernel.org>; Wed, 4 Nov 2026 10:36:33 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 10:36:04 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 10:24:43 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 10:24:43 +0800
From: <jack.yu@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <shumingf@realtek.com>, <flove@realtek.com>, <oder_chiou@realtek.com>,
	<derek.fang@realtek.com>, Jack Yu <jack.yu@realtek.com>
Subject: [PATCH] realtek: rt1321: Add patch firmware of MCU for VA2
Date: Wed, 4 Nov 2026 10:24:38 +0800
Message-ID: <20261104022438.819737-1-jack.yu@realtek.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jack Yu <jack.yu@realtek.com>

This patch added the patch firmware of rt1321 VA2 MCU.
The version is v2.1.

Signed-off-by: Jack Yu <jack.yu@realtek.com>
---
 WHENCE                                   |   3 +++
 realtek/rt1320/rt1321-patch-code-va2.bin | Bin 0 -> 9344 bytes
 2 files changed, 3 insertions(+)
 create mode 100644 realtek/rt1320/rt1321-patch-code-va2.bin

diff --git a/WHENCE b/WHENCE
index 123a62be..50cbb2f8 100644
--- a/WHENCE
+++ b/WHENCE
@@ -3801,6 +3801,9 @@ Version: 1.0.0
 File: realtek/rt1320/rt1321-patch-code-va.bin
 Version: 1.10.0
 
+File: realtek/rt1320/rt1321-patch-code-va2.bin
+Version: 2.1.0
+
 Licence: Redistributable. See LICENSE.rt1320 for details.
 SPDX-License-Identifier: LicenseRef-LICENSE.rt1320
 
diff --git a/realtek/rt1320/rt1321-patch-code-va2.bin b/realtek/rt1320/rt1321-patch-code-va2.bin
new file mode 100644
index 0000000000000000000000000000000000000000..61732ec4e4199d5f70128b92c23bd600beb6d857
GIT binary patch
literal 9344
zcmV-`B!AlkfB+B^00005fB+B&00006fB+C600007fB+Bx00008fB+C900009fB+DW
z0000AfB+EZ0000BfB+Ew0000CfB+B^0000DfB+B&0000EfB+B>0000FfB+Bx0000G
zfB+Dq0000HfB+DW0000IfB+EZ0000JfB+Ew0000KfB+CT0000LfB+DO0000MfB+Bx
z0000NfB+B>0000OfB+D;0000PfB+EZ0000QfB+Bx0000RfB+B>0000SfB+B^0000T
zfB+B&0000UfB+B&0000VfB+B(0000WfB+C90000XfB+Dx0000YfB+EZ0000ZfB+EW
z0000afB+CT0000bfB+DO0000cfB+Bx0000dfB+B>0000efB+B^0000ffB+B&0000g
zfB+E30000hfB+B>0000ifB+C90000jfB+Dr0000kfB+EZ0000lfB+Dp0000mfB+CT
z0000nfB+DO0000ofB+Bx0000pfB+B>0000qfB+B^0000rfB+B&0000sfB+Cj0000t
zfB+C20000ufB+C90000vfB+D#0000wfB+EZ0000xfB+Ec0000yfB+CT0000zfB+DO
z0000!fB+Bx0000#fB+B>0000$fB+B^0000%fB+B&0000&fB+E30000(fB+CO0000)
zfB+C90000*fB+Dv0000+fB+EZ0000-fB+Ew0000;fB+CT0000<fB+DO0000=fB+Bx
z0000>fB+B>0000?fB+B^0000@fB+B&0000^fB+B&0000_fB+Ca0000`fB+C90000{
zfB+D#0000|fB+EZ0000}fB+Dn0000~fB+C@00010fB+DH00011fB+Bx00012fB+Bx
z0001hfB+DK0001ifB+E30001jfB+ED0001kfB+Cu0001lfB+C<0001mfB+DJ0001n
zfB+B&0001ofB+B(0001pfB+DK0001qfB+E30001rfB+Ej0001sfB+Cv0001tfB+C<
z0001ufB+DV0001vfB+B&0001wfB+B%0001xfB+DK0001yfB+E30001zfB+ET0001!
zfB+Cv0001#fB+C<0001$fB+DR0001%fB+B&0001&fB+B%0001(fB+DK0001)fB+E3
z0001*fB+ED0001+fB+Cv0001-fB+C<0001;fB+DN0001<fB+B&0001=fB+B%0001>
zfB+DK0001?fB+E30001@fB+D|0001^fB+Cv0001_fB+C<0001`fB+DJ0001{fB+B&
z0001|fB+B%0001}fB+DK0001~fB+E300020fB+CN00021fB+Cc00022fB+C<00023
zfB+Dl00024fB+B&00025fB+B#00026fB+B^00027fB+By00028fB+By00029fB+Ex
z0002AfB+C90002BfB+CA0002CfB+DI0002DfB+Bx0002EfB+B!0002FfB+E30002G
zfB+DY0002HfB+Cx0002IfB+C90002JfB+CC0002KfB+B?0002LfB+Bx0002MfB+Da
z0002NfB+B&0002OfB+B>0002PfB+Bx0002QfB+C<0002RfB+C00002SfB+Ep0002T
zfB+Bz0002UfB+D;0002VfB+EZ0002WfB+D}0002XfB+Cb0002YfB+Da0002ZfB+DO
z0002afB+B&0002bfB+Eu0002cfB+DK0002dfB+Du0002efB+Cj0002ffB+Bx0002g
zfB+Da0002hfB+Ep0002ifB+B|0002jfB+Bx0002kfB+C<0002lfB+DX0002mfB+EZ
z0002nfB+Bz0002ofB+D;0002pfB+EJ0002qfB+Bx0002rfB+Bx0002sfB+DK0002t
zfB+E30002ufB+B&0002vfB+Cj0002wfB+Da0002xfB+Ep0002yfB+B&0002zfB+Bz
z0002!fB+C<0002#fB+DP0002$fB+B&0002%fB+Bx0002&fB+Eh0002(fB+DX0002)
zfB+EB0002*fB+Dj0002+fB+Da0002-fB+B&0002;fB+C60002<fB+Bx0002=fB+Dq
z0002>fB+DT0002?fB+Ej0002@fB+Cw0002^fB+DK0002_fB+C60002`fB+D|0002{
zfB+Bx0002|fB+B!0002}fB+CA0002~fB+DI00030fB+Bx00000fdCK_00001fdCKz
z00002fdCKz00003fdCKz00004fdCL^00005fdCMI00006fdCKy00007fdCKy00008
zfdCL^00009fdCMI0000AfdCKy0000BfdCKy0000CfdCML0000DfdCNK0000EfdCM}
z0000FfdCLu0000GfdCMb0000HfdCNq0000IfdCLE0000JfdCKy0000KfdCL=0000L
zfdCMO0000MfdCK(0000NfdCK)0000OfdCML0000PfdCN40000QfdCLu0000RfdCLv
z0000SfdCK_0000TfdCKz0000UfdCKz0000VfdCNy0000WfdCLA0000XfdCLD0000Y
zfdCK@0000ZfdCKy0000afdCMb0000bfdCMP0000cfdCK}0000dfdCKy0000efdCMr
z0000ffdCMK0000gfdCNk0000hfdCLv0000ifdCM<0000jfdCNK0000kfdCKy0000l
zfdCKy0000mfdCML0000nfdCN40000ofdCK(0000pfdCLk0000qfdCMb0000rfdCNq
z0000sfdCK(0000tfdCK!0000ufdCL=0000vfdCMS0000wfdCK(0000xfdCKy0000y
zfdCK_0000zfdCK(0000!fdCL70000#fdCKy0000$fdCK_0000%fdCK%0000&fdCK?
z0000(fdCKy0000)fdCMr0000*fdCMU0000+fdCNU0000-fdCLx0000;fdCNi0000<
zfdCMI0000=fdCNS0000>fdCNk0000?fdCNi0000@fdCMo0000^fdCNC0000_fdCM+
z0000`fdCML0000{fdCN40000|fdCK@0000}fdCL{0000~fdCK_00010fdCK(00011
zfdCLN00012fdCKy00013fdCL=00014fdCMk00015fdCNa00016fdCKy00017fdCK#
z00018fdCN400019fdCKz0001AfdCL{0001BfdCL=0001CfdCK~0001DfdCNq0001E
zfdCKy0001FfdCML0001GfdCN40001HfdCM}0001IfdCLv0001JfdCL=0001KfdCMM
z0001LfdCK(0001MfdCKy0001NfdCNi0001OfdCMo0001PfdCNS0001QfdCMs0001R
zfdCNi0001SfdCMo0001TfdCNS0001UfdCMz0001VfdCLU0001WfdCNK0001XfdCKy
z0001YfdCKy0001ZfdCML0001afdCL!0001bfdCK(0001cfdCLx0001dfdCML0001e
zfdCL70001ffdCM}0001gfdCKy0001hfdCMb0001ifdCMf0001jfdCK(0001kfdCKz
z0001lfdCMb0001mfdCNK0001nfdCK(0001ofdCKz0001pfdCMb0001qfdCNq0001r
zfdCNK0001sfdCNy0001tfdCMb0001ufdCMf0001vfdCK(0001wfdCKz0001xfdCMb
z0001yfdCNK0001zfdCK(0001!fdCKz0001#fdCLA0001$fdCK?0001%fdCNq0001&
zfdCLx0001(fdCK_0001)fdCKz0001*fdCKz0001+fdCKz0001-fdCL^0001;fdCMI
z0001<fdCKy0001=fdCKy0001>fdCLU0001?fdCNK0001@fdCKy0001^fdCKy0001_
zfdCML0001`fdCL!0001{fdCK(0001|fdCLx0001}fdCMb0001~fdCMf00020fdCK(
z00021fdCKz00022fdCMb00023fdCNK00024fdCK(00025fdCKz00026fdCMb00027
zfdCNq00028fdCNK00029fdCNy0002AfdCMb0002BfdCMf0002CfdCK(0002DfdCKz
z0002EfdCMb0002FfdCNK0002GfdCK(0002HfdCKz0002IfdCLA0002JfdCK?0002K
zfdCNq0002LfdCLx0002MfdCL^0002NfdCMI0002OfdCKy0002PfdCKy0002QfdCML
z0002RfdCN40002SfdCNE0002TfdCLw0002UfdCL=0002VfdCMK0002WfdCK(0002X
zfdCK!0002YfdCML0002ZfdCN40002afdCM}0002bfdCLw0002cfdCL=0002dfdCMW
z0002efdCK(0002ffdCKy0002gfdCML0002hfdCN40002ifdCNk0002jfdCLw0002k
zfdCL=0002lfdCMS0002mfdCK(0002nfdCKy0002ofdCML0002pfdCN40002qfdCNU
z0002rfdCLw0002sfdCL=0002tfdCMO0002ufdCK(0002vfdCKy0002wfdCML0002x
zfdCN40002yfdCLO0002zfdCLd0002!fdCL=0002#fdCMI0002$fdCK(0002%fdCK`
z0002&fdCML0002(fdCN40002)fdCMJ0002*fdCLv0002+fdCL=0002-fdCMU0002;
zfdCK(0002<fdCK^0002=fdCML0002>fdCN40002?fdCNE0002@fdCLv0002^fdCL=
z0002_fdCMQ0002`fdCK(0002{fdCK^0002|fdCML0002}fdCN40002~fdCM(00030
zfdCLv00000f&dU>00001f&dVN00002f&dT)00003f&dT_00004f&dT$00005f&dW5
z00006f&dVa00007f&dUz00008f&dT`00009f&dT!0000Af&dT!0000Bf&dWz0000C
zf&dUB0000Df&dUA0000Ef&dVa0000Ff&dTz0000Gf&dUB0000Hf&dUE0000If&dT^
z0000Jf&dTz0000Kf&dUB0000Lf&dUC0000Mf&dVK0000Nf&dTz0000Of&dVc0000P
zf&dT(0000Qf&dU80000Rf&dTz0000Sf&dVc0000Tf&dVN0000Uf&dT)0000Vf&dTz
z0000Wf&dU>0000Xf&dT{0000Yf&dWL0000Zf&dT>0000af&dV=0000bf&dWL0000c
zf&dTz0000df&dTz0000ef&dVM0000ff&dW50000gf&dT)0000hf&dUl0000if&dVc
z0000jf&dWr0000kf&dT)0000lf&dT#0000mf&dU>0000nf&dVL0000of&dT)0000p
zf&dT>0000qf&dWj0000rf&dVJ0000sf&dU-0000tf&dWY0000uf&dU>0000vf&dT>
z0000wf&dT&0000xf&dT<0000yf&dUV0000zf&dWY0000!f&dW00000#f&dUd0000$
zf&dVM0000%f&dUF0000&f&dT%0000(f&dWw0000)f&dVc0000*f&dWL0000+f&dU_
z0000-f&dTz0000;f&dVc0000<f&dWr0000=f&dT~0000>f&dTz0000?f&dU>0000@
zf&dVR0000^f&dT)0000_f&dT%0000`f&dT`0000{f&dT&0000|f&dTz0000}f&dTz
z0000~f&dWj00010f&dVJ00011f&dU700012f&dWV00013f&dT`00014f&dT&00015
zf&dUe00016f&dU700017f&dVc00018f&dT&00019f&dTz0001Af&dTz0001Bf&dWj
z0001Cf&dWU0001Df&dWD0001Ef&dWV0001Ff&dVM0001Gf&dUF0001Hf&dT%0001I
zf&dWw0001Jf&dT`0001Kf&dT&0001Lf&dUe0001Mf&dU70001Nf&dVc0001Of&dT&
z0001Pf&dTz0001Qf&dTz0001Rf&dVc0001Sf&dWr0001Tf&dWr0001Uf&dWr0001V
zf&dUB0001Wf&dU80001Xf&dWo0001Yf&dWw0001Zf&dVM0001af&dUF0001bf&dT%
z0001cf&dWw0001df&dVc0001ef&dWr0001ff&dWr0001gf&dWv0001hf&dUB0001i
zf&dU80001jf&dWo0001kf&dWw0001lf&dWj0001mf&dWU0001nf&dVY0001of&dWT
z0001pf&dUV0001qf&dWr0001rf&dTz0001sf&dTz0001tf&dVM0001uf&dUl0001v
zf&dU#0001wf&dT!0001xf&dVc0001yf&dWr0001zf&dWr0001!f&dT?0001#f&dVc
z0001$f&dWb0001%f&dUF0001&f&dTz0001(f&dVs0001)f&dT-0001*f&dWr0001+
zf&dTz0001-f&dUV0001;f&dUl0001<f&dT?0001=f&dTz0001>f&dUV0001?f&dWa
z0001@f&dW00001^f&dUd0001_f&dVc0001`f&dT&0001{f&dT@0001|f&dTz0001}
zf&dV=0001~f&dWK00020f&dTz00021f&dT@00022f&dT`00023f&dT)00024f&dWr
z00025f&dUB00026f&dVM00027f&dUF00028f&dUk00029f&dWw0002Af&dVc0002B
zf&dWL0002Cf&dT~0002Df&dTz0002Ef&dVc0002Ff&dWr0002Gf&dT~0002Hf&dTz
z0002If&dU>0002Jf&dVf0002Kf&dV=0002Lf&dTz0002Mf&dVM0002Nf&dVw0002O
zf&dUk0002Pf&dWz0002Qf&dU>0002Rf&dVD0002Sf&dWr0002Tf&dT#0002Uf&dV=
z0002Vf&dWL0002Wf&dTz0002Xf&dT@0002Yf&dT$0002Zf&dVw0002af&dUl0002b
zf&dWz0002cf&dV=0002df&dUl0002ef&dT?0002ff&dTz0002gf&dVc0002hf&dVQ
z0002if&dWr0002jf&dUB0002kf&dU>0002lf&dWi0002mf&dWb0002nf&dT#0002o
zf&dT$0002pf&dUC0002qf&dVK0002rf&dTz0002sf&dVc0002tf&dT)0002uf&dT@
z0002vf&dTz0002wf&dVM0002xf&dU80002yf&dV~0002zf&dTz0002!f&dVs0002#
zf&dVV0002$f&dWl0002%f&dUy0002&f&dVM0002(f&dUC0002)f&dUf0002*f&dTz
z0002+f&dT`0002-f&dT!0002;f&dT!0002<f&dT!0002=f&dV20002>f&dVJ0002?
zf&dU-0002@f&dWl0002^f&dVM0002_f&dVw0002`f&dUk0002{f&dWz0002|f&dVc
z0002}f&dVQ0002~f&dT~00030f&dTz00000g8&dC00001g8&e!00002g8&fr00003
zg8&fz00004g8&e300005g8&fl00006g8&fU00007g8&fv00008g8&d?00009g8&c~
z0000Ag8&c*0000Bg8&c!0000Cg8&c{0000Dg8&c*0000Eg8&c^0000Fg8&c!0000G
zg8&et0000Hg8&eW0000Ig8&fW0000Jg8&dz0000Kg8&eN0000Lg8&d90000Mg8&f0
z0000Ng8&c!0000Og8&c%0000Pg8&dD0000Qg8&eL0000Rg8&c!0000Sg8&eN0000T
zg8&dD0000Ug8&dg0000Vg8&c!0000Wg8&c{0000Xg8&c#0000Yg8&c#0000Zg8&c#
z0000ag8&d`0000bg8&eK0000cg8&c!0000dg8&c!0000eg8&d`0000fg8&eK0000g
zg8&c!0000hg8&c!0000ig8&c{0000jg8&c#0000kg8&c#0000lg8&f!0000mg8&dC
z0000ng8&dD0000og8&eL0000pg8&c!0000qg8&dC0000rg8&eQ0000sg8&c#0000t
zg8&df0000ug8&dC0000vg8&dF0000wg8&c_0000xg8&c!0000yg8&e>0000zg8&c)
z0000!g8&c!0000#g8&c_0000$g8&c%0000%g8&f60000&g8&c)0000(g8&dA0000)
zg8&c%0000*g8&f50000+g8&dw0000-g8&d}0000;g8&c{0000<g8&eO0000=g8&c*
z0000>g8&c!0000?g8&c{0000@g8&eB0000^g8&fs0000_g8&c@0000`g8&d?0000{
zg8&d30000|g8&fb0000}g8&c!0000~g8&eN00010g8&f600011g8&eQ00012g8&dA
z00013g8&c%00014g8&f600015g8&dg00016g8&d}00017g8&ed00018g8&fs00019
zg8&fs0001Ag8&c@0001Bg8&d?0001Cg8&c+0001Dg8&fs0001Eg8&c)0001Fg8&e>
z0001Gg8&f60001Hg8&c!0001Ig8&c!0001Jg8&eN0001Kg8&f60001Lg8&c*0001M
zg8&d#0001Ng8&c{0001Og8&c*0001Pg8&e40001Qg8&c#0001Rg8&ed0001Sg8&fs
z0001Tg8&fs0001Ug8&c@0001Vg8&d?0001Wg8&eI0001Xg8&fs0001Yg8&c&0001Z
zg8&e>0001ag8&fc0001bg8&f10001cg8&de0001dg8&ed0001eg8&eR0001fg8&c*
z0001gg8&fx0001hg8&eN0001ig8&ex0001jg8&dm0001kg8&c!0001lg8&ed0001m
zg8&fs0001ng8&d00001og8&c!0001pg8&d?0001qg8&eO0001rg8&c*0001sg8&c&
z0001tg8&e>0001ug8&fM0001vg8&c!0001wg8&c!0001xg8&eN0001yg8&f40001z
zg8&ex0001!g8&dm0001#g8&ed0001$g8&fs0001%g8&fq0001&g8&c@0001(g8&ed
z0001)g8&ef0001*g8&d$0001+g8&c!0001-g8&e-0001;g8&eP0001<g8&fq0001=
zg8&df0001>g8&ed0001?g8&ef0001@g8&dE0001^g8&c!0001_g8&e-0001`g8&eP
z0001{g8&fq0001|g8&c!0001}g8&c{0001~g8&ef00020g8&dU00021g8&c!00022
zg8&ed00023g8&fK00024g8&fq00025g8&dg00026g8&fk00027g8&fV00028g8&fE
z00029g8&fB0002Ag8&c%0002Bg8&eP0002Cg8&dw0002Dg8&d}0002Eg8&fk0002F
zg8&eq0002Gg8&ep0002Hg8&ft0002Ig8&c%0002Jg8&dD0002Kg8&eL0002Lg8&c!
z0002Mg8&eN0002Ng8&d90002Og8&f00002Pg8&c!0002Qg8&c%0002Rg8&eP0002S
zg8&dg0002Tg8&d}0002Ug8&c{0002Vg8&c#0002Wg8&c#0002Xg8&c#0002Yg8&e3
z0002Zg8&eq0002ag8&ep0002bg8&fx0002cg8&eN0002dg8&d90002eg8&f00002f
zg8&c!0002gg8&c%0002hg8&dD0002ig8&eL0002jg8&c!0002kg8&c{0002lg8&c#
z0002mg8&c#0002ng8&c#0002og8&d`0002pg8&eK0002qg8&c!0002rg8&c!0002s
zg8&e>0002tg8&f60002ug8&c!0002vg8&c!0002wg8&eN0002xg8&f60002yg8&c*
z0002zg8&d#0002!g8&ed0002#g8&fs0002$g8&dW0002%g8&c!0002&g8&d?0002(
zg8&eQ0002)g8&c*0002*g8&c=0002+g8&c{0002-g8&c#0002;g8&c#0002<g8&f!
z0002=g8&dC0002>g8&dD0002?g8&eL0002@g8&c!0002^g8&dC0002_g8&dF0002`
zg8&c_0002{g8&c!0002|g8&dC0002}g8&dB0002~g8&eb00030g8&c!00000ga8mX
z00001ga8oK00002ga8l#00003ga8l#00004ga8nO00005ga8mn00006ga8l}00007
zga8mn00008ga8ne00009ga8ot0000Aga8mH0000Bga8l#0000Cga8m@0000Dga8nX
z0000Ega8l+0000Fga8l(0000Gga8n?0000Hga8oK0000Iga8l#0000Jga8l_0000K
zga8nO0000Lga8o70000Mga8l(0000Nga8o#0000Oga8ne0000Pga8ot0000Qga8ot
z0000Rga8l^0000Sga8m@0000Tga8np0000Uga8l+0000Vga8l(0000Wga8ne0000X
zga8l+0000Yga8l_0000Zga8l#0000aga8mD0000bga8nT0000cga8oq0000dga8o!
z0000ega8ne0000fga8l)0000gga8l_0000hga8l#0000iga8l|0000jga8l)0000k
zga8mA0000lga8l_0000mga8ol0000nga8nb0000oga8m<0000pga8n>0000qga8mX
z0000rga8l)0000sga8l$0000tga8l#0000uga8ne0000vga8l)0000wga8l#0000x
zga8l$0000yga8l|0000zga8l)0000!ga8n=0000#ga8nr0000$ga8ol0000%ga8nb
z0000&ga8m<0000(ga8n=0000)ga8nO0000*ga8mn0000+ga8mE0000-ga8oW0000;
zga8ne0000<ga8od0000=ga8l+0000>ga8ou0000?ga8ne0000@ga8ot0000^ga8ot
z0000_ga8l^0000`ga8mD0000{ga8l$0000|ga8oq0000}ga8oW0000~ga8nO00010
zga8mn00011ga8mE00012ga8oW00013ga8ne00014ga8ot00015ga8ot00016ga8l^
z00017ga8ne00018ga8od00019ga8l+0001Aga8l(0001Bga8mD0001Cga8l$0001D
zga8oq0001Ega8oW0001Fga8nO0001Gga8mA0001Hga8o10001Iga8l#0001Jga8l&
z0001Kga8mE0001Lga8nM0001Mga8l#0001Nga8nO0001Oga8mE0001Pga8mh0001Q
zga8l#0001Rga8l|0001Sga8l$0001Tga8l$0001Uga8l$0001Vga8m{0001Wga8nL
z0001Xga8l#0001Yga8l#0001Zga8nO0001aga8mn0001bga8mU0001cga8oW0001d
zga8ne0001ega8ot0001fga8l+0001gga8l%0001hga8oZ0001iga8nd0001jga8l+
z0001kga8o!0001lga8nO0001mga8o70001nga8l(0001oga8o#0001pga8l|0001q
zga8l+0001rga8l_0001sga8l#0001tga8ne0001uga8ot0001vga8ot0001wga8l^
z0001xga8oZ0001yga8nl0001zga8od0001!ga8oy0001#ga8mX0001$ga8l)0001%
zga8l$0001&ga8l#0001(ga8ne0001)ga8l)0001*ga8l#0001+ga8l#0001-ga8l|
z0001;ga8l)0001<ga8n=0001=ga8nr0001>ga8ol0001?ga8nb0001@ga8m<0001^
zga8n)0001_ga8nO0001`ga8mn0001{ga8l}0001|ga8mn0001}ga8ne0001~ga8ot
z00020ga8oN00021ga8l^00022ga8nu00023ga8l-00024ga8oq00025ga8mm00026
zga8mD00027ga8nT00028ga8l(00029ga8o!0002Aga8n40002Bga8om0002Cga8m9
u0002Dga8ox0002Ega8m{0002Fga8nL0002Gga8l#0002Hga8l#0002w_Jg1R

literal 0
KcmV+b0RR6000031

-- 
2.55.0

