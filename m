Return-Path: <SRS0=YD0b=VK=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF9FC021AA
	for <linux-firmware@archiver.kernel.org>; Wed, 19 Feb 2025 16:56:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 45C0DC4CEDD; Wed, 19 Feb 2025 16:56:32 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D97CCC4CEE0
	for <linux-firmware@kernel.org>; Wed, 19 Feb 2025 16:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D97CCC4CEE0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30a2cdb2b98so37618431fa.0
        for <linux-firmware@kernel.org>; Wed, 19 Feb 2025 08:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739984189; x=1740588989; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H1kFmuo/o7GBU6OTauMbiDqaCjP0QWTTBKr8xUFPL34=;
        b=eEVLoQP9elUy0hxE3KZP94VGbSHX4ZGwXfjjSy09H5m6UlB8iNKGgQUbulCqOap3dg
         lZMFvwcmb5OPCtvt8hB9CB2CSriSVT/BDO0G8Xz0XvrvjiBm9OlaTexT5UawPAE7dviS
         z4fNuUA0kZ4kSUCxqhcch8lq2oft0n3I5vXQ+t+maBG1XpmMGpt1icl3v4bN+PA2DLvI
         OWFESANSQI3kZo5TUXdFuR1u0hFPZKy5S/3h29TcIadzKigI1BP583X4XlYtOJ0EN04R
         hqdVxcsRgIZeUTbYpVfneqYLiLc9CirgSjFa2l3I7tPcewEZV3keZ940ICRzTMI/wK/6
         K0Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739984189; x=1740588989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H1kFmuo/o7GBU6OTauMbiDqaCjP0QWTTBKr8xUFPL34=;
        b=iGZECdnia8oqoELxbgdu0X6WmYqaE4nFJj4TyWZi7k+9G1PacbcSysfebV8qDZo5rb
         vPxtnAAFgFMjWC2QYP0I5R9fCkBMRfzGshCwxb6xdYwwST8a9p1fxByzlhzqIigcafp5
         e2bFpsEAI4SlBsJo26BL4OEh5HA30F7rD2/dKvMS+HIaGJdhOfWDyLHJ+qtV0gfrGUcp
         PWF7cnyUXmeV3EQsPF0GkmeszxZHsoSuvvyVOSwnR9Kh5uGS0WJhU34aoB4KOWMI20eo
         aFkl5ZZSzYRaEx+gK0ILLSw9wXuc6nHeIDimAZDp5u/t5cEhumxLLNyBwdkzQO2MNZA2
         qcLA==
X-Gm-Message-State: AOJu0Yzewv+7CJu8frCKj/SJXrIJCOI0ZpQIeLKjD9gvBfiPsWH4aMT6
	ZyZ8VRry/y/0P+Sgp/6g+Fb3RJADWDY9SUeQb4zz2BePL0PDeFYJv74IFx7JS7pyain0JBkTt4x
	Q
X-Gm-Gg: ASbGncva358Tm/WLRLfnGKwP3G2UVlvBfAKY5TG9DaemmkuzYK3Hv977GxQR6pmB1tj
	0joeV8NEUN1F8aaaK91yx0czGv57FlOvvcImQGjV78w3Dvj8ZL3vOZ++B7JTx6o0N2Qp+oZtrWI
	L3OeDiokFEGd4Kw+NiTwSmq9skZAcHrKQrYOEcyquoC9IVA+paFiEWwvkgV+BDBLkfNQGleCTdA
	Ic1zsgAda71KBPs/7sr+mMGxzY0nElFXNuAGTPvVWDi2kQRLQpS/buqcdn/oCdZqkfqIGq11OK5
	xmw4EjnQEtG2xezKuB14IWBHzOHCOJXKMmXc3CFyvcLCEo7Zwy6OD4wN7X4=
X-Google-Smtp-Source: AGHT+IFvJcVUu4AaW40Mp3nKsfCIr4KsGkgGMiYPVggyY57JRet9oFJGjuTzqkgFMs/yva5LeWldTw==
X-Received: by 2002:a05:651c:4103:b0:30a:453d:a02b with SMTP id 38308e7fff4ca-30a453da1dcmr10460471fa.32.1739984188502;
        Wed, 19 Feb 2025 08:56:28 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30923bc174dsm18479151fa.84.2025.02.19.08.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 08:56:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Rob Clark <robdclark@gmail.com>
Subject: [PATCH] qcom: add firmware for Adreno A225
Date: Wed, 19 Feb 2025 18:56:26 +0200
Message-ID: <20250219165626.1508633-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add firmware files for Adreno A225 as present on some of older Qualcomm
Snapdragon chips. While MSM8960 is an old platform, there is a certain
community interest in supporting it.

Cc: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 WHENCE           |   2 ++
 qcom/a225_pfp.fw | Bin 0 -> 1156 bytes
 qcom/a225_pm4.fw | Bin 0 -> 9220 bytes
 3 files changed, 2 insertions(+)
 create mode 100644 qcom/a225_pfp.fw
 create mode 100644 qcom/a225_pm4.fw

diff --git a/WHENCE b/WHENCE
index 9be0c1fb30ee..afe5ff28dcb1 100644
--- a/WHENCE
+++ b/WHENCE
@@ -6369,6 +6369,8 @@ Licence: Redistributable. See LICENSE.sdma_firmware for details
 
 Driver: adreno - Qualcomm Adreno GPU firmware
 
+File: qcom/a225_pfp.fw
+File: qcom/a225_pm4.fw
 File: qcom/a300_pfp.fw
 Link: a300_pfp.fw -> qcom/a300_pfp.fw
 File: qcom/a300_pm4.fw
diff --git a/qcom/a225_pfp.fw b/qcom/a225_pfp.fw
new file mode 100644
index 0000000000000000000000000000000000000000..61ea24c4fa79d7e4b856e64bb9abbfe7839f3cf1
GIT binary patch
literal 1156
zcmaizOK4M35Qe|pn<lYMAwtC>eWXdXLSH_r78DG|MWHTQ@Uap>5#8&uEm!NJP*;+^
zRIoeU2)b~i3)6?OhTAq|(Y4^#rLOBgw@D49V!~w3`Oleu{+T%eeZmEXFHLB%$n@h0
zoRJhEya0DIzHkqht-#Y$;7oiC^7A{MDO$CU^8{iA8iW%sK%#*EbBwmUPaEsF-W<ji
zuJE|RjkjI<|HdlL^<<Tpsuqj2oUx|^M3lF!qRafCxTA`RSzM-4gVt7S^yLvcriv`D
z%+Qlqqu!gRId_V1<~fP`KB3Mq*-(kwGDq64jE;+AU3@PHy@_Z&E9uMfn^gOBLHUfk
zx;I_chhFhJxd9qjps!hL@i^W(Kg7Kvvzl6@t5sMv)^$ojZ|uB1re2FDX|+kG?X4b*
zvp%Hc+o|@_r@uw_q@$Yugz}SL2=ETiCz<g%C@tI3CDO{1l{r@jn0`NoKQoS#mp*ac
z5ng9A)7rQmS$#HF`AMBUoSX~t*bJ(=8!6Msj+VezdT_d_$YM%0efPPWU7$|hctXj@
zuFe&wygTErn)8#fBHNSmn6J$hO4je@J)pexvf4g0XdmB$rKK(C9UDP@>!0hE=&azT
z$*{DrqkFKduw#2LyB}x@AD5PL@aAdK8_4)XWWV*FaAK=^L#rI}a&!v|p*in!Ztv;q
z&^Xb2jwSikUt`3ywwRqf<p6VQFa~WN(Cuvowg0VutI~_9iVv>+^XIcvnaXdfzE0l_
z61?TG-bspn(wtW}uF=IkdU-&fdOb{%v%KOQ&vZJ=MM_-eBSXAngb$38SHu^tQ{)D(
NxydJP5tV}d><{(u39$eG

literal 0
HcmV?d00001

diff --git a/qcom/a225_pm4.fw b/qcom/a225_pm4.fw
new file mode 100644
index 0000000000000000000000000000000000000000..9805e797aaeb2345d8b213e85ee728b06373db6c
GIT binary patch
literal 9220
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
ZPw3k?{Q2?^%L@g&+x;)&WM#^?>)%o^9V!3-

literal 0
HcmV?d00001

-- 
2.47.2

